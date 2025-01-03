using NLog;
using System;

public static class LogManagerHelper
{
    // Logger estático que será utilizado en toda la capa lógica.
    private static readonly Logger logger = LogManager.GetCurrentClassLogger();

    // Método para inicializar NLog
    public static void Inicializar()
    {
        // Cargar configuración de NLog desde la ruta del archivo NLog.config
        NLog.LogManager.LoadConfiguration(AppDomain.CurrentDomain.BaseDirectory + "NLog.config");
    }

    // Método para registrar errores
    public static void LogError(string mensaje, Exception ex = null)
    {
        if (ex != null)
        {
            logger.Error(ex, mensaje); // Registrar error con excepción
        }
        else
        {
            logger.Error(mensaje); // Registrar solo mensaje
        }
    }

    // Método para registrar información
    public static void LogInfo(string mensaje)
    {
        logger.Info(mensaje);
    }
}
