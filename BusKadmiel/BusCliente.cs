using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.DatKadmiel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kadmiel.BusKadmiel
{
    public class BusCliente
    {
        public BusCliente() { }
        public List<EntCliente> Obtener()
        {
            DatCliente obj = new DatCliente();
            DataTable dt = obj.Obtener();
            List<EntCliente> lst = new List<EntCliente>();
            foreach (DataRow r in dt.Rows)
            {
                EntCliente cli = new EntCliente();
                cli.Id = Convert.ToInt32(r["CLI_ID"]);
                cli.Nombre = r["CLI_NOMBRE"].ToString();
                cli.Paterno = r["CLI_PATERNO"].ToString();
                cli.Materno = r["CLI_MATERNO"].ToString();
                cli.Email = r["CLI_EMAIL"].ToString();
                cli.Telefono = r["CLI_TELEFONO"].ToString();
                cli.Empresa = r["CLI_TELEFONO"] is DBNull ? "S/T" : r["CLI_TELEFONO"].ToString();
                cli.FechaAlta = Convert.ToDateTime(r["CLI_FECHA_ALTA"]);
                cli.Estatus = Convert.ToBoolean(r["CLI_ESTATUS"]);
                cli.Usuario = r["CLI_USUARIO"].ToString();
                cli.Password = r["CLI_PASSWORD"].ToString();
                cli.FechaNaci = Convert.ToDateTime(r["CLI_FECHA_NACI"]);
                lst.Add(cli);
            }
            return lst;
        }
        public EntCliente Obtener(string correo, string password)
        {
            DataTable dt = new DatCliente().Obtener(correo, password);
            if (dt.Rows.Count == 0)
                throw new ApplicationException("Correo y/o contraseña invalidos");

            DataRow dr = dt.Rows[0];
            EntCliente cli = new EntCliente();
            cli.Id = Convert.ToInt32(dr["CLI_ID"]);
            cli.Nombre = dr["CLI_NOMBRE"].ToString();
            cli.Paterno = dr["CLI_PATERNO"].ToString();
            cli.Materno = dr["CLI_MATERNO"] is DBNull ? "S/M" : dr["CLI_MATERNO"].ToString();
            cli.Email = dr["CLI_EMAIL"].ToString();
            cli.Telefono = dr["CLI_TELEFONO"].ToString();
            cli.Empresa = dr["CLI_EMPRESA"] is DBNull ? "S/E" : dr["CLI_EMPRESA"].ToString();
            cli.FechaAlta = Convert.ToDateTime(dr["CLI_FECHA_ALTA"]);
            cli.Estatus = Convert.ToBoolean(dr["CLI_ESTATUS"]);
            cli.Usuario = dr["CLI_USUARIO"].ToString();
            cli.Password = dr["CLI_PASSWORD"].ToString();
            cli.FechaNaci = Convert.ToDateTime(dr["CLI_FECHA_NACI"]);
            return cli;
        }
        public EntCliente Obtener(string correo)
        {
            DataTable dt = new DatCliente().Obtener(correo);
            if (dt.Rows.Count == 0)
                throw new ApplicationException(string.Format("El registro de  {0} no existe en nuestra Base de Datos", correo));

            DataRow dr = dt.Rows[0];
            EntCliente cli = new EntCliente();
            cli.Id = Convert.ToInt32(dr["CLI_ID"]);
            cli.Nombre = dr["CLI_NOMBRE"].ToString();
            cli.Paterno = dr["CLI_PATERNO"].ToString();
            cli.Materno = dr["CLI_MATERNO"] is DBNull ? "S/M" : dr["CLI_MATERNO"].ToString();
            cli.Email = dr["CLI_EMAIL"].ToString();
            cli.Telefono = dr["CLI_TELEFONO"].ToString();
            cli.Empresa = dr["CLI_EMPRESA"] is DBNull ? "S/E" : dr["CLI_EMPRESA"].ToString();
            cli.FechaAlta = Convert.ToDateTime(dr["CLI_FECHA_ALTA"]);
            cli.Estatus = Convert.ToBoolean(dr["CLI_ESTATUS"]);
            cli.Usuario = dr["CLI_USUARIO"].ToString();
            cli.Password = dr["CLI_PASSWORD"].ToString();
            cli.FechaNaci = Convert.ToDateTime(dr["CLI_FECHA_NACI"]);
            return cli;
        }
        public List<EntCliente> ObtenerAlertas(int periodo)
        {
            DataTable dt = new DatCliente().ObtenerAlertas(periodo);
            List<EntCliente> lst = new List<EntCliente>();
            if (dt.Rows.Count == 0)
            {
                EntCliente cli = new EntCliente();
                cli.Id = 0;
                cli.Nombre = "";
                cli.Paterno = "";
                cli.Materno = "";
                cli.Email = "";
                cli.Aviso = false;
                cli.Modelo = "";
                cli.Placa = "";
                cli.Estado = "";
                cli.Marca = "";
                cli.Submarca = "";
                cli.IdAuto = 0;
                lst.Add(cli);
            }
            else
            {
                foreach (DataRow dr in dt.Rows)
                {
                    EntCliente cli = new EntCliente();
                    cli.Id = Convert.ToInt32(dr["CLI_ID"]);
                    cli.Nombre = dr["CLI_NOMBRE"].ToString();
                    cli.Paterno = dr["CLI_PATERNO"].ToString();
                    cli.Materno = dr["CLI_MATERNO"] is DBNull ? "S/M" : dr["CLI_MATERNO"].ToString();
                    cli.Email = dr["CLI_EMAIL"].ToString();
                    cli.Aviso = Convert.ToBoolean(dr["CLI_AVISO"]);
                    cli.Modelo = dr["AUTOS_MODELO"].ToString();
                    cli.Placa = dr["AUTOS_PLACA"].ToString();
                    cli.Estado = dr["ESTADO"].ToString();
                    cli.Marca = dr["MARCA"].ToString();
                    cli.Submarca = dr["SUBMARCA"].ToString();
                    cli.IdAuto = Convert.ToInt32(dr["AUTOS_ID"]);
                    lst.Add(cli);
                }
            }
            return lst;
        }
        public List<EntCliente> ObtenerAvisados(int periodo)
        {
            DataTable dt = new DatCliente().ObtenerAvisados(periodo);
            List<EntCliente> lst = new List<EntCliente>();
            if (dt.Rows.Count == 0)
            {
                EntCliente cli = new EntCliente();
                cli.Id = 0;
                cli.Nombre = "";
                cli.Paterno = "";
                cli.Materno = "";
                cli.Email = "";
                cli.Aviso = false;
                cli.Modelo = "";
                cli.Placa = "";
                cli.Estado = "";
                cli.Marca = "";
                cli.Submarca = "";
                cli.IdAuto = 0;
                lst.Add(cli);
            }
            else
            {
                foreach (DataRow dr in dt.Rows)
                {
                    EntCliente cli = new EntCliente();
                    cli.Id = Convert.ToInt32(dr["CLI_ID"]);
                    cli.Nombre = dr["CLI_NOMBRE"].ToString();
                    cli.Paterno = dr["CLI_PATERNO"].ToString();
                    cli.Materno = dr["CLI_MATERNO"] is DBNull ? "S/M" : dr["CLI_MATERNO"].ToString();
                    cli.Email = dr["CLI_EMAIL"].ToString();
                    cli.Aviso = Convert.ToBoolean(dr["CLI_AVISO"]);
                    cli.Modelo = dr["AUTOS_MODELO"].ToString();
                    cli.Placa = dr["AUTOS_PLACA"].ToString();
                    cli.Estado = dr["ESTADO"].ToString();
                    cli.Marca = dr["MARCA"].ToString();
                    cli.Submarca = dr["SUBMARCA"].ToString();
                    cli.IdAuto = Convert.ToInt32(dr["AUTOS_ID"]);
                    lst.Add(cli);
                }
            }
            return lst;
        }
        public void Insertar(EntCliente ent)
        {
            //bool existeUser = false;
            bool existeEmail = false;
            //existeUser = new DatCliente().ValidarUsuario(ent.Usuario);
            //if (existeUser)
            //    throw new ApplicationException(string.Format("El usuario {0} ya existe, por favor introduzca otro usuario", ent.Usuario));
            existeEmail = new DatCliente().ValidarEmail(ent.Email);
            if (existeEmail)
                throw new ApplicationException(string.Format("El Email {0} ya existe en nuestra Base de Datos", ent.Email));
            int filas = new DatCliente().Insertar(ent.Nombre, ent.Paterno, ent.Materno, ent.Email, ent.Telefono, ent.Empresa, ent.Usuario, ent.Password, ent.FechaNaci);
            if (filas != 1)
                throw new ApplicationException(string.Format("Error al registrar al usuario {0} ", ent.Email));
        }
        public void Actualizar(EntCliente ent)
        {
            bool existe = false;
            existe = new DatCliente().ValidarEmailAct(ent.Email, ent.Id);
            if (existe)
                throw new ApplicationException(string.Format("El Email {0} ya existe en nuestra Base de Datos", ent.Email));
            int filas = new DatCliente().Actualizar(ent.Id, ent.Nombre, ent.Paterno, ent.Materno, ent.Email, ent.Telefono, ent.Empresa, ent.Estatus, ent.FechaNaci.ToString("dd/MM/yyyy"));
            if (filas != 1)
                throw new ApplicationException(string.Format("Error al actualizar tus datos {0} ", ent.Email));
        }
        public void ActualizarEsta(EntCliente ent)
        {
            int filas = new DatCliente().ActualizarEsta(ent.Id);
            if (filas != 1)
                throw new ApplicationException(string.Format("Error al actualizar tus estatus {0} ", ent.Email));
        }
        public void ActualizarPass(EntCliente ent)
        {
            DatCliente obj = new DatCliente();
            int filas = obj.ActualizarPass(ent.Id, ent.Password);
            if (filas != 1)
                throw new ApplicationException("Error al actualizar el password");
        }


    }
}
