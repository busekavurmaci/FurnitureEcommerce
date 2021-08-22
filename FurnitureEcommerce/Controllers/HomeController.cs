using Furniture.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Furniture.DataAccessLayer;

namespace FurnitureEcommerce.Controllers
{
    public class HomeController : Controller
    {
        public DatabaseContext c = new();
        public IActionResult Index()
        {
            var urunler = c.Product.ToList();

            return View(urunler);
        }
        public IActionResult Contact()
        {
            return View();
        }

        //------------------ERROR--------------------------------------
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorView { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        //------------------THE END--------------------------------------
    }
}
