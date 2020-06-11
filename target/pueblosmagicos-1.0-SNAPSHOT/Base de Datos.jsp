<%-- 
 Creado por Yvette
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
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
         <meta charset="utf-8">

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

        <table border bgcolor="#F0F8FF" style="margin: 0 auto;">
            <%
                   Connection conex = null;
                   Statement sql = null;
                   try{
                       Class.forName("com.mysql.cj.jdbc.Driver");
                       conex = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/pueblosmagicos?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false","root","root");
                       sql = conex.createStatement();
                       
                       out.print("Conexión establecida");
                       
                       String qry = "select * from pueblosmagicos.registros";
                       ResultSet data = sql.executeQuery(qry);
                       while(data.next())
                       {
                       %>
                       <tr>
                           <td>
                               <% out.print(data.getInt("Id"));%>
                           </td>
                           <td>
                               <% out.print(data.getString("Entradas del diario"));%>
                           </td>
                           <td>
                               <% out.print(data.getString("Fecha de creación"));%>
                           </td>
                           <td>
                               <% out.print(data.getString("Estados_id"));%>
                           </td>
                           <td>
                               <% out.print(data.getString("Visibilidad"));%>
                           </td>
                       </tr>
                       <%
                       }
                       data.close();
                       
                   }
                   catch(Exception e)
                   {
                       out.print("Error en la conexión");
                       e.printStackTrace();
                   }

            %>
        </table>
    </body>
</html>
