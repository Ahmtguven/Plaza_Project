using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelFirstWebsite_Plaza.Models;

namespace ModelFirstWebsite_Plaza.Controllers
{
    public class PlazaController : Controller
    {
        Model1Container db = new Model1Container();
        // GET: Plaza
        public ActionResult Index()
        {
            var result = db.PlazaSet.ToList();
            return View(result);
        }

        [HttpGet]

        public ActionResult Ekle()
        {
            return View();
        }

        [HttpPost]

        public ActionResult Ekle(Plaza plaza)
        {
            try
            {
                using (Model1Container con = new Model1Container())
                {
                    con.PlazaSet.Add(plaza);
                    con.SaveChanges();
                    return RedirectToAction("Index");
                }
                
            }
            catch
            {
                return View();
            }
        }

        [HttpGet]
        public ActionResult Sil(int id)
        {
            var result = db.PersonnelSet.Where(x => x.PersonnelNo == id).FirstOrDefault();
                return View(result);
        }

        [HttpPost]
        public ActionResult Sil(int id, Plaza plaza)
        {
   
              plaza = db.PlazaSet.Where(x => x.PlazaNo == id).FirstOrDefault();
            db.PlazaSet.Remove(plaza);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        [HttpGet]

        public ActionResult Düzenle(int id)
        {
            var result = db.PlazaSet.Where(x => x.PlazaNo == id).FirstOrDefault();

            return View(result);
        
        }

        [HttpPost]

        public ActionResult Düzenle(int id, Plaza plaza)
        {
            try
            {
                db.Entry(plaza).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        
    }
}