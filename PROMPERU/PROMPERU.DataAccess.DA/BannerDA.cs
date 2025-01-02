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
    public class BannerDA
    {
        private readonly ConexionDA conexionBD;
        private readonly AuditoriaDA auditoriaDA;

        public BannerDA()
        {
            conexionBD = new ConexionDA();
            auditoriaDA = new AuditoriaDA();
        }

        // Inserta un nuevo Banner y devuelve la fila creada
        public BannerBE InsertarBanner(BannerBE banner, string usuario, string ip)
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("USP_Banner_INS", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        // Parámetros
                        comando.Parameters.AddWithValue("@Mult_ID", banner.Mult_ID);
                        comando.Parameters.AddWithValue("@Bann_Orden", banner.Bann_Orden);
                        comando.Parameters.AddWithValue("@Bann_Nombre", banner.Bann_Nombre);

                        // Parámetro OUTPUT para obtener la fila creada
                        SqlParameter outBannID = new SqlParameter("@Bann_ID", SqlDbType.Int)
                        {
                            Direction = ParameterDirection.Output
                        };
                        comando.Parameters.Add(outBannID);

                        conexion.Open();
                        comando.ExecuteNonQuery();  // Ejecutamos la inserción

                        // Obtener el ID del nuevo registro insertado
                        int Bann_ID = (int)outBannID.Value;

                        // Si la inserción fue exitosa, insertamos el registro en la tabla Auditoria
                        if (Bann_ID > 0)
                        {
                            // Llamada al procedimiento de auditoría
                            auditoriaDA.RegistrarAuditoria(usuario,"I", ip, Bann_ID);
                        }
                       
                        // Devolver el objeto con la información de la fila insertada
                        return ObtenerBannerPorID(Bann_ID);  // Llamamos a un método para obtener los detalles completos del Banner
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al insertar el Banner", ex);
            }
        }

        // Método auxiliar para obtener el Banner por su ID
        private BannerBE ObtenerBannerPorID(int bannID)
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("USP_Banner_SEL", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.AddWithValue("@Bann_ID", bannID);

                        conexion.Open();
                        using (SqlDataReader reader = comando.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return new BannerBE
                                {
                                    Bann_ID = Convert.ToInt32(reader["Bann_ID"]),
                                    Mult_ID = Convert.ToInt32(reader["Mult_ID"]),
                                    Bann_Orden = Convert.ToInt32(reader["Bann_Orden"]),
                                    Bann_Nombre = reader["Bann_Nombre"].ToString()
                                };
                            }
                        }
                    }
                }

                return null;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener el Banner por ID", ex);
            }
        }

        // Elimina un Banner
        public int EliminarBanner(int bannID, string usuario, string ip, int Id)
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    // Comenzar una transacción para asegurar que tanto la eliminación como la auditoría se realicen correctamente
                    using (SqlTransaction transaccion = conexion.BeginTransaction())
                    {
                        // Eliminar el Banner
                        using (SqlCommand comando = new SqlCommand("USP_Banner_DEL", conexion, transaccion))
                        {
                            comando.CommandType = CommandType.StoredProcedure;
                            comando.Parameters.AddWithValue("@Bann_ID", bannID);

                            // Ejecutar la eliminación
                            int filasAfectadas = comando.ExecuteNonQuery();

                            // Si se eliminó correctamente, registrar la auditoría
                            if (filasAfectadas > 0)
                            {

                                // Llamada al procedimiento de auditoría
                                auditoriaDA.RegistrarAuditoria(usuario,"D", ip, Id);

                                // Si ambos procesos fueron exitosos, confirmar la transacción
                                transaccion.Commit();
                                return filasAfectadas;
                            }
                            else
                            {
                                // Si no se eliminó ninguna fila, revertir la transacción
                                transaccion.Rollback();
                                return 0;  // No se eliminó nada
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar el Banner y registrar la auditoría", ex);
            }
        }


        // Actualiza un Banner
        public int ActualizarBanner(BannerBE banner, string usuario, string ip,int Id)
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    // Comenzar una transacción para asegurar que tanto la actualización como la auditoría se realicen correctamente
                    using (SqlTransaction transaccion = conexion.BeginTransaction())
                    {
                        // Actualizar el Banner
                        using (SqlCommand comando = new SqlCommand("USP_Banner_UPD", conexion, transaccion))
                        {
                            comando.CommandType = CommandType.StoredProcedure;

                            // Parámetros para la actualización
                            comando.Parameters.AddWithValue("@Bann_ID", banner.Bann_ID);
                            comando.Parameters.AddWithValue("@Mult_ID", banner.Mult_ID);
                            comando.Parameters.AddWithValue("@Bann_Orden", banner.Bann_Orden);
                            comando.Parameters.AddWithValue("@Bann_Nombre", banner.Bann_Nombre);

                            // Ejecutar la actualización
                            int filasAfectadas = comando.ExecuteNonQuery();

                            // Si se actualizó correctamente, registrar la auditoría
                            if (filasAfectadas > 0)
                            {
                                // Llamada al procedimiento de auditoría
                                auditoriaDA.RegistrarAuditoria(usuario,"E", ip, Id);

                                // Si ambos procesos fueron exitosos, confirmar la transacción
                                transaccion.Commit();
                                return filasAfectadas;
                            }
                            else
                            {
                                // Si no se actualizó ninguna fila, revertir la transacción
                                transaccion.Rollback();
                                return 0;  // No se actualizó nada
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar el Banner y registrar la auditoría", ex);
            }
        }


        // Selecciona un Banner por ID
        public BannerBE ObtenerBanner(int bannID)
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("USP_Banner_SEL", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        // Parámetro
                        comando.Parameters.AddWithValue("@Bann_ID", bannID);

                        conexion.Open();

                        using (SqlDataReader reader = comando.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return new BannerBE
                                {
                                    Bann_ID = Convert.ToInt32(reader["Bann_ID"]),
                                    Mult_ID = Convert.ToInt32(reader["Mult_ID"]),
                                    Bann_Orden = Convert.ToInt32(reader["Bann_Orden"]),
                                    Bann_Nombre = reader["Bann_Nombre"].ToString()
                                };
                            }
                        }
                    }
                }

                return null;  // Si no se encuentra el Banner
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener el Banner", ex);
            }
        }

        // Lista todos los Banners
        public List<BannerBE> ListarBanners()
        {
            try
            {
                List<BannerBE> banners = new List<BannerBE>();

                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("USP_Banner_LIS", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        conexion.Open();

                        using (SqlDataReader reader = comando.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                banners.Add(new BannerBE
                                {
                                    Bann_ID = Convert.ToInt32(reader["Bann_ID"]),
                                    Mult_ID = Convert.ToInt32(reader["Mult_ID"]),
                                    Bann_Orden = Convert.ToInt32(reader["Bann_Orden"]),
                                    Bann_Nombre = reader["Bann_Nombre"].ToString()
                                });
                            }
                        }
                    }
                }

                return banners;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar los Banners", ex);
            }
        }

        // Genera un reporte de los Banners
        public DataTable ObtenerReporteBanners()
        {
            try
            {
                using (SqlConnection conexion = conexionBD.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("USP_Banner_RPT", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        SqlDataAdapter adapter = new SqlDataAdapter(comando);
                        DataTable dtBanners = new DataTable();
                        adapter.Fill(dtBanners);

                        return dtBanners;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al generar el reporte de los Banners", ex);
            }
        }

    }
}
