using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kadmiel.BusKadmiel.EntityKadmiel
{
    public class EntEstado
    {
        public EntEstado()
        {
        }
        private int idEstado;
        public int IdEstado
        {
            get { return idEstado; }
            set { idEstado = value; }
        }

        private string estado;
        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }
    }
}
