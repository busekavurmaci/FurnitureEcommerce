using Furniture.DataAccessLayer;
using Furniture.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FurnitureEcommerce.Controllers
{

    public class CategoryController : Controller
    {
        public DatabaseContext c = new();
        public async Task<IActionResult> GetCategory(int id)
        {
            var catName = from p in c.Product
                          join ct in c.Category
                          on p.CategoryID equals ct.CategoryID
                          select ct.CategoryName;
            ViewBag.baslik = catName.ToString();
            var productList = await c.Product.Where(x => x.CategoryID == id).ToListAsync();
            return View("GetCategory", productList);
        }
    }
}
