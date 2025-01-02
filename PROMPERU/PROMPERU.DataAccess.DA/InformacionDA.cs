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
    public class InformacionDA
    {
        private readonly ConexionDA conexionBD;
        private readonly AuditoriaDA auditoriaDA;
        public InformacionDA()
        {
            conexionBD = new ConexionDA();
            auditoriaDA = new AuditoriaDA();
        }

        // Insertar Información con auditoría
        public int InsertarInformacion(InformacionBE informacion, string usuario, string ip)
        {
            SqlTransaction transaction = null;
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    conexion.Open();
                    transaction = conexion.BeginTransaction();

                    using (SqlCommand comando = new SqlCommand("USP_Informacion_INS", conexion, transaction))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        comando.Parameters.AddWithValue("@Mult_ID", informacion.Mult_ID);
                        comando.Parameters.AddWithValue("@Info_Titulo", informacion.Info_Titulo);
                        comando.Parameters.AddWithValue("@Info_Descripcion", informacion.Info_Descripcion);

                        // Ejecutar el procedimiento y obtener el ID insertado
                        int infoID = Convert.ToInt32(comando.ExecuteScalar());

                        if (infoID > 0)
                        {
                            // Insertar auditoría
                            auditoriaDA.RegistrarAuditoria(usuario, "I", ip, infoID);

                        }                     

                        transaction.Commit();
                        return infoID; // Retorna el ID del registro insertado
                    }
                }
            }
            catch (Exception ex)
            {
                if (transaction != null) transaction.Rollback();
                throw new Exception("Error al insertar la Información", ex);
            }
        }

        // Eliminar Información con auditoría
        public int EliminarInformacion(int infoID, string usuario, string ip)
        {
            SqlTransaction transaction = null;
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    conexion.Open();
                    transaction = conexion.BeginTransaction();

                    using (SqlCommand comando = new SqlCommand("USP_Informacion_DEL", conexion, transaction))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.AddWithValue("@Info_ID", infoID);

                        int filasAfectadas = comando.ExecuteNonQuery(); // Devuelve el número de filas afectadas

                        if (filasAfectadas > 0)
                        {
                            // Insertar auditoría
                            auditoriaDA.RegistrarAuditoria(usuario, "I", ip, infoID);
                        }

                        transaction.Commit();
                        return filasAfectadas;
                    }
                }
            }
            catch (Exception ex)
            {
                if (transaction != null) transaction.Rollback();
                throw new Exception("Error al eliminar la Información", ex);
            }
        }

        // Actualizar Información con auditoría
        public int ActualizarInformacion(InformacionBE informacion, string usuario, string ip,int Id)
        {
            SqlTransaction transaction = null;
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    conexion.Open();
                    transaction = conexion.BeginTransaction();

                    using (SqlCommand comando = new SqlCommand("USP_Informacion_UPD", conexion, transaction))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        comando.Parameters.AddWithValue("@Info_ID", informacion.Info_ID);
                        comando.Parameters.AddWithValue("@Mult_ID", informacion.Mult_ID);
                        comando.Parameters.AddWithValue("@Info_Titulo", informacion.Info_Titulo);
                        comando.Parameters.AddWithValue("@Info_Descripcion", informacion.Info_Descripcion);

                        int filasAfectadas = comando.ExecuteNonQuery(); // Devuelve el número de filas afectadas

                        if (filasAfectadas > 0)
                        {
                            // Insertar auditoría
                            auditoriaDA.RegistrarAuditoria(usuario, "I", ip, Id);
                        }

                        transaction.Commit();
                        return filasAfectadas;
                    }
                }
            }
            catch (Exception ex)
            {
                if (transaction != null) transaction.Rollback();
                throw new Exception("Error al actualizar la Información", ex);
            }
        }


        // Obtener Información por ID
        public InformacionBE ObtenerInformacion(int infoID)
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("USP_Informacion_SEL", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.AddWithValue("@Info_ID", infoID);

                        conexion.Open();
                        using (SqlDataReader reader = comando.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return new InformacionBE
                                {
                                    Info_ID = Convert.ToInt32(reader["Info_ID"]),
                                    Mult_ID = Convert.ToInt32(reader["Mult_ID"]),
                                    Info_Titulo = reader["Info_Titulo"].ToString(),
                                    Info_Descripcion = reader["Info_Descripcion"].ToString()
                                };
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener la Información", ex);
            }
            return null;
        }

        // Listar toda la Información
        public DataTable ListarInformacion()
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter("USP_Informacion_LIS", conexion))
                    {
                        adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar la Información", ex);
            }
        }

        // Reporte de Información
        public DataTable ReporteInformacion()
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter("USP_Informacion_RPT", conexion))
                    {
                        adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al generar el reporte de la Información", ex);
            }

        }
    }
}
