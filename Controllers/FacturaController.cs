using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using MVC_Dapper.Data;
using MVC_Dapper.Models;

namespace MVC_Dapper.Controllers
{
    public class FacturaController : Controller
    {
        private readonly IFactura _ifactura;
        private readonly IClientes _iclientes;

        public bool BuscarPorCliente { get; set; }
        public bool BuscarPorFactura { get; set; }

        public FacturaController(IFactura ifactura, IClientes iclientes)
        {
            _ifactura = ifactura;
            _iclientes = iclientes;
        }

        public IActionResult Index()
        {

            var facturas = _ifactura.ObtenerFactura();
            var clientes = _iclientes.ObtenerClientes();
            ViewBag.clientes = clientes;
            return View(facturas);

        }

        public IActionResult Crear()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Buscar(string opcionBusqueda)
        {
            if (opcionBusqueda == "Cliente")
            {
                // Realiza la búsqueda por cliente
            }

            else if (opcionBusqueda == "Factura")
            {
                // Realiza la búsqueda por factura
            }

            // Resto de la lógica para procesar la búsqueda

            return View();
        }
    }
}