<%-- 
    Document   : tareas
    Created on : 16/03/2023, 17:21:22
    Author     : marher
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="./styletables.css"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <jsp:useBean class="edu.levelup.entities.Tarea" scope="session" id="tareaBean"/>
            <jsp:useBean class="edu.levelup.entities.Usuario" scope="session" id="usuarioBean"/>
            <jsp:setProperty param="nombre" property="nombre" name="tareaBean"/>
            <jsp:setProperty param="finalizado" property="finalizado" name="tareaBean"/>
            <form action="tareas.jsp">
                Agregar tarea <input type="text" name="nombre" />
                <input type="hidden" name="agregarTarea"/>
                <input type="submit" value="Agregar"/>
            </form>
            <jsp:useBean class="edu.levelup.services.TareaService" scope="session" id="tareaService" />
            <%tareaService.crearTarea(usuarioBean, tareaBean);%>
            <h3>Lista de Tareas </h3>
            <ul>
                <%
                    java.util.List<edu.levelup.entities.Tarea> lista = tareaService.listarTareas();
                    for (int  i = 0 ; i< lista.size(); i++){
                        edu.levelup.entities.Tarea tarea = (edu.levelup.entities.Tarea)lista.get(i);
                        out.println("<li>" + tarea.getIdTarea()+"  - "+ tarea.getNombre() + "</li>");
                    }
                %>
        </table>
    </body>
</html>
