$(document).ready(function () {
    datos = {
        Description: $("#Description").val(),
        Status: $("#Status").val()
    }
    $.ajax({
        type: "GET",
        traditional: true,
        url: 'https://localhost:44387/Api/Pacientes',
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(),
        success: function (result) {
            if (result.ArrayOfPaciente != null) {
                $('#tblPacientes').DataTable().destroy();
                $('#tblPacientes tbody').empty();
                $.each(result.ArrayOfPaciente, function (i, item) {
                    /* Vamos agregando a nuestra tabla las filas necesarias */
                    $('#tblPacientes tbody').append("<tr><td>" + item.IdPaciente + "</td><td>"
                        + item.Nombre + "</td><td>"
                        + item.Telefono + "</td><td>"
                        + item.DUI + "</td></tr>");
                });
            } else {
                alert("Ha ocurrido un error con la base de datos");
            }
        },
        error: function () {
            alert("Ha ocurrido un error");
        }
    });
});