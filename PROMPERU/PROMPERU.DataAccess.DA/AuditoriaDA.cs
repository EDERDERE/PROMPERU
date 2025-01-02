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
    public class AuditoriaDA
    {
        private readonly ConexionDA conexionBD;

        public AuditoriaDA()
        {
            conexionBD = new ConexionDA();
        }
        public void RegistrarAuditoria(string usuario,string accion, string ip,int Id)
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("USP_Auditoria_INS", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        // Pasamos los parámetros necesarios para registrar la auditoría
                        comando.Parameters.AddWithValue("@Prog_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Clie_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Bann_ID", Id);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Info_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Requ_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Insc_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Bene_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Cexi_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Egra_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Cont_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Curs_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Mult_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Usua_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Preg_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Resp_ID", DBNull.Value);  // O el valor correspondiente
                        comando.Parameters.AddWithValue("@Eval_ID", DBNull.Value);  // O el valor correspondiente

                        // Información de auditoría
                        comando.Parameters.AddWithValue("@Audi_Usuario", usuario); // Usuario que realiza la acción
                        comando.Parameters.AddWithValue("@Audi_UsuarioEdicion", DBNull.Value); // Si aplica
                        comando.Parameters.AddWithValue("@Audi_UsuarioEliminacion", DBNull.Value); // Si aplica
                        comando.Parameters.AddWithValue("@Audi_FechaCreacion", DateTime.Now); // Fecha de la acción
                        comando.Parameters.AddWithValue("@Audi_FechaEdicion", DBNull.Value); // Si aplica
                        comando.Parameters.AddWithValue("@Audi_FechaEliminacion", DBNull.Value); // Si aplica
                        comando.Parameters.AddWithValue("@Audi_IpCreacion", ip); // IP de la acción
                        comando.Parameters.AddWithValue("@Audi_IpEdicion", DBNull.Value); // Si aplica
                        comando.Parameters.AddWithValue("@Audi_IpEliminacion", DBNull.Value); // Si aplica
                                                                                              
                        // Acción que se va a realizar: I = Insertar, A = Actualizar, E = Eliminar
                        comando.Parameters.AddWithValue("@Accion", accion);

                        conexion.Open();
                        comando.ExecuteNonQuery(); // Ejecuta el procedimiento almacenado
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejo de excepciones, por ejemplo, logueando el error
                throw new Exception("Error al registrar la auditoría.", ex);
            }
        }

    }
}
