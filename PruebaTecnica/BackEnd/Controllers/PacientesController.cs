using BackEnd.Classes;
using BackEnd.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BackEnd.Controllers
{
    public class PacientesController : ApiController
    {
        Connection connection = new Connection();

        // GET: api/Pacientes
        public IEnumerable<Paciente> Get()
        {
            var Response = connection.ObtenerPacientes();
            return Response;
        }

        // POST: api/Pacientes
        public void Post(Paciente paciente)
        {
            connection.InsertarPaciente(paciente);
        }


    }
}
