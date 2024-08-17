using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using MVC_Dapper.Data;
using MVC_Dapper.Models;


namespace MVC_Dapper.Controllers
{
    public class ClientesController : Controller
    {
        private readonly IClientes _iclientes;
        private readonly IFactura _ifactura;
        private readonly IProducto _iproducto;
        decimal totalfactura = 0;
        decimal subtotal = 0;


        public ClientesController(IClientes iclientes, IProducto iproductos, IFactura ifactura)
        {
            _iclientes = iclientes;
            _iproducto = iproductos;
            _ifactura = ifactura;
        }

        public IActionResult Index()
        {
            var clientes =   _iclientes.ObtenerClientes();
            var productos =   _iproducto.ObtenerProductos();
            ViewBag.productos = productos;
            ViewBag.subtotal = subtotal;
            ViewBag.totalfactura = totalfactura;
            ViewBag.impuesto = (19 * totalfactura) / 100;

            return View(clientes);
        }

        [HttpPost]
        public ActionResult MiMetodo(int selectedValue)
        {
            subtotal = selectedValue * subtotal;

            return RedirectToAction("Factura");
        }

        [HttpPost]
        public IActionResult Crear(int idcliente, int nfactura, int ntotalproductos, decimal totalimpuestos, decimal subtotalfactura, decimal itotalfactura)
        {
            var fechaActual = new DateTime();
            DateTime thisDay = DateTime.Now;

            // Formatea la fecha como yyyy-mm-dd (formato estándar para input tipo 'date')
            Factura ModelFactura = new Factura
            {
                idCliente = idcliente,
                numerofactura = nfactura,
                fechaemisionfactura = thisDay,
                totalfactura = itotalfactura,
                subtotalfactura = subtotalfactura,
                totalimpuesto = totalimpuestos,
                numerototalarticulos = ntotalproductos
            };
            _ifactura.CrearFactura(ModelFactura);


            return RedirectToAction("Index", "Factura");
        }
    }
}