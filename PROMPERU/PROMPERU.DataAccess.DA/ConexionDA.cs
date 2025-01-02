using System.Data.SqlClient;
using System.Configuration;
namespace PROMPERU.DataAccess.DA
{
    public class ConexionDA
    {
        private readonly string cadenaConexion;

        public ConexionDA()
        {
            // Obtiene la cadena de conexión desde el archivo Web.config
            cadenaConexion = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        }

        public SqlConnection ObtenerConexion()
        {
            return new SqlConnection(cadenaConexion);
        }
    }
}
