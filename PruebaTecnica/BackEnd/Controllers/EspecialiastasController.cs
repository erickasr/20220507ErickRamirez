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
    public class EspecialiastasController : ApiController
    {
        Connection connection = new Connection();

        // GET: api/Especialiastas
        public IEnumerable<Especialista> Get()
        {
            var Response = connection.ObtenerEspecialistas();
            return Response;
        }

        // POST: api/Especialiastas
        public void Post(Especialista especialista)
        {
            connection.InsertarEspecialista(especialista);

        }
    }
}
