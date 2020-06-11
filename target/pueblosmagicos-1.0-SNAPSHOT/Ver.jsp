<%-- 
    Document   : Ver
    Created on : 17/05/2020, 03:01:01 PM
--%>

<%@page contentType="text/html; charset=ISO-8859-1"
        import ="java.sql.Connection"        
        import ="java.sql.DriverManager"        
        import ="java.sql.ResultSet"        
        import ="java.sql.Statement"        
        import ="java.sql.SQLException"        

        %>
<!DOCTYPE html>
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
            <li><a href="entradas/contacto.html">Contacto</a></li>
            </center>
        </ul>
    </header>

        <h2><strong><center>Bienvenido a tus Entradas</center></strong></h2>

<font color="darkgreen">
<table bordercolor="#FFFFFF" border bgcolor="#F0F8FF" style="margin: 0 auto;" background="./visual/tabla.jpg" >

            <center>
                <tr>
                    <th><font color="brown">ID   .</font></th>
                    <th><font color="brown">Entradas de Altas</font></th>
                    <th><font color="brown">Fechas del Altas</font></th>
                    <th><font color="brown">Calificaciones</font></th>
                    <th><font color="brown">Comentarios</font></th>
                </tr>
</center>

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
                    
                            }catch (Exception e) {
                                out.print("Error en la conexión con los registros. :( Intenta de nuevo!");
                                e.printStackTrace();
                            }

                        %>
                        </font>
                        </table>
                        </br>

                </body>
                </html>