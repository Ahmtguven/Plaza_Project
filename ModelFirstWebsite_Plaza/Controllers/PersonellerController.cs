using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelFirstWebsite_Plaza.Models;

namespace ModelFirstWebsite_Plaza.Controllers
{
    public class PersonellerController : Controller
    {
        Model1Container db = new Model1Container();
        // GET: Personeller
        public ActionResult Index()
        {
            var result = db.PersonnelSet.ToList();
            return View(result);
        }

        [HttpGet]
        public ActionResult Ekle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Ekle(Personnel personel)
        {
            try
            {
                using (Model1Container con = new Model1Container())
                {
                    con.PersonnelSet.Add(personel);
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
        public ActionResult Sil(int id, Personnel personnel)
        {
            personnel = db.PersonnelSet.Where(x => x.PersonnelNo == id).FirstOrDefault();
            db.PersonnelSet.Remove(personnel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Düzenle(int id)
        {
            var result = db.PersonnelSet.Where(x => x.PersonnelNo == id).FirstOrDefault();
            return View(result);
        }

        [HttpPost]
        public ActionResult Düzenle(int id,Personnel personel)
        {
            db.Entry(personel).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }


    }
}