using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Entities;
using Entities.Models;

namespace ReservasApp.Controllers
{
    public class CostoHabitacionesController : Controller
    {
        private readonly RepositoryContext _context;

        public CostoHabitacionesController(RepositoryContext context)
        {
            _context = context;
        }

        // GET: CostoHabitacions
        public async Task<IActionResult> Index()
        {
            var repositoryContext = _context.CostoHabitacion.Include(c => c.Hotel).Include(c => c.Temporada).Include(c => c.TipoHabitacion);
            return View(await repositoryContext.ToListAsync());
        }

        // GET: CostoHabitacions/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var costoHabitacion = await _context.CostoHabitacion
                .Include(c => c.Hotel)
                .Include(c => c.Temporada)
                .Include(c => c.TipoHabitacion)
                .FirstOrDefaultAsync(m => m.CostoHabitacionID == id);
            if (costoHabitacion == null)
            {
                return NotFound();
            }

            return View(costoHabitacion);
        }

        // GET: CostoHabitacions/Create
        public IActionResult Create()
        {
            ViewData["HotelId"] = new SelectList(_context.Hotel, "HotelId", "Nombre");
            ViewData["TemporadaId"] = new SelectList(_context.Set<Temporada>(), "TemporadaId", "Descripcion");
            ViewData["TipoHabitacionId"] = new SelectList(_context.TipoHabitacion, "TipoHabitacionId", "Descripcion");
            return View();
        }

        // POST: CostoHabitacions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CostoHabitacionID,HotelId,TipoHabitacionId,TemporadaId,Precio")] CostoHabitacion costoHabitacion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(costoHabitacion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["HotelId"] = new SelectList(_context.Hotel, "HotelId", "Nombre", costoHabitacion.HotelId);
            ViewData["TemporadaId"] = new SelectList(_context.Set<Temporada>(), "TemporadaId", "Descripcion", costoHabitacion.TemporadaId);
            ViewData["TipoHabitacionId"] = new SelectList(_context.TipoHabitacion, "TipoHabitacionId", "Descripcion", costoHabitacion.TipoHabitacionId);
            return View(costoHabitacion);
        }

        // GET: CostoHabitacions/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var costoHabitacion = await _context.CostoHabitacion.FindAsync(id);
            if (costoHabitacion == null)
            {
                return NotFound();
            }
            ViewData["HotelId"] = new SelectList(_context.Hotel, "HotelId", "Nombre", costoHabitacion.HotelId);
            ViewData["TemporadaId"] = new SelectList(_context.Set<Temporada>(), "TemporadaId", "Descripcion", costoHabitacion.TemporadaId);
            ViewData["TipoHabitacionId"] = new SelectList(_context.TipoHabitacion, "TipoHabitacionId", "Descripcion", costoHabitacion.TipoHabitacionId);
            return View(costoHabitacion);
        }

        // POST: CostoHabitacions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CostoHabitacionID,HotelId,TipoHabitacionId,TemporadaId,Precio")] CostoHabitacion costoHabitacion)
        {
            if (id != costoHabitacion.CostoHabitacionID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(costoHabitacion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CostoHabitacionExists(costoHabitacion.CostoHabitacionID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["HotelId"] = new SelectList(_context.Hotel, "HotelId", "Nombre", costoHabitacion.HotelId);
            ViewData["TemporadaId"] = new SelectList(_context.Set<Temporada>(), "TemporadaId", "Descripcion", costoHabitacion.TemporadaId);
            ViewData["TipoHabitacionId"] = new SelectList(_context.TipoHabitacion, "TipoHabitacionId", "Descripcion", costoHabitacion.TipoHabitacionId);
            return View(costoHabitacion);
        }

        // GET: CostoHabitacions/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var costoHabitacion = await _context.CostoHabitacion
                .Include(c => c.Hotel)
                .Include(c => c.Temporada)
                .Include(c => c.TipoHabitacion)
                .FirstOrDefaultAsync(m => m.CostoHabitacionID == id);
            if (costoHabitacion == null)
            {
                return NotFound();
            }

            return View(costoHabitacion);
        }

        // POST: CostoHabitacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var costoHabitacion = await _context.CostoHabitacion.FindAsync(id);
            _context.CostoHabitacion.Remove(costoHabitacion);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CostoHabitacionExists(int id)
        {
            return _context.CostoHabitacion.Any(e => e.CostoHabitacionID == id);
        }
    }
}
