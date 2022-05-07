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
    public class CitasController : ApiController
    {
        Connection connection = new Connection();

        // GET: api/Citas
        public IEnumerable<Cita> Get()
        {
            var Response = connection.ObtenerCitas();
            return Response;
        }


        // POST: api/Citas
        public void Post(Cita cita)
        {
            connection.InsertarCita(cita);
        }

    }
}
