<%-- 
    Document   : DataEliminar
    Created on : 18/05/2020, 07:06:55 AM
--%>

<%@page contentType="text/html; charset=ISO-8859-1"%>
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
            String ID = request.getParameter("ID");

            Connection con = null;
            Statement st = null;

            try {

                Class.forName("com.mysql.cj.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1/pueblosmagicos?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false", "root", "root");
                st= con.createStatement();
                
                String query ="UPDATE `pueblosmagicos`.`registros` SET `Visibilidad` = '0' WHERE (`id` = '"+ID+"');";
                st.executeUpdate(query);
                
                out.println("\n ¡Tu entrada ha sido eliminada exitosamente!");
                
                
            } catch (Exception e) {
                
                out.print("Oops! Parece que los datos introducidos han sido incorrectos. Intenta de nuevo!");
                e.printStackTrace();
            }


        %>

        <p></p>


    </body>
</html>
