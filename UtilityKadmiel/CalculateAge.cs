using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Kadmiel.BusKadmiel.UtilityKadmiel
{
    public static class CalculateAge
    {
        public static int Calcular(DateTime input)
        {
            DateTime fechaActual = DateTime.Now;
            int edad = fechaActual.Year - input.Year;
            if (new DateTime(fechaActual.Year, input.Month, input.Day) > fechaActual)
                edad--;
            return edad;
        }
    }
}