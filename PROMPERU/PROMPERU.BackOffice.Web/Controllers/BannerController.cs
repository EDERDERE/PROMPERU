using PROMPERU.BussinessEntity.BE;
using PROMPERU.BussinessLogic.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PROMPERU.FrontOffice.Web.Controllers
{
    public class BannerController : Controller
    {
        private readonly BannerBL bannerBL;

        public BannerController()
        {
            bannerBL = new BannerBL();
        }

        [HttpGet]
        public ActionResult ListarBanners()
        {
            try
            {
                var banners = bannerBL.ListarBanners();
                return View(banners); // Asegúrate de tener una vista asociada
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Error"); // Vista de error
            }
        }

        [HttpPost]
        public ActionResult InsertarBanner(BannerBE banner)
        {
            try
            {
                string usuario = User.Identity.Name; // Usuario autenticado
                string ip = Request.UserHostAddress; // IP del cliente
                bannerBL.InsertarBanner(banner, usuario, ip);
                return RedirectToAction("ListarBanners");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult ActualizarBanner(BannerBE banner, int id)
        {
            try
            {
                string usuario = User.Identity.Name;
                string ip = Request.UserHostAddress;
                bannerBL.ActualizarBanner(banner, usuario, ip, id);
                return RedirectToAction("ListarBanners");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult EliminarBanner(int bannID, int id)
        {
            try
            {
                string usuario = User.Identity.Name;
                string ip = Request.UserHostAddress;
                bannerBL.EliminarBanner(bannID, usuario, ip, id);
                return RedirectToAction("ListarBanners");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult ObtenerBanner(int bannID)
        {
            try
            {
                var banner = bannerBL.ObtenerBanner(bannID);
                return View(banner); // Asegúrate de tener una vista para mostrar un banner
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Error");
            }
        }
    }
}