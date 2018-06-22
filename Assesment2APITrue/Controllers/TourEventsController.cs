using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Assesment2APITrue.Models;

namespace Assesment2APITrue.Controllers
{
    public class TourEventsController : Controller
    {
        private Assesment2Entities db = new Assesment2Entities();

        // GET: TourEvents
        public ActionResult Index()
        {
            var tourEvents = db.TourEvents.Include(t => t.Tour);
            return View(tourEvents.ToList());
        }

        // GET: TourEvents/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TourEvent tourEvent = db.TourEvents.Find(id);
            if (tourEvent == null)
            {
                return HttpNotFound();
            }
            return View(tourEvent);
        }

        // GET: Bookings/Details/5
        public ActionResult Booking(int? id)
        {
            var bookings = db.Bookings.Include(b => b.Client).Include(b => b.Tour).Include(b => b.TourEvent);
            if (bookings == null)
            {
                return HttpNotFound();
            }
            bookings = bookings.Where(x => x.TourEventId == id);
            return View(bookings.ToList());
        }

        // GET: TourEvents/Create
        public ActionResult Create()
        {
            ViewBag.TourName = new SelectList(db.Tours, "TourName", "TourName");
            return View();
        }

        // POST: TourEvents/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TourEventId,TourName,EventMonth,EventDay,EventYear,Fee")] TourEvent tourEvent)
        {
            if (ModelState.IsValid)
            {
                db.TourEvents.Add(tourEvent);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TourName = new SelectList(db.Tours, "TourName", "TourName", tourEvent.TourName);
            return View(tourEvent);
        }

        // GET: TourEvents/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TourEvent tourEvent = db.TourEvents.Find(id);
            if (tourEvent == null)
            {
                return HttpNotFound();
            }
            ViewBag.TourName = new SelectList(db.Tours, "TourName", "TourName", tourEvent.TourName);
            return View(tourEvent);
        }

        // POST: TourEvents/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TourEventId,TourName,EventMonth,EventDay,EventYear,Fee")] TourEvent tourEvent)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tourEvent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TourName = new SelectList(db.Tours, "TourName", "TourName", tourEvent.TourName);
            return View(tourEvent);
        }

        // GET: TourEvents/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TourEvent tourEvent = db.TourEvents.Find(id);
            if (tourEvent == null)
            {
                return HttpNotFound();
            }
            return View(tourEvent);
        }

        // POST: TourEvents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TourEvent tourEvent = db.TourEvents.Find(id);
            db.TourEvents.Remove(tourEvent);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
