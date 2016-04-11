using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Kadmiel.DatKadmiel;
namespace Kadmiel.DatKamiel
{
    public class DatSubmarca : DatAbstracta
    {
        public DataTable obtenerSubmarca(string valor)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT MARCA,IDSUBMARCA,PANTALLA FROM Submarca WHERE MARCA = " + valor + " ORDER BY PANTALLA", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable obtenerSubmarca(string marca, int idsubmarca)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT MARCA,IDSUBMARCA,PANTALLA FROM Submarca WHERE MARCA = " + marca + " AND IDSUBMARCA = " + idsubmarca + "  ORDER BY PANTALLA", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable obtenerSubmarca()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT MARCA,IDSUBMARCA,PANTALLA FROM Submarca ORDER BY PANTALLA", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

    }
}
