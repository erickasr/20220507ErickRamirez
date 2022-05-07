using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackEnd.Classes
{
    public class Cita
    {
        public int IdCita { get; set; }
        public int IdEspecialista { get; set; }
        public int IdPaciente { get; set; }
        public DateTime Fecha { get; set; }
        public string Estado { get; set; }
    }
}