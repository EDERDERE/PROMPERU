using PROMPERU.BussinessEntity.BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PROMPERU.DataAccess.DA
{
    public class UsuarioDA
    {
        private readonly ConexionDA conexionBD;

        public UsuarioDA()
        {
            conexionBD = new ConexionDA();
        }

        public UsuarioBE ValidarUsuario(string usuario, string contraseniaHash)
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("USP_ValidarUsuario", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        // Parámetros
                        comando.Parameters.AddWithValue("@Usuario", usuario);
                        comando.Parameters.AddWithValue("@Contrasenia", contraseniaHash);

                        conexion.Open();

                        using (SqlDataReader reader = comando.ExecuteReader())
                        {
                            // Si hay resultados, se crea y devuelve el objeto Usuario
                            if (reader.Read())
                            {
                                return new UsuarioBE
                                {
                                    Usua_ID = Convert.ToInt32(reader["Usua_ID"]),
                                    Usua_Usuario = reader["Usua_Usuario"].ToString(),
                                    Usua_Contrasenia = reader["Usua_Contrasenia"].ToString(),
                                    Usua_Cargo = reader["Usua_Cargo"].ToString()
                                };
                            }
                        }
                    }
                }

                // Si no hay resultados, devuelve null
                return null;
            }
            catch (Exception ex)
            {
                // Manejo del error, puedes registrar el error o lanzar una excepción personalizada
                throw new Exception("Error al validar el usuario.", ex);
            }
        }

    }
}
