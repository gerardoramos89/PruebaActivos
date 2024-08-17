using System.Data;
using Dapper;
using MVC_Dapper.Models;

namespace MVC_Dapper.Data
{
    public class FacturaImple : IFactura
    {
        private readonly Conexion _conexion;

        public FacturaImple(Conexion conexion)
        {
            _conexion = conexion;
        }

        public IEnumerable<Factura> ObtenerFactura()
        {
            using (var conexion = _conexion.ObtenerConexion())
            {
                return conexion.Query<Factura>("SPIObtenerFacturas", commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public void CrearFactura(Factura factura)
        {
            using (var conexion = _conexion.ObtenerConexion())
            {
                var parametros = new DynamicParameters();

                parametros.Add("@numerofactura", factura.numerofactura, DbType.Int64);
                parametros.Add("@fechaemisionfactura", factura.fechaemisionfactura, DbType.Date);
                parametros.Add("@numerofactura", factura.numerofactura, DbType.Int64);
                parametros.Add("@numerototalarticulos", factura.numerototalarticulos, DbType.Int64);
                parametros.Add("@subtotalfactura", factura.subtotalfactura, DbType.Decimal);
                parametros.Add("@totalimpuesto", factura.totalimpuesto, DbType.Decimal);
                parametros.Add("@totalimpuesto", factura.totalimpuesto, DbType.Decimal);
                parametros.Add("@idCliente", factura.idCliente, DbType.Int64);
                parametros.Add("@totalfactura", factura.totalfactura, DbType.Int64);



                conexion.Execute("SPIcrearfactura", parametros, commandType: CommandType.StoredProcedure);
            }
        }

    }
}