using System.Data;
using Dapper;
using MVC_Dapper.Models;

namespace MVC_Dapper.Data
{
    public class ProductoImple : IProducto
    {
        private readonly Conexion _conexion;

        public ProductoImple(Conexion conexion)
        {
            _conexion = conexion;
        }
        public void ActualizarProducto(Productos producto)
        {
            using (var conexion = _conexion.ObtenerConexion())
            {
                var parametros = new DynamicParameters();
                parametros.Add("@Id", producto.Id, DbType.Int32);
                parametros.Add("@Nombre", producto.nombreproducto, DbType.String);
                parametros.Add("@Precio", producto.preciounitario, DbType.Decimal);
                conexion.Execute("ActualizarProducto", parametros, commandType: CommandType.StoredProcedure);
            }
        }

        public void EliminarProducto(int id)
        {
            using (var conexion = _conexion.ObtenerConexion())
            {
                var parametros = new DynamicParameters();
                parametros.Add("@Id", id, DbType.Int32);
                conexion.Execute("EliminarProducto", parametros, commandType: CommandType.StoredProcedure);
            }
        }

        public void InsertarProducto(Productos producto)
        {
            using (var conexion = _conexion.ObtenerConexion())
            {
                var parametros = new DynamicParameters();
                parametros.Add("@Nombre", producto.nombreproducto, DbType.String);
                parametros.Add("@Precio", producto.preciounitario, DbType.Decimal);
                conexion.Execute("InsertarProducto", parametros, commandType: CommandType.StoredProcedure);
            }
        }

        public Productos ObtenerProductoPorId(int id)
        {
            using (var conexion = _conexion.ObtenerConexion())
            {
                var parametros = new DynamicParameters();
                parametros.Add("@Id", id, DbType.Int32);
                return conexion.QueryFirstOrDefault<Productos>("ObtenerProductoPorId", parametros, commandType: CommandType.StoredProcedure);
            }
        }

        public IEnumerable<Productos> ObtenerProductos()
        {
            using (var conexion = _conexion.ObtenerConexion())
            {
                return conexion.Query<Productos>("SPIObtenerproductos", commandType: CommandType.StoredProcedure).ToList();
            }
        }
    }
}