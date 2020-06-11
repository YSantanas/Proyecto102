<%-- 
    Document   : Entrada
    Creado por Yvette
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pueblos Mágicos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="visual/estilos.css">


    </head>

    <body>
        <br><br/>
    <center><img class="cabeza" src="visual/entra.png"></center>
    <br><br/>
    <br/>
    <header>

        <ul>
            <center>
            <li><a href="index.html">Inicio</a></li>
            <li><a href="Entrada.jsp">Agregar Alta</a></li>
            <li><a href="Editar.jsp">Editar</a></li>
            <li><a href="Ver.jsp">Ver Altas</a></li>
            <li><a href="entradas/contacto.html">Contacto</a></li>
            </center>
        </ul>
    </header>
    <center>
        </br>
        <h2><strong>Selecciona los pueblos y calificalos </strong></h2>



        <form name="Registro" action="data.jsp" method="get">

            <center>	
                <p style="color:whitesmoke"><b>Da de alta el pueblo de tu eleccion:</b></p> <input type="text" name="Entrada" wrap="hard" list="pueblos">

                <datalist id="pueblos">

                    <option value="El techo de Bután">

                    <option value="Pequeña Villa de pescadores">

                    <option value="Chichilianne en Ródano Alpes">

                </datalist>
                
                <p style="color:whitesmoke"><strong>Introduce una opinión del pueblo: </strong></p>

                        <textarea name="opinion" rows="10" cols="100" wrap="hard" placeholder="Escribe aquí tu opinión."></textarea>

                <p style="color:whitesmoke"><b>Puntua el pueblo seleccionado:</b></p>


                <img src="ok.png" style="max-width:06%;width:auto;height:auto;"><input type="radio" id="1" name="Estado" value="1">
                <label for="male" style="color:white;">Bueno</label><br>
                <br/>

                <img src="reg.png" style="max-width:05.5%;width:auto;height:auto;"><input type="radio" id="2" name="Estado" value="2">
                <label for="female" style="color:white;">Regular</label><br>
                <br/>
                <img src="mal.png" style="max-width:05.5%;width:auto;height:auto;"><input type="radio" id="3" name="Estado" value="3">
                <label for="other" style="color:white;">Malo</label><br>
                <br/>



            </center>
            <center>
                <p></p>
                <input type="submit" value="Ingresar entrada">
            </center>
        </form>

        </br>
        </br>
    </body>
</html>