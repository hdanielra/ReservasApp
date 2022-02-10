using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Entities;
using Entities.Models;
using X.PagedList;
using Entities.ViewModels;
using AutoMapper;
using Contracts;
using System;

namespace ReservasApp.Controllers
{
    public class ReservasController : Controller
    {
        private readonly IRepositoryManager _repositoryManager;

        // IMapper: to map between two classes
        private readonly IMapper _mapper;


        public ReservasController(IRepositoryManager repositoryManager,
                                    RepositoryContext context, IMapper mapper)
        {
            _mapper = mapper;
            _repositoryManager = repositoryManager;
        }

        // GET: Reservas
        public async Task<IActionResult> Index(int? page)
        {
            // si viene nulo, aignarle 1
            int pageNumber = page ?? 1;
            int pageSize = 10;

            var reservas = _repositoryManager.Reserva
                .FindAll(trackChanges: false)
                .Include(r => r.Cliente)
                .Include(r => r.Habitacion)
                .ThenInclude(r => r.Hotel);


            return View(await reservas.ToPagedListAsync(pageNumber, pageSize));

        }

        // GET: Reservas
        [HttpPost]
        public async Task<IActionResult> Index(string? fechaInicial, string? fechaFinal)
        {
            int pageNumber = 1;
            int pageSize = 10;

            DateTime f1 = Convert.ToDateTime(fechaInicial);
            DateTime f2 = Convert.ToDateTime(fechaFinal);


            var reservas = _repositoryManager.Reserva
                .FindAll(trackChanges: false)
                .Include(r => r.Cliente)
                .Include(r => r.Habitacion)
                .ThenInclude(r => r.Hotel)
                .Where(r => (r.FechaInicio > f2 || r.FechaFin < f1));

            return View(await reservas.ToPagedListAsync(pageNumber, pageSize));

        }

        // GET: Reservas/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var reserva = await _repositoryManager.Reserva
                .FindByCondition(x => x.ReservaId.Equals(id), trackChanges: false)
                .Include(r => r.Cliente)
                .Include(r => r.Habitacion)
                .ThenInclude(r => r.Hotel)
                .FirstOrDefaultAsync();

            if (reserva == null)
            {
                return NotFound();
            }

            return View(reserva);
        }








        // GET: Reservas/Create
        public IActionResult Create()
        {

            Listas();
            return View();
        }

        private void Listas(int idHotel = 0)
        {
            if (idHotel == 0)
            {
                var h1 = _repositoryManager.Habitacion
                      .FindAll(trackChanges: false)
                      .Include(o => o.Hotel)
                      .Select(o => new
                      {
                          o.HabitacionId,
                          Descripcion = $"Habitación: {o.NumeroHabitacion} ( Hotel: {o.Hotel.Nombre} )"
                      });

                ViewData["HabitacionId"] = new SelectList(h1, "HabitacionId", "Descripcion");
            }
            else
            {
                var h2 = _repositoryManager.Habitacion
                      .FindAll(trackChanges: false)
                      .Include(o => o.Hotel)
                      .Where(o => o.HotelId == idHotel)
                      .Select(o => new
                      {
                          o.HabitacionId,
                          Descripcion = $"Habitación: {o.NumeroHabitacion} ( Hotel: {o.Hotel.Nombre} )"
                      });

                ViewData["HabitacionId"] = new SelectList(h2, "HabitacionId", "Descripcion");
            }

            ViewData["ClienteId"] = new SelectList(_repositoryManager.Cliente.FindAll(trackChanges: false).ToList(), "ClienteId", "Nombre");
            ViewData["HotelId"] = new SelectList(_repositoryManager.Hotel.FindAll(trackChanges: false).ToList(), "HotelId", "Nombre");


        }


        // POST: Reservas/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(ReservaViewModel reserva)
        {
            if (ModelState.IsValid)
            {
                // map the object
                Reserva r = _mapper.Map<Reserva>(reserva);

                _repositoryManager.Reserva.Create(r);
                await _repositoryManager.Save();
                return RedirectToAction(nameof(Index));
            }

            Listas();
            return View(reserva);
        }



        [HttpPost]
        public JsonResult ChangeHotel(int Id)
        {
            var habitaciones = _repositoryManager.Habitacion
                .FindAll(trackChanges: false)
                .Include(o => o.Hotel)
                .Where(a => a.HotelId == Id)
                .Select(o => new { o.HabitacionId, Descripcion = $"Habitación: {o.NumeroHabitacion} ( Hotel: {o.Hotel.Nombre} )" });


            ViewData["HabitacionId"] = new SelectList(habitaciones, "HabitacionId", "Descripcion");

            return Json(new SelectList(habitaciones, "HabitacionId", "Descripcion"));
        }







        // GET: Reservas/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var reserva = await _repositoryManager
                .Reserva
                .FindByCondition(o => o.ReservaId == id, trackChanges: false)
                .Include(r => r.Cliente)
                .Include(r => r.Habitacion)
                .FirstOrDefaultAsync();

            if (reserva == null)
            {
                return NotFound();
            }

            Listas(reserva.Habitacion.HotelId);

            // map the object (product -> productviewmodel)
            //ReservaViewModel r = _mapper.Map<ReservaViewModel>(reserva);

            ReservaViewModel r = Mapear(reserva);


            return View(r);
        }

        private ReservaViewModel Mapear(Reserva reserva)
        {

            ReservaViewModel r = new ReservaViewModel();
            r.ReservaId = reserva.ReservaId;
            r.ClienteId = reserva.ClienteId;
            r.HabitacionId = reserva.HabitacionId;
            r.HotelId = reserva.Habitacion.HotelId;
            r.FechaInicio = reserva.FechaInicio;
            r.FechaFin = reserva.FechaFin;
            r.Cliente = reserva.Cliente;
            r.Habitacion = reserva.Habitacion;
            r.Hotel = reserva.Habitacion.Hotel;

            return r;
        }


        // POST: Reservas/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, ReservaViewModel reserva)
        {
            if (id != reserva.ReservaId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // map the object
                    Reserva r = _mapper.Map<Reserva>(reserva);

                    _repositoryManager.Reserva.Update(r);
                    await _repositoryManager.Save();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ReservaExists(reserva.ReservaId))
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
            Listas(reserva.ReservaId);
            return View(reserva);
        }

        // GET: Reservas/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }


            var reserva = await _repositoryManager.Reserva
                .FindByCondition(x => x.ReservaId.Equals(id), trackChanges: false)
                .FirstOrDefaultAsync();

            if (reserva == null)
            {
                return NotFound();
            }

            return View(reserva);
        }

        // POST: Reservas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {

            var reserva = await _repositoryManager.Reserva
                .FindByCondition(x => x.ReservaId.Equals(id), trackChanges: false)
                .FirstOrDefaultAsync();


            _repositoryManager.Reserva.Delete(reserva);
            await _repositoryManager.Save();
            return RedirectToAction(nameof(Index));
        }

        private bool ReservaExists(int id)
        {
            return _repositoryManager.Reserva
              .FindByCondition(x => x.ReservaId.Equals(id), trackChanges: false)
              .Any();
        }
    }
}
