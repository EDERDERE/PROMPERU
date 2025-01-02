using PROMPERU.BussinessEntity.BE;
using PROMPERU.DataAccess.DA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace PROMPERU.BussinessLogic.BL
{
    public class UsuarioBL
    {
        private UsuarioDA usuarioDA = new UsuarioDA();

        public UsuarioBL()
        {
            usuarioDA = new UsuarioDA();
        }

        public bool ValidarUsuario(string usuario, string contrasenia)
        {
            // Encriptar la contraseña con SHA-256
            string contraseniaHash = ObtenerHashSHA256(contrasenia);

            // Llamar al acceso a datos para verificar si el usuario existe
            UsuarioBE usuarioBE = usuarioDA.ValidarUsuario(usuario, contraseniaHash);

            // Verificar si el usuario existe y las contraseñas coinciden
            return usuarioBE != null;
        }

        private string ObtenerHashSHA256(string texto)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(texto));
                return Convert.ToBase64String(hashBytes);
            }
        }
    }
}
