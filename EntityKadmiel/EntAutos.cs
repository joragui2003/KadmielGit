using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kadmiel.BusKadmiel.EntityKadmiel
{
    public class EntAutos
    {
        public EntAutos()
        {
        }

        private int idAutos;
        public int IdAutos
        {
            get { return idAutos; }
            set { idAutos = value; }
        }

        private int idCliente;
        public int IdCliente
        {
            get { return idCliente; }
            set { idCliente = value; }
        }

        private int claseAuto;
        public int ClaseAuto
        {
            get { return claseAuto; }
            set { claseAuto = value; }
        }

        private int marcaAuto;
        public int MarcaAuto
        {
            get { return marcaAuto; }
            set { marcaAuto = value; }
        }

        private int submarcaAuto;
        public int SubmarcaAuto
        {
            get { return submarcaAuto; }
            set { submarcaAuto = value; }
        }

        private string modelo;
        public string Modelo
        {
            get { return modelo; }
            set { modelo = value; }
        }

        private string placa;
        public string Placa
        {
            get { return placa; }
            set { placa = value; }
        }

        private int periodo;
        public int Periodo
        {
            get { return periodo; }
            set { periodo = value; }
        }

        private int estadoAuto;
        public int EstadoAuto
        {
            get { return estadoAuto; }
            set { estadoAuto = value; }
        }

        private int digito;
        public int Digito
        {
            get { return digito; }
            set { digito = value; }
        }

        private DateTime fechaAlta;
        public DateTime FechaAlta
        {
            get { return fechaAlta; }
            set { fechaAlta = value; }
        }

        private bool estatus;
        public bool Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        private EntClase clase;
        public EntClase Clase
        {
            get
            {
                if (clase == null)
                    clase = new EntClase();
                return clase;
            }
            set
            {
                if (clase == null)
                    clase = new EntClase();
                clase = value;
            }
        }

        private EntMarca marca;
        public EntMarca Marca
        {
            get
            {
                if (marca == null)
                    marca = new EntMarca();
                return marca;
            }
            set
            {
                if (marca == null)
                    marca = new EntMarca();
                marca = value;
            }
        }

        private EntSubmarca submarca;
        public EntSubmarca Submarca
        {
            get
            {
                if (submarca == null)
                    submarca = new EntSubmarca();
                return submarca;
            }
            set
            {
                if (submarca == null)
                    submarca = new EntSubmarca();
                submarca = value;
            }
        }

        private EntEstado estado;
        public EntEstado Estado
        {
            get
            {
                if (estado == null)
                    estado = new EntEstado();
                return estado;
            }
            set
            {
                if (estado == null)
                    estado = new EntEstado();
                estado = value;
            }
        }
    }
}
