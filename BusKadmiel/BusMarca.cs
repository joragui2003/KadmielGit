using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.DatKamiel;

namespace Kadmiel.BusKadmiel
{
    public class BusMarca
    {
        public BusMarca()
        {
        }
        public List<EntMarca> obtenerMarca(int id)
        {
            DatMarca obj = new DatMarca();
            DataTable dt = obj.obtenerMarca(id);
            List<EntMarca> lst = new List<EntMarca>();
            foreach (DataRow r in dt.Rows)
            {
                EntMarca marca = new EntMarca();
                marca.IdMarca = Convert.ToInt32(r["BASEDATOS"]);
                marca.Marca = r["PANTALLA"].ToString();
                lst.Add(marca);
            }
            return lst;
        }
        public List<EntMarca> obtenerMarca()
        {
            DatMarca obj = new DatMarca();
            DataTable dt = obj.obtenerMarca();
            List<EntMarca> lst = new List<EntMarca>();
            foreach (DataRow r in dt.Rows)
            {
                EntMarca marca = new EntMarca();
                marca.IdMarca = Convert.ToInt32(r["BASEDATOS"]);
                marca.Marca = r["PANTALLA"].ToString();
                lst.Add(marca);
            }
            return lst;
        }
    }
}
