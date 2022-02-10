using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Entities;
using Entities.Models;
using X.PagedList;

namespace ReservasApp.Controllers
{
    public class HabitacionesController : Controller
    {
        private readonly RepositoryContext _context;

        public HabitacionesController(RepositoryContext context)
        {
            _context = context;
        }

        // GET: Habitacions
        public async Task<IActionResult> Index(int? page)
        {
            // si viene nulo, aignarle 1
            int pageNumber = page ?? 1;
            int pageSize = 10;


            var habitaciones = _context.Habitacion.Include(h => h.Hotel).Include(h => h.TipoHabitacion);

            return View(await habitaciones.ToPagedListAsync(pageNumber, pageSize));
        }

        // GET: Habitacions/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var habitacion = await _context.Habitacion
                .Include(h => h.Hotel)
                .Include(h => h.TipoHabitacion)
                .FirstOrDefaultAsync(m => m.HabitacionId == id);
            if (habitacion == null)
            {
                return NotFound();
            }

            return View(habitacion);
        }

        // GET: Habitacions/Create
        public IActionResult Create()
        {
            ViewData["HotelId"] = new SelectList(_context.Hotel, "HotelId", "Nombre");
            ViewData["TipoHabitacionId"] = new SelectList(_context.TipoHabitacion, "TipoHabitacionId", "Descripcion");
            return View();
        }

        // POST: Habitacions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("HabitacionId,HotelId,TipoHabitacionId,NumeroHabitacion,Cupo,Estado")] Habitacion habitacion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(habitacion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["HotelId"] = new SelectList(_context.Hotel, "HotelId", "Nombre", habitacion.HotelId);
            ViewData["TipoHabitacionId"] = new SelectList(_context.TipoHabitacion, "TipoHabitacionId", "Descripcion", habitacion.TipoHabitacionId);
            return View(habitacion);
        }

        // GET: Habitacions/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var habitacion = await _context.Habitacion.FindAsync(id);
            if (habitacion == null)
            {
                return NotFound();
            }
            ViewData["HotelId"] = new SelectList(_context.Hotel, "HotelId", "Nombre", habitacion.HotelId);
            ViewData["TipoHabitacionId"] = new SelectList(_context.TipoHabitacion, "TipoHabitacionId", "Descripcion", habitacion.TipoHabitacionId);
            return View(habitacion);
        }

        // POST: Habitacions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("HabitacionId,HotelId,TipoHabitacionId,NumeroHabitacion,Cupo,Estado")] Habitacion habitacion)
        {
            if (id != habitacion.HabitacionId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(habitacion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HabitacionExists(habitacion.HabitacionId))
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
            ViewData["HotelId"] = new SelectList(_context.Hotel, "HotelId", "Nombre", habitacion.HotelId);
            ViewData["TipoHabitacionId"] = new SelectList(_context.TipoHabitacion, "TipoHabitacionId", "Descripcion", habitacion.TipoHabitacionId);
            return View(habitacion);
        }

        // GET: Habitacions/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var habitacion = await _context.Habitacion
                .Include(h => h.Hotel)
                .Include(h => h.TipoHabitacion)
                .FirstOrDefaultAsync(m => m.HabitacionId == id);
            if (habitacion == null)
            {
                return NotFound();
            }

            return View(habitacion);
        }

        // POST: Habitacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var habitacion = await _context.Habitacion.FindAsync(id);
            _context.Habitacion.Remove(habitacion);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HabitacionExists(int id)
        {
            return _context.Habitacion.Any(e => e.HabitacionId == id);
        }
    }
}
