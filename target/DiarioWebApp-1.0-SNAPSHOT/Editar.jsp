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
                    <li><a href="Entrada.jsp">Agregar Entrada</a></li>
                    <li><a href="Editar.jsp">Editar</a></li>
                    <li><a href="Ver.jsp">Ver</a></li>
                    <li><a href="contacto.html">Contacto</a></li>
                </center>
            </ul>
        </header>

        <h2><strong><center>Editando ...</center></strong></h2>

        <table border bgcolor="#F0F8FF" style="margin: 0 auto;">
            <p><strong><center><font color="white">¿Qué entrada deseas editar?</font></center></strong></strong></p>
            <center>
                <tr>
                    <th><font color="Peru">ID de la entrada</font></th>
                    <th><font color="Peru">Entradas del diario</font></th>
                    <th><font color="Peru">Fecha de creación</font></th>
                    <th><font color="Peru">Estado de Ánimo</font></th>
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

        <p>Modifica el pueblo de tu eleccion:</p> <input type="text" name="Entrada" wrap="hard" list="pueblos">

        <datalist id="pueblos">

            <option value="Pueblo 1">

            <option value="Pueblo 2">

            <option value="Pueblo 3">

        </datalist>
        
         <p><strong>Introduce una nueva opinión del pueblo: </strong></p>

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




        Ingresa el ID de tu entrada: <input type="text" name="ID" value=""/> <p><br>
            </center>
        <center>
            <input type="submit" value="Editar entrada del diario">

            <p></p>

    </form>

</center>

<button onclick="window.location.href = 'Eliminar.jsp';">Eliminar una entrada</button>


<button onclick="window.location.href = 'index.html';">Regresar al menú principal</button>
</center>
</body>
</html>
