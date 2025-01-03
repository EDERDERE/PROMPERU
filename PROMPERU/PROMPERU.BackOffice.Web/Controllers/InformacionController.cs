using PROMPERU.BussinessEntity.BE;
using PROMPERU.BussinessLogic.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PROMPERU.FrontOffice.Web.Controllers
{
    public class InformacionController : Controller
    {
        private readonly InformacionBL informacionBL;

        public InformacionController()
        {
            informacionBL = new InformacionBL();
        }

        // Método para crear nueva información
        public ActionResult CrearInformacion(InformacionBE informacion, string usuario, string ip)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    int idGenerado = informacionBL.InsertarInformacion(informacion, usuario, ip);
                    ViewBag.Mensaje = "Información creada exitosamente. ID generado: " + idGenerado;
                    return View("Resultado");
                }
                ViewBag.Error = "Modelo inválido.";
                return View("Error");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Ocurrió un error: " + ex.Message;
                return View("Error");
            }
        }

        // Método para eliminar información
        public ActionResult EliminarInformacion(int id, string usuario, string ip)
        {
            try
            {
                if (id <= 0)
                {
                    ViewBag.Error = "ID inválido.";
                    return View("Error");
                }

                int filasAfectadas = informacionBL.EliminarInformacion(id, usuario, ip);
                ViewBag.Mensaje = filasAfectadas > 0 ? "Información eliminada exitosamente." : "No se encontró información para eliminar.";
                return View("Resultado");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Ocurrió un error: " + ex.Message;
                return View("Error");
            }
        }

        // Método para actualizar información
        public ActionResult ActualizarInformacion(InformacionBE informacion, string usuario, string ip, int id)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    int filasAfectadas = informacionBL.ActualizarInformacion(informacion, usuario, ip, id);
                    ViewBag.Mensaje = filasAfectadas > 0 ? "Información actualizada exitosamente." : "No se encontró información para actualizar.";
                    return View("Resultado");
                }
                ViewBag.Error = "Modelo inválido.";
                return View("Error");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Ocurrió un error: " + ex.Message;
                return View("Error");
            }
        }

        // Método para obtener información por ID
        public ActionResult ObtenerInformacion(int id)
        {
            try
            {
                if (id <= 0)
                {
                    ViewBag.Error = "ID inválido.";
                    return View("Error");
                }

                var informacion = informacionBL.ObtenerInformacion(id);
                if (informacion != null)
                {
                    return View("Detalle", informacion);
                }
                ViewBag.Error = "No se encontró información con el ID proporcionado.";
                return View("Error");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Ocurrió un error: " + ex.Message;
                return View("Error");
            }
        }

        // Método para listar toda la información
        public ActionResult ListarInformacion()
        {
            try
            {
                var datos = informacionBL.ListarInformacion();
                return View("Lista", datos);
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Ocurrió un error: " + ex.Message;
                return View("Error");
            }
        }

        // Método para generar reporte de información
        public ActionResult ReporteInformacion()
        {
            try
            {
                var datos = informacionBL.ReporteInformacion();
                return View("Reporte", datos);
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Ocurrió un error: " + ex.Message;
                return View("Error");
            }
        }
    }
}