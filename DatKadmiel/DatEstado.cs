using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using Kadmiel.DatKadmiel;
namespace Kadmiel.DatKamiel
{
    public class DatEstado : DatAbstracta
    {
        public DataTable obtenerEstados()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT ESTADO_ID,ESTADO FROM Estado ORDER BY ESTADO_ID", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}
