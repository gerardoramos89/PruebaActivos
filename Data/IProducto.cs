using MVC_Dapper.Models;

namespace MVC_Dapper.Data
{
    public interface IProducto
    {
        IEnumerable<Productos> ObtenerProductos();
        Productos ObtenerProductoPorId(int id);
        void InsertarProducto(Productos producto);
        void ActualizarProducto(Productos producto);
        void EliminarProducto(int id);
    }
}