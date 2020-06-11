<%-- 
    Document   : data
    Created on : 17/05/2020, 07:58:44 PM
--%>

<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@page import= "java.sql.*" %>
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
        <%
            String entrada = request.getParameter("Entrada");
            String estado = request.getParameter("Estado");
            String opinion = request.getParameter("opinion");

            Connection con = null;
            Statement st = null;

            try {

                Class.forName("com.mysql.cj.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1/pueblosmagicos?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false", "root", "root");
                st= con.createStatement();
                
                String query ="INSERT INTO `pueblosmagicos`.`registros` (`Entradas`, `Estados_id`, `Opinion`) VALUES ('"+entrada+"', '"+estado+"', '"+opinion+"');";
                st.executeUpdate(query);
                
                out.println("\n ¡Tu entrada ha sido añadida exitosamente!");
                
                
            } catch (Exception e) {
                out.print("Oops! Parece que los datos introducidos han sido incorrectos. Intentalo de nuevo!");
                e.printStackTrace();
            }


        %>

        <p></p>

    </body>
</html>
