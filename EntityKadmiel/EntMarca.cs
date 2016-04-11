using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kadmiel.BusKadmiel.EntityKadmiel
{
    public class EntMarca
    {
        public EntMarca()
        {
        }
        private int idMarca;
        public int IdMarca
        {
            get { return idMarca; }
            set { idMarca = value; }
        }

        private string marca;
        public string Marca
        {
            get { return marca; }
            set { marca = value; }
        }
    }
}
