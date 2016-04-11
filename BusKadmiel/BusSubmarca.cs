using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.DatKamiel;

namespace Kadmiel.BusKadmiel
{
    public class BusSubmarca
    {
        public BusSubmarca()
        {
        }
        public List<EntSubmarca> obtenerSubmarca(string idSub)
        {
            DatSubmarca obj = new DatSubmarca();
            DataTable dt = obj.obtenerSubmarca(idSub);
            List<EntSubmarca> lst = new List<EntSubmarca>();
            foreach (DataRow r in dt.Rows)
            {
                EntSubmarca submarca = new EntSubmarca();
                submarca.IdSubmarca = Convert.ToInt32(r["IDSUBMARCA"]);
                submarca.MarcaSub = Convert.ToInt32(r["MARCA"]);
                submarca.Submarca = r["PANTALLA"].ToString();
                lst.Add(submarca);
            }
            return lst;
        }
        public List<EntSubmarca> obtenerSubmarca(string marca, int idSub)
        {
            DatSubmarca obj = new DatSubmarca();
            DataTable dt = obj.obtenerSubmarca(marca, idSub);
            List<EntSubmarca> lst = new List<EntSubmarca>();
            foreach (DataRow r in dt.Rows)
            {
                EntSubmarca submarca = new EntSubmarca();
                submarca.IdSubmarca = Convert.ToInt32(r["IDSUBMARCA"]);
                submarca.MarcaSub = Convert.ToInt32(r["MARCA"]);
                submarca.Submarca = r["PANTALLA"].ToString();
                lst.Add(submarca);
            }
            return lst;
        }
        public List<EntSubmarca> obtenerSubmarca()
        {
            DatSubmarca obj = new DatSubmarca();
            DataTable dt = obj.obtenerSubmarca();
            List<EntSubmarca> lst = new List<EntSubmarca>();
            foreach (DataRow r in dt.Rows)
            {
                EntSubmarca submarca = new EntSubmarca();
                submarca.IdSubmarca = Convert.ToInt32(r["IDSUBMARCA"]);
                submarca.MarcaSub = Convert.ToInt32(r["MARCA"]);
                submarca.Submarca = r["PANTALLA"].ToString();
                lst.Add(submarca);
            }
            return lst;
        }
    }
}
