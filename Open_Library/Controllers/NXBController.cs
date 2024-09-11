using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Open_Library.Models;

namespace Open_Library.Controllers
{
    public class NXBController : Controller
    {
        // GET: NXB
        OpenLibraryEntities db = new OpenLibraryEntities();
        public ActionResult Index()
        {
            var List = db.NHAXUATBANs.ToList();
            return View(List);
        }

        
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(NHAXUATBAN newNXB)
        {
            if (ModelState.IsValid)
            {
                db.NHAXUATBANs.Add(newNXB);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(newNXB);
        }

        public ActionResult Delete(int id)
        {
            var nxb = db.NHAXUATBANs.FirstOrDefault(n => n.MaNXB == id);
            db.NHAXUATBANs.Remove(nxb);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            var nxb = db.NHAXUATBANs.FirstOrDefault(n => n.MaNXB == id);
            return View(nxb);
        }

        public ActionResult Edit(int id)
        {
            var nxb = db.NHAXUATBANs.FirstOrDefault(n => n.MaNXB == id);
            return View(nxb);
        }

        [HttpPost]

        public ActionResult Edit(NHAXUATBAN newNXB)
        {
            if (ModelState.IsValid)
            {
                db.NHAXUATBANs.AddOrUpdate(newNXB);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(newNXB);
        }

    }
}