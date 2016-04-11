using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.DatKamiel;

namespace Kadmiel.BusKadmiel
{
    public class BusClase
    {
        public BusClase()
        {
        }
        public List<EntClase> obtenerClase()
        {
            DatClase obj = new DatClase();
            DataTable dt = obj.obtenerClase();
            List<EntClase> lst = new List<EntClase>();
            foreach (DataRow r in dt.Rows)
            {
                EntClase clase = new EntClase();
                clase.IdClase = Convert.ToInt32(r["BASEDATOS"]);
                clase.Clase = r["PANTALLA"].ToString();
                lst.Add(clase);
            }
            return lst;
        }
    }
}
