using PROMPERU.BussinessEntity.BE;
using PROMPERU.DataAccess.DA;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace PROMPERU.BussinessLogic.BL
{
    public class InformacionBL
    {
        private readonly InformacionDA informacionDA;

        public InformacionBL()
        {
            informacionDA = new InformacionDA();
        }

        // Insertar Información con auditoría
        public int InsertarInformacion(InformacionBE informacion, string usuario, string ip)
        {
            try
            {
                if (informacion == null)
                    throw new ArgumentNullException(nameof(informacion), "La información no puede ser nula.");

                if (string.IsNullOrWhiteSpace(usuario))
                    throw new ArgumentException("El usuario no puede estar vacío.", nameof(usuario));

                if (string.IsNullOrWhiteSpace(ip))
                    throw new ArgumentException("La IP no puede estar vacía.", nameof(ip));

                return informacionDA.InsertarInformacion(informacion, usuario, ip);
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al insertar la información", ex);
            }
        }

        // Eliminar Información con auditoría
        public int EliminarInformacion(int infoID, string usuario, string ip)
        {
            try
            {
                if (infoID <= 0)
                    throw new ArgumentException("El ID de la información debe ser mayor a 0.", nameof(infoID));

                if (string.IsNullOrWhiteSpace(usuario))
                    throw new ArgumentException("El usuario no puede estar vacío.", nameof(usuario));

                if (string.IsNullOrWhiteSpace(ip))
                    throw new ArgumentException("La IP no puede estar vacía.", nameof(ip));

                return informacionDA.EliminarInformacion(infoID, usuario, ip);
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al eliminar la información", ex);
            }
        }

        // Actualizar Información con auditoría
        public int ActualizarInformacion(InformacionBE informacion, string usuario, string ip, int id)
        {
            try
            {
                if (informacion == null)
                    throw new ArgumentNullException(nameof(informacion), "La información no puede ser nula.");

                if (string.IsNullOrWhiteSpace(usuario))
                    throw new ArgumentException("El usuario no puede estar vacío.", nameof(usuario));

                if (string.IsNullOrWhiteSpace(ip))
                    throw new ArgumentException("La IP no puede estar vacía.", nameof(ip));

                if (id <= 0)
                    throw new ArgumentException("El ID debe ser mayor a 0.", nameof(id));

                return informacionDA.ActualizarInformacion(informacion, usuario, ip, id);
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al actualizar la información", ex);
            }
        }

        // Obtener Información por ID
        public InformacionBE ObtenerInformacion(int infoID)
        {
            try
            {
                if (infoID <= 0)
                    throw new ArgumentException("El ID de la información debe ser mayor a 0.", nameof(infoID));

                return informacionDA.ObtenerInformacion(infoID);
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al obtener la información", ex);
            }
        }

        // Listar toda la Información
        public DataTable ListarInformacion()
        {
            try
            {
                return informacionDA.ListarInformacion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al listar la información", ex);
            }
        }

        // Reporte de Información
        public DataTable ReporteInformacion()
        {
            try
            {
                return informacionDA.ReporteInformacion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al generar el reporte de la información", ex);
            }
        }
    }
}
