using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Furniture.Entities
{
    public class Product
    {
        [Key]
        public int productID { get; set; }
        public string productName { get; set; }
        public string productFeatures { get; set; }
        public decimal productPrice { get; set; }
        public int CategoryID { get; set; }
        public string imageUrl { get; set; }
        public virtual Category Category { get; set; }    //ürünün kategorisi
    }
}
