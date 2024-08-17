using Microsoft.AspNetCore.Mvc.Rendering;

namespace MVC_Dapper.Models
{
    public class Productos
    {
        public int Id { get; set; }
        public string? nombreproducto { get; set; }
        public byte[]? imagenproducto { get; set; }
        public decimal preciounitario { get; set; }
        public string? ext { get; set; }

        public static implicit operator Productos(List<SelectListItem> v)
        {
            throw new NotImplementedException();
        }
    }
}