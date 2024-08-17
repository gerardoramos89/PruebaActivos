using Microsoft.AspNetCore.Mvc.Rendering;

namespace MVC_Dapper.Models
{
    public class Clientes
    {
        public int Id { get; set; }

        public string? razonsocial { get; set; }

        public int idtipocliente { get; set; }
        public DateTime fechacreacion { get; set; }
        public string? rfc { get; set; }

    }
}
