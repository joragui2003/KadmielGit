using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kadmiel.DatKadmiel
{
    public class DatCliente : DatAbstracta
    {
        public DatCliente()
        {
        }
        public DataTable Obtener()
        {
            SqlCommand com = new SqlCommand("spObtenerClientes", con);
            com.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable Obtener(string correo, string password)
        {
            SqlCommand com = new SqlCommand("spObtenerCliente", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = correo, ParameterName = "@Correo" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = password, ParameterName = "@Password" });
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable Obtener(string correo)
        {
            SqlCommand com = new SqlCommand("spObtenerClienteUser", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = correo, ParameterName = "@Correo" });
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerAlertas(int periodo)
        {
            SqlCommand com = new SqlCommand("spEnviarAlertas", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = periodo, ParameterName = "@Periodo" });
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerAvisados(int periodo)
        {
            SqlCommand com = new SqlCommand("spObtenerAvisados", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = periodo, ParameterName = "@Periodo" });
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public int Insertar(string nombre, string paterno, string materno, string email, string telefono, string empresa, string usuario, string password, DateTime fechaNaci)
        {
            SqlCommand com = new SqlCommand("spInsertarCliente", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = nombre, ParameterName = "@Nombre" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = paterno, ParameterName = "@Paterno" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = materno, ParameterName = "@Materno" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = email, ParameterName = "@Email" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = telefono, ParameterName = "@Telefono" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = empresa, ParameterName = "@Empresa" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = usuario, ParameterName = "@Usuario" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = password, ParameterName = "@Password" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.SmallDateTime, Value = fechaNaci, ParameterName = "@FechaNaci" });
            try
            {
                con.Open();
                int filas = com.ExecuteNonQuery();
                con.Close();
                return filas;
            }
            catch (Exception ex)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al agregar usuario, {0}", ex.Message));
            }
        }
        public int Actualizar(int id, string nombre, string paterno, string materno, string email, string telefono, string empresa, bool estatus, string fechaNaci)
        {
            SqlCommand com = new SqlCommand("spActualizarCliente", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = id, ParameterName = "@Id" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = nombre, ParameterName = "@Nombre" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = paterno, ParameterName = "@Paterno" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = materno, ParameterName = "@Materno" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = email, ParameterName = "@Email" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = telefono, ParameterName = "@Telefono" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = empresa, ParameterName = "@Empresa" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Bit, Value = estatus, ParameterName = "@Estatus" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.SmallDateTime, Value = fechaNaci, ParameterName = "@FechaNaci" });
            try
            {
                con.Open();
                int filas = com.ExecuteNonQuery();
                con.Close();
                return filas;
            }
            catch (Exception ex)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al actualizar su registro, {0}", ex.Message));
            }
        }
        public int ActualizarEsta(int id)
        {
            SqlCommand com = new SqlCommand("spActualizarEsta", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = id, ParameterName = "@Id" });
            try
            {
                con.Open();
                int filas = com.ExecuteNonQuery();
                con.Close();
                return filas;
            }
            catch (Exception ex)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al actualizar tu estatus, {0}", ex.Message));
            }
        }
        public int ActualizarPass(int id, string password)
        {
            SqlCommand com = new SqlCommand("spActualizarClientePass", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = id, ParameterName = "@Id" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = password, ParameterName = "@Password" });
            try
            {
                con.Open();
                int filas = com.ExecuteNonQuery();
                con.Close();
                return filas;
            }
            catch (Exception ex)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al actualizar su password, {0}", ex.Message));
            }
        }

        public int Eliminar(int idCliente)
        {
            SqlCommand com = new SqlCommand("spEliminarCliente", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = idCliente, ParameterName = "@ID" });
            try
            {
                con.Open();
                int filas = com.ExecuteNonQuery();
                con.Close();
                return filas;
            }
            catch (Exception ex)
            {
                con.Close();
                throw new ApplicationException(string.Format("Error al eliminar su registro, {0}", ex.Message));
            }
        }
        public bool ValidarUsuario(string usuario)
        {
            bool existe = false;
            SqlCommand com = new SqlCommand("spValidarUsuario", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = usuario, ParameterName = "@Usuario" });
            try
            {
                con.Open();
                existe = Convert.ToBoolean(com.ExecuteScalar());
                con.Close();
                return existe;
            }
            catch (Exception)
            {
                con.Close();
                throw new ApplicationException(string.Format("No se pudo validar el usuario {0}", usuario));
            }
        }
        public bool ValidarEmail(string email)
        {
            bool existe = false;
            SqlCommand com = new SqlCommand("spValidarEmail", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = email, ParameterName = "@Email" });
            try
            {
                con.Open();
                existe = Convert.ToBoolean(com.ExecuteScalar());
                con.Close();
                return existe;
            }
            catch (Exception)
            {
                con.Close();
                throw new ApplicationException(string.Format("No se pudo validar el Email {0}", email));
            }
        }
        public bool ValidarEmailAct(string email, int id)
        {
            bool existe = false;
            SqlCommand com = new SqlCommand("spValidarEmailId", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.VarChar, Value = email, ParameterName = "@Email" });
            com.Parameters.Add(new SqlParameter() { SqlDbType = SqlDbType.Int, Value = id, ParameterName = "@IdCliente" });
            try
            {
                con.Open();
                existe = Convert.ToBoolean(com.ExecuteScalar());
                con.Close();
                return existe;
            }
            catch (Exception)
            {
                con.Close();
                throw new ApplicationException(string.Format("No se pudo validar el Email {0}", email));
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
