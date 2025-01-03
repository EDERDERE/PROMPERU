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
        public JsonResult ListarBanners()
        {
            try
            {
                var banners = bannerBL.ListarBanners();
                return Json(new { success = true, data = banners }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

    }
}