using PROMPERU.BussinessEntity.BE;
using PROMPERU.BussinessLogic.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PROMPERU.FrontOffice.Web.Controllers
{
    public class CuentaController : Controller
    {
        // GET: Cuenta
        private UsuarioBL usuarioBL = new UsuarioBL();

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string usuario, string contrasenia)
        {
            bool isValidUser = usuarioBL.ValidarUsuario(usuario, contrasenia);

            if (isValidUser)
            {             
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.ErrorMessage = "Usuario o contraseña incorrectos.";
                return View();
            }       
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}