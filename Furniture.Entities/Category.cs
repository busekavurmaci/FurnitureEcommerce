using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Furniture.Entities
{
    public class Category
    {
        [Key] //alt satırındaki propertynin primary key olmasını sağlar.
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public virtual List<Product> Products { get; set; }    //kategorideki ürünler
    }
}
