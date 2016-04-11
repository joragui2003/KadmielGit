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
    public class DatMarca : DatAbstracta
    {
        public DataTable obtenerMarca(int idMarca)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT PANTALLA, BASEDATOS FROM Marca WHERE BASEDATOS LIKE '" + idMarca + "%'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable obtenerMarca()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT PANTALLA, BASEDATOS FROM Marca ORDER BY PANTALLA", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}
