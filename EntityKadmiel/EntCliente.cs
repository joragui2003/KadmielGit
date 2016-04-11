using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kadmiel.BusKadmiel.EntityKadmiel
{
    public class EntCliente
    {
        public EntCliente()
        {
        }
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Paterno { get; set; }
        public string Materno { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public string Empresa { get; set; }
        public DateTime FechaAlta { get; set; }
        public bool Estatus { get; set; }
        public string Usuario { get; set; }
        public string Password { get; set; }
        public DateTime FechaNaci { get; set; }
        public bool Aviso { get; set; }
        public string Modelo { get; set; }
        public string Placa { get; set; }
        public string Estado { get; set; }
        public string Marca { get; set; }
        public string Submarca { get; set; }
        public int IdAuto { get; set; }
    }
}
