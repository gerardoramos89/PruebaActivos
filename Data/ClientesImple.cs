using System.Data;
using Dapper;
using MVC_Dapper.Models;

namespace MVC_Dapper.Data
{
    public class ClientesImple : IClientes
    {
        private readonly Conexion _conexion;

        public ClientesImple(Conexion conexion)
        {
            _conexion = conexion;
        }

        public IEnumerable<Clientes> ObtenerClientes()
        {
            using (var conexion = _conexion.ObtenerConexion())
            {
                return conexion.Query<Clientes>("SPIObtenerclientes", commandType: CommandType.StoredProcedure).ToList();
            }
        }

    }
}