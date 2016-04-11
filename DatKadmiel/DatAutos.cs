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
    public class DatAutos : DatAbstracta
    {
        public DataTable obtenerAutos()
        {
            SqlCommand com = new SqlCommand("spObtenerAutos", con);
            com.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable obtenerAutosIdCliente(int idCliente)
        {
            SqlCommand com = new SqlCommand("spObtenerAutosIdCliente", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = idCliente, ParameterName = "@IdCliente" });
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataRow obtenerAutos(int idAuto)
        {
            SqlCommand com = new SqlCommand("spObtenerAuto", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = idAuto, ParameterName = "@IdAuto" });
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DataRow r = dt.Rows[0];
            return r;
        }
        public int agregarAutos(int idCliente, int clase, int marca, int submarca, string modelo, string placa, int periodo, int estado, int digito, bool estatus)
        {
            SqlCommand comando = new SqlCommand("spAgregarAuto", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = idCliente, ParameterName = "@IdCliente" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = clase, ParameterName = "@Clase" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = marca, ParameterName = "@Marca" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = submarca, ParameterName = "@Submarca" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = modelo, ParameterName = "@Modelo" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = placa, ParameterName = "@Placa" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = periodo, ParameterName = "@Periodo" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = estado, ParameterName = "@Estado" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = digito, ParameterName = "@Digito" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Bit, Value = estatus, ParameterName = "@Estatus" });
            try
            {
                con.Open();
                int filas = comando.ExecuteNonQuery();
                con.Close();
                return filas;
            }
            catch (Exception)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al agregar el Auto {0} {1} ", marca, submarca));
            }

        }
        public int actualizarAutos(int idAuto, int clase, int marca, int submarca, string modelo, string placa, int periodo, int estado, int digito, bool estatus)
        {
            SqlCommand comando = new SqlCommand("spActualizarAuto", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = idAuto, ParameterName = "@IdAuto" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = clase, ParameterName = "@Clase" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = marca, ParameterName = "@Marca" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = submarca, ParameterName = "@Submarca" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = modelo, ParameterName = "@Modelo" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = placa, ParameterName = "@Placa" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = periodo, ParameterName = "@Periodo" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = estado, ParameterName = "@Estado" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = digito, ParameterName = "@Digito" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Bit, Value = estatus, ParameterName = "@Estatus" });
            try
            {
                con.Open();
                int filas = comando.ExecuteNonQuery();
                con.Close();
                return filas;
            }
            catch (Exception)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al actualizar el auto {0} {1} ", marca, submarca));
            }
        }
        public bool validarAutoCli(string placa, int IdCliente)
        {
            bool existe = false;
            SqlCommand comando = new SqlCommand("spValidarAuto", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = placa, ParameterName = "@Placa" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = IdCliente, ParameterName = "@IdCliente" });
            try
            {
                con.Open();
                existe = Convert.ToBoolean(comando.ExecuteScalar());
                con.Close();
                return existe;
            }
            catch (Exception)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al validar la placa {0}", placa));
            }
        }
        public bool validarAuto(string placa, int idAuto)
        {
            bool existe = false;
            SqlCommand comando = new SqlCommand("spValidarAutoId", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = idAuto, ParameterName = "@IdAuto" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = placa, ParameterName = "@Placa" });
            try
            {
                con.Open();
                existe = Convert.ToBoolean(comando.ExecuteScalar());
                con.Close();
                return existe;
            }
            catch (Exception)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al validar la placa con Id {0} ", placa));
            }
        }
        public int eliminarAutos(int idAuto)
        {
            SqlCommand comando = new SqlCommand("spEliminarAuto", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = idAuto, ParameterName = "@IdAuto" });
            try
            {
                con.Open();
                int filas = comando.ExecuteNonQuery();
                con.Close();
                return filas;
            }
            catch (Exception)
            {
                con.Close();
                throw new ApplicationException("Error al eliminar el auto");
            }
        }

        public int ActualizarAviso(int idAuto, bool aviso)
        {
            SqlCommand comando = new SqlCommand("spActualizarAvisoAuto", con);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = idAuto, ParameterName = "@IdAuto" });
            comando.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Bit, Value = aviso, ParameterName = "@PrimerAviso" });
            try
            {
                con.Open();
                int filas = Convert.ToInt32(comando.ExecuteNonQuery());
                con.Close();
                return filas;
            }
            catch (Exception)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al actualizar el aviso"));
            }
        }
    }
}
//SELECT
//    CLI_ID, CLI_NOMBRE, CLI_PATERNO, CLI_MATERNO, CLI_EMAIL, CLI_AVISO,
//    AUTOS_MODELO, AUTOS_PLACA,
//    Estado.ESTADO,
//    Marca.PANTALLA,
//    Submarca.PANTALLA
//FROM
//    Cliente
//INNER JOIN
//    Autos
//ON
//    CLI_ID = AUTOS_ID_CLIENTE
//INNER JOIN
//    Estado
//ON
//    AUTOS_ESTADO = ESTADO_ID
//INNER JOIN
//    Marca
//ON AUTOS_MARCA = Marca.BASEDATOS
//INNER JOIN
//    Submarca
//ON
//    AUTOS_SUBMARCA = IDSUBMARCA AND AUTOS_MARCA = MARCA
	
//WHERE CLI_ESTATUS = 'TRUE' AND AUTOS_PERIODO = 5

