<%-- 
    Document   : Editar
    Created on : 17/05/2020, 07:05:46 PM
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"
        import ="java.sql.Connection"        
        import ="java.sql.DriverManager"        
        import ="java.sql.ResultSet"        
        import ="java.sql.Statement"        
        import ="java.sql.SQLException"        

        %>
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
        <h1><center><img class="cabeza" src="visual/entra.png"></center></h1>
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

        <h2><strong><center>Editando ...</center></strong></h2>

<font color="darkgreen">
<table bordercolor="#FFFFFF" border bgcolor="#F0F8FF" style="margin: 0 auto;" background="./visual/tabla.jpg" >

            <p><strong><center><font color="white">¿Qué entrada deseas editar?</font></center></strong></strong></p>
            <center>
                <tr>
                    <th><font color="brown">ID   .</font></th>
                    <th><font color="brown">Entradas de Altas</font></th>
                    <th><font color="brown">Fechas del Altas</font></th>
                    <th><font color="brown">Calificaciones</font></th>
                    <th><font color="brown">Comentarios</font></th>
                </tr>


                <%
                    Connection conex = null;
                    Statement sql = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conex = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1/pueblosmagicos?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false", "root", "root");
                        sql = conex.createStatement();

                        String qry = "select * from pueblosmagicos.registros";
                        ResultSet data = sql.executeQuery(qry);
                        while (data.next()) {
                %>

                 <% if (data.getInt("Visibilidad") == 1) { %>
                <tr>
                    <td>
                        <% out.print(data.getInt("Id"));%>
                    </td>
                    <td>
                        <% out.print(data.getString("Entradas"));%>
                    </td>
                    <td>
                        <% out.print(data.getString("Fecha de alta"));%>
                    </td>
                    <td>
                        <% 
                            if (Integer.parseInt(data.getString("Estados_id")) == 1) {
                            
                                out.print("Bueno");
                                
                                }
                        
                            else 
                            if (Integer.parseInt(data.getString("Estados_id")) == 2) {
                                
                                out.print("Regular");
   
                            } else 
                            if (Integer.parseInt(data.getString("Estados_id")) == 3) {
                                out.print("Malo");
   
                            }

                       %>
                    </td>
                    <td>
                        <% out.print(data.getString("Opinion"));%>
                    </td>
                </tr>

                <%  } %>

                <%
                        }
                        data.close();

                    } catch (Exception e) {
                        out.print("Error en la conexión con los registros. :( Intenta de nuevo!");
                        e.printStackTrace();
                    }

                %>
        </table>
    </center> 
<center>
    <p></p>
    <form name="Registro" action="dataSobreescritura.jsp" method="get">

        <p style="color:white;"><b>Modifica el pueblo de tu eleccion:</b></p> <input type="text" name="Entrada" wrap="hard" list="pueblos">

                <datalist id="pueblos">

                    <option value="El techo de Bután">

                    <option value="Pequeña Villa de pescadores">

                    <option value="Chichilianne en Ródano Alpes">

                </datalist>
        
       <p style="color:darkgreen"><strong>Introduce una nueva opinión del pueblo: </strong></p>

                        <textarea name="opinion" rows="10" cols="100" wrap="hard" placeholder="Escribe aquí tu opinión."></textarea>


        <p style="color:white;"><b>Puntua el pueblo seleccionado:</b></p>


        <img src="ok.png" style="max-width:06%;width:auto;height:auto;"><input type="radio" id="1" name="Estado" value="1">
        <label for="male" style="color:white;">Bueno</label><br>
        <br/>

        <img src="reg.png" style="max-width:05.5%;width:auto;height:auto;"><input type="radio" id="2" name="Estado" value="2">
        <label for="female" style="color:white;">Regular</label><br>
        <br/>
        <img src="mal.png" style="max-width:05.5%;width:auto;height:auto;"><input type="radio" id="3" name="Estado" value="3">
        <label for="other" style="color:white;">Malo</label><br>
        <br/>


    <p style="color:white;"><b>Ingresa el ID de tu entrada:</b></p>

         <input type="text" name="ID" value=""/> <p><br>
            </center>
        <center>
            <input type="submit" value="Editar entrada">

            <p></p>

           </form>

        </br>
        </br>

</center>


</center>
</body>
</html>
