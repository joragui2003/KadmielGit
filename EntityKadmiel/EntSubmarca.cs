using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kadmiel.BusKadmiel.EntityKadmiel
{
    public class EntSubmarca
    {
        public EntSubmarca()
        {
        }
        private int idSubmarca;
        public int IdSubmarca
        {
            get { return idSubmarca; }
            set { idSubmarca = value; }
        }

        private int marcaSub;
        public int MarcaSub
        {
            get { return marcaSub; }
            set { marcaSub = value; }
        }

        private string submarca;
        public string Submarca
        {
            get { return submarca; }
            set { submarca = value; }
        }
    }
}
