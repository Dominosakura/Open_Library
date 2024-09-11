using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Open_Library.Models;

namespace Open_Library.Controllers
{
    public class ChuDeController : Controller
    {
        // GET: ChuDe
        OpenLibraryEntities db = new OpenLibraryEntities();
        public ActionResult Index()
        {
            var ListCD = db.CHUDEs.ToList();
            return View(ListCD);
        }
    }
}