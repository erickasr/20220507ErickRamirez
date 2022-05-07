using BackEnd.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace BackEnd.Models
{
    public class Connection
    {
        static private string GetConnectionString()
        {
            return "Server=localhost;Database=dbPruebaTecnica;User Id=sa;Password=smartcode;";
        }

        public IEnumerable<Paciente> ObtenerPacientes()
        {
            using (SqlConnection sql = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand("ObtenerPacientes", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<Paciente>();
                    sql.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Paciente paciente = new Paciente();
                            paciente.IdPaciente = (int)reader["IdPaciente"];
                            paciente.Nombre = reader["Nombre"].ToString();
                            paciente.Telefono = reader["Telefono"].ToString();
                            paciente.DUI = reader["DUI"].ToString();

                            response.Add(paciente);
                        }
                    }

                    return response;
                }
            }
        }
        
        public void InsertarPaciente(Paciente paciente)
        {
            using (SqlConnection sql = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand("InsertarPaciente", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Nombre", paciente.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Telefono", paciente.Telefono));
                    cmd.Parameters.Add(new SqlParameter("@DUI", paciente.DUI));
                    sql.Open();
                    cmd.ExecuteNonQuery();
                    return;
                }
            }
        }


        public IEnumerable<Especialista> ObtenerEspecialistas()
        {
            using (SqlConnection sql = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand("ObtenerEspecialistas", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<Especialista>();
                    sql.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Especialista paciente = new Especialista();
                            paciente.IdEspecialista = (int)reader["IdEspecialista"];
                            paciente.Nombre = reader["Nombre"].ToString();
                            paciente.Especialidad = reader["Especialidad"].ToString();
                            paciente.Telefono = reader["Telefono"].ToString();
                            paciente.DUI = reader["DUI"].ToString();
                            paciente.JVPM = reader["JVPM"].ToString();

                            response.Add(paciente);
                        }
                    }
                    return response;
                }
            }
        }

        public void InsertarEspecialista(Especialista especialista)
        {
            using (SqlConnection sql = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand("InsertarEspecialista", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Nombre", especialista.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Especialidad", especialista.Especialidad));
                    cmd.Parameters.Add(new SqlParameter("@Telefono", especialista.Telefono));
                    cmd.Parameters.Add(new SqlParameter("@DUI", especialista.DUI));
                    cmd.Parameters.Add(new SqlParameter("@JVPM", especialista.JVPM));
                    sql.Open();
                    cmd.ExecuteNonQuery();
                    return;
                }
            }
        }



        public IEnumerable<Cita> ObtenerCitas()
        {
            using (SqlConnection sql = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand("ObtenerCitas", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<Cita>();
                    sql.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Cita cita = new Cita();
                            cita.IdCita = (int)reader["IdCita"];
                            cita.IdEspecialista = (int)reader["IdEspecialista"];
                            cita.IdPaciente = (int)reader["IdPaciente"];
                            cita.Fecha = (DateTime)reader["Nombre"];
                            cita.Estado = reader["Estado"].ToString();

                            response.Add(cita);
                        }
                    }
                    return response;
                }
            }
        }

        public void InsertarCita(Cita cita)
        {
            using (SqlConnection sql = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand("InsertarCita", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@IdEspecialista", cita.IdEspecialista));
                    cmd.Parameters.Add(new SqlParameter("@IdPaciente", cita.IdPaciente));
                    cmd.Parameters.Add(new SqlParameter("@Fecha", cita.Fecha));
                    cmd.Parameters.Add(new SqlParameter("@Estado", cita.Estado));
                    sql.Open();
                    cmd.ExecuteNonQuery();
                    return;
                }
            }
        }


    }
}