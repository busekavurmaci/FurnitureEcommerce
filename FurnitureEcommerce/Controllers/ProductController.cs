using Microsoft.AspNetCore.Mvc;
using Furniture.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Furniture.DataAccessLayer;
using Microsoft.EntityFrameworkCore;
using System.Data.Entity;
using System.Text;
using System.Security.Claims;

namespace FurnitureEcommerce.Controllers
{
    public class ProductController : Controller
    {
        public DatabaseContext c = new();

        [HttpGet]
        public IActionResult Index()
        {
            var urunler = c.Product.ToList();
            return View(urunler);
        }

        [HttpGet]
        public IActionResult NewProduct()
        {
            return View();
        }

        [HttpPost]
        public IActionResult NewProduct(Product pr)
        {
            c.Product.Add(pr);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult DeleteProduct(int id)
        {
            var del = c.Product.Find(id);
            c.Product.Remove(del);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult GetProduct(int id)
        {
            var prod = c.Product.Find(id);
            return View("GetProduct", prod);
        }

        public IActionResult UpdateProduct(Product pr)
        {
            var prod = c.Product.Find(pr.productID);
            prod.productID = pr.productID;
            prod.productName = pr.productName;
            prod.productFeatures = pr.productFeatures;
            prod.productPrice = pr.productPrice;
            prod.CategoryID = pr.CategoryID;
            prod.imageUrl = pr.imageUrl;
            c.SaveChanges();
            return RedirectToAction("Index", "Product");
        }

    }
    }

   

