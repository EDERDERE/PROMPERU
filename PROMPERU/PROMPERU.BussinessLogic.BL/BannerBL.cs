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
    public class BannerBL
    {
        private readonly BannerDA bannerDA;

        public BannerBL()
        {
            bannerDA = new BannerDA();
        }

        public BannerBE InsertarBanner(BannerBE banner, string usuario, string ip)
        {
            try
            {
                return bannerDA.InsertarBanner(banner, usuario, ip);
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al insertar el Banner", ex);
            }
        }

        public bool ActualizarBanner(BannerBE banner, string usuario, string ip, int id)
        {
            try
            {
                return bannerDA.ActualizarBanner(banner, usuario, ip, id) > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al actualizar el Banner", ex);
            }
        }

        public bool EliminarBanner(int bannID, string usuario, string ip, int id)
        {
            try
            {
                return bannerDA.EliminarBanner(bannID, usuario, ip, id) > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al eliminar el Banner", ex);
            }
        }

        public BannerBE ObtenerBanner(int bannID)
        {
            try
            {
                return bannerDA.ObtenerBanner(bannID);
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al obtener el Banner", ex);
            }
        }

        public List<BannerBE> ListarBanners()
        {
            try
            {
                return bannerDA.ListarBanners();
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al listar los Banners", ex);
            }
        }

        public DataTable ObtenerReporteBanners()
        {
            try
            {
                return bannerDA.ObtenerReporteBanners();
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la lógica de negocio al generar el reporte de los Banners", ex);
            }
        }
    }
}
