using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using ModelFirstWebsite_Plaza.Models;

namespace ModelFirstWebsite_Plaza.Controllers
{
    public class DepartmanlarController : Controller
    {
        Model1Container db = new Model1Container();
        // GET: Departmanlar
        public ActionResult Index()
        {
            var result = db.DepartmentSet.ToList();
            return View(result);
        }

        [HttpGet]
        public ActionResult Ekle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Ekle(Department department)
        {
            try
            {
                db.DepartmentSet.Add(department);
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
            var result = db.DepartmentSet.Where(x => x.DepartmentNo == id).FirstOrDefault();
            return View(result);
        }

        [HttpPost]
        public ActionResult Sil(int id, Department department)
        {
            department = db.DepartmentSet.Where(x=>x.DepartmentNo==id).FirstOrDefault();
            db.DepartmentSet.Remove(department);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Düzenle(int id)
        {
            var result = db.DepartmentSet.Where(x=>x.DepartmentNo==id).FirstOrDefault();
            return View(result);
        }

        [HttpPost]
        public ActionResult Düzenle(int id, Department department)
        {
            try
            {
                db.Entry(department).State = System.Data.Entity.EntityState.Modified;
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