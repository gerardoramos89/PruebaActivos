using MVC_Dapper.Models;

namespace MVC_Dapper.Data
{
    public interface IClientes
    {
        IEnumerable<Clientes> ObtenerClientes();
    }
}