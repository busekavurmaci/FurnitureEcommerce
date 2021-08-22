using Furniture.DataAccessLayer;
using Furniture.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FurnitureEcommerce.Controllers
{
    public class LoginController : Controller
    {
        public DatabaseContext c = new DatabaseContext();
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogIn(IFormCollection form)
        {
            if (ModelState.IsValid)
            {
                string user = form["userName"];
                string password = form["userPassword"];
                if (user == "admin" && password == "123")
                {
                    return RedirectToAction("Index", "Product");
                }
            }
            return RedirectToAction("Index", "Home");
        }
    }
}