using MVC_Dapper.Models;

namespace MVC_Dapper.Data
{
    public interface IFactura
    {
        IEnumerable<Factura> ObtenerFactura();

        void CrearFactura(Factura factura);

    }
}