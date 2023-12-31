using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelFirstWebsite_Plaza.Models;

namespace ModelFirstWebsite_Plaza.Controllers
{
    public class FirmalarController : Controller
    {
        Model1Container db = new Model1Container();
        // GET: Firmalar
        public ActionResult Index()
        {
            var result = db.CompanySet.ToList();
            return View(result);
        }

        [HttpGet]
        public ActionResult Ekle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Ekle(Company company)
        {
            try
            {
                db.CompanySet.Add(company);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [HttpGet]
        public ActionResult Sil(int id)
        {
            var result = db.CompanySet.Where(x => x.CompanyNo == id).FirstOrDefault();
            return View(result);
        }

        [HttpPost]
        public ActionResult Sil(int id, Company company)
        {
            company = db.CompanySet.Where(x => x.CompanyNo == id).FirstOrDefault();
            db.CompanySet.Remove(company);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Düzenle(int id)
        {
            var result = db.CompanySet.Where(x => x.CompanyNo == id).FirstOrDefault();
            return View(result);
        }

        [HttpPost]
        public ActionResult Düzenle(int id, Company company)
        {
            try
            {
                db.Entry(company).State = System.Data.Entity.EntityState.Modified;
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