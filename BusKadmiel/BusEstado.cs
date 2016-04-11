using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.DatKamiel;

namespace Kadmiel.BusKadmiel
{
    public class BusEstado
    {
        public BusEstado()
        {
        }
        public List<EntEstado> obtenerEstados()
        {
            DatEstado obj = new DatEstado();
            DataTable dt = obj.obtenerEstados();
            List<EntEstado> lst = new List<EntEstado>();
            foreach (DataRow r in dt.Rows)
            {
                EntEstado estado = new EntEstado();
                estado.IdEstado = Convert.ToInt32(r["ESTADO_ID"]);
                estado.Estado = r["ESTADO"].ToString();
                lst.Add(estado);
            }
            return lst;
        }
    }
}
