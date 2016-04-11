using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.DatKamiel;

namespace Kadmiel.BusKadmiel
{
    public class BusAutos
    {
        public BusAutos()
        {
        }
        public List<string> llenarAnio()
        {
            List<string> anios = new List<string>();
            for (int i = DateTime.Now.Year + 1; i > DateTime.Now.Year - 75; i--)
            {
                anios.Add(i.ToString());
            }
            return anios;
        }
        public List<EntAutos> obtenerAutos()
        {
            DatAutos obj = new DatAutos();
            List<EntAutos> lst = new List<EntAutos>();
            DataTable dt = obj.obtenerAutos();
            foreach (DataRow r in dt.Rows)
            {
                EntAutos aut = new EntAutos();
                aut.IdAutos = Convert.ToInt32(r["ID"]);
                aut.IdCliente = Convert.ToInt32(r["AUTOS_ID_CLIENTE"]);
                aut.Marca.Marca = r["MARCA"].ToString();
                aut.MarcaAuto = Convert.ToInt32(r["AUTOS_MARCA"]);
                aut.Submarca.Submarca = r["SUBMARCA"].ToString();
                aut.SubmarcaAuto = Convert.ToInt32(r["AUTOS_SUBMARCA"]);
                aut.Placa = r["PLACA"].ToString();
                aut.Modelo = r["MODELO"].ToString();
                aut.Periodo = Convert.ToInt32(r["PERIODO"]);
                aut.Digito = Convert.ToInt32(r["DIGITO"]);
                aut.ClaseAuto = Convert.ToInt32(r["AUTOS_CLASE"]);
                aut.Clase.Clase = r["CLASE"].ToString();
                aut.Clase.IdClase = Convert.ToInt32(r["IDCLASE"]);
                aut.Estado.Estado = r["ESTADO"].ToString();
                aut.EstadoAuto = Convert.ToInt32(r["AUTOS_ESTADO"]);
                aut.FechaAlta = Convert.ToDateTime(r["FECHA"]);
                aut.Estatus = Convert.ToBoolean(r["ESTATUS"]);
                lst.Add(aut);
            }
            return lst;
        }
        public List<EntAutos> obtenerAutos(int idCliente)
        {
            DatAutos obj = new DatAutos();
            List<EntAutos> lst = new List<EntAutos>();
            DataTable dt = obj.obtenerAutosIdCliente(idCliente);

            foreach (DataRow r in dt.Rows)
            {
                EntAutos aut = new EntAutos();
                aut.IdAutos = r["ID"] is DBNull ? 0 : Convert.ToInt32(r["ID"]);
                aut.IdCliente = r["AUTOS_ID_CLIENTE"] is DBNull ? 0 : Convert.ToInt32(r["AUTOS_ID_CLIENTE"]);
                aut.Marca.Marca = r["MARCA"] is DBNull ? "" : r["MARCA"].ToString();
                aut.MarcaAuto = r["AUTOS_MARCA"] is DBNull ? 0 : Convert.ToInt32(r["AUTOS_MARCA"]);
                aut.Submarca.Submarca = r["SUBMARCA"] is DBNull ? "" : r["SUBMARCA"].ToString();
                aut.SubmarcaAuto = r["AUTOS_SUBMARCA"] is DBNull ? 0 : Convert.ToInt32(r["AUTOS_SUBMARCA"]);
                aut.Placa = r["PLACA"] is DBNull ? "" : r["PLACA"].ToString();
                aut.Modelo = r["MODELO"].ToString();
                aut.Periodo = Convert.ToInt32(r["PERIODO"]);
                aut.Digito = Convert.ToInt32(r["DIGITO"]);
                aut.ClaseAuto = Convert.ToInt32(r["AUTOS_CLASE"]);
                aut.Clase.Clase = r["CLASE"].ToString();
                aut.Clase.IdClase = Convert.ToInt32(r["IDCLASE"]);
                aut.Estado.Estado = r["ESTADO"].ToString();
                aut.EstadoAuto = Convert.ToInt32(r["AUTOS_ESTADO"]);
                aut.FechaAlta = Convert.ToDateTime(r["FECHA"]);
                aut.Estatus = Convert.ToBoolean(r["ESTATUS"]);
                lst.Add(aut);
            }
            if (lst.Count == 0)
            {
                EntAutos aut = new EntAutos();
                aut.IdAutos = 0;
                aut.IdCliente = 0;
                aut.Marca.Marca = "";
                aut.MarcaAuto = 101;
                aut.Submarca.Submarca = "";
                aut.SubmarcaAuto = 100;
                aut.Placa = "";
                aut.Modelo = "";
                aut.Periodo = 0;
                aut.Digito = 0;
                aut.ClaseAuto = 1;
                aut.Clase.Clase = "";
                aut.Clase.IdClase = 1;
                aut.Estado.Estado = "";
                aut.EstadoAuto = 13;
                aut.FechaAlta = Convert.ToDateTime("01/01/1990");
                aut.Estatus = false;
                lst.Add(aut);
            }
            return lst;
        }
        public void eliminarAutos(EntAutos auto)
        {
            DatAutos obj = new DatAutos();
            int filas = obj.eliminarAutos(auto.IdAutos);
            if (filas != 1)
                throw new ApplicationException(string.Format("No se pudo eliminar al auto {0} {1} ", auto.Marca.Marca, auto.Submarca.Submarca));
        }
        public void agregarAutos(EntAutos auto)
        {
            DatAutos obj = new DatAutos();
            bool existe = obj.validarAutoCli(auto.Placa, auto.IdCliente);
            if (existe)
                throw new ApplicationException(string.Format("El Auto con la placa [{0}] ya existe", auto.Placa));

            int filas = obj.agregarAutos(auto.IdCliente, auto.ClaseAuto, auto.MarcaAuto, auto.SubmarcaAuto, auto.Modelo, auto.Placa, auto.Periodo, auto.EstadoAuto, auto.Digito, auto.Estatus);
            if (filas != 1)
                throw new ApplicationException(string.Format("El auto con placa[{0}] no se pudo agregar", auto.Placa));
        }
        public void actualizarAutos(EntAutos auto)
        {
            DatAutos obj = new DatAutos();
            bool existe = obj.validarAuto(auto.Placa, auto.IdAutos);
            if (existe)
                throw new ApplicationException(string.Format("El Auto con la placa [{0}] ya existe", auto.Placa));

            int filas = obj.actualizarAutos(auto.IdAutos, auto.ClaseAuto, auto.MarcaAuto, auto.SubmarcaAuto, auto.Modelo, auto.Placa, auto.Periodo, auto.EstadoAuto, auto.Digito, auto.Estatus);
            if (filas != 1)
                throw new ApplicationException(string.Format("La auto con placa[{0}] no se pudo actualizar", auto.Placa));
        }
        public int periodo(string placa)
        {
            int ultimo = 0;
            int periodo = 0;
            for (int i = 0; i < placa.Length; i++)
            {
                if (Char.IsNumber(placa[i]) == true)
                {
                    ultimo = Convert.ToInt32(placa[i].ToString());
                }
            }
            switch (ultimo)
            {
                case 5:
                case 6:
                    {
                        periodo = 1;
                        break;
                    }
                case 7:
                case 8:
                    {
                        periodo = 2;
                        break;
                    }
                case 3:
                case 4:
                    {
                        periodo = 3;
                        break;
                    }
                case 1:
                case 2:
                    {
                        periodo = 4;
                        break;
                    }
                case 9:
                case 0:
                    {
                        periodo = 5;
                        break;
                    }
                default:
                    break;
            }
            return periodo;
        }
        public int digito(string placa)
        {
            int ultimo = 0;
            for (int i = 0; i < placa.Length; i++)
            {
                if (Char.IsNumber(placa[i]) == true)
                {
                    ultimo = Convert.ToInt32(placa[i].ToString());
                }
            }
            return ultimo;
        }

        public void ActualizarAviso(int idAuto, bool aviso)
        {
            DatAutos obj = new DatAutos();
            int informo = obj.ActualizarAviso(idAuto, aviso);
            if (informo != 1)
                throw new ApplicationException(string.Format("No se actualizo a el aviso del auto"));
        }
    }
}
