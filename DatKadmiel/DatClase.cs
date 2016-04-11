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
    public class DatClase : DatAbstracta
    {
        public DataTable obtenerClase()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT PANTALLA, BASEDATOS FROM Clase ORDER BY BASEDATOS ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}
