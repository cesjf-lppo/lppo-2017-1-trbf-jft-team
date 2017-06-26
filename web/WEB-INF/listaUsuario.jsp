<%-- 
    Document   : listaUsuario
    Created on : 26/06/2017, 17:43:50
    Author     : Júnior
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estilo.css" >
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Lista de usuários</title>
    </head>
    <body>
        <center>
        <h1>Listar Coletas</h1>
        <table border="1">
            <tr>
                <th>ID: </th>
                <th>Nome: </th>
                <th>E-mail: </th>
            </tr>
            <c:forEach var="variavel" items="${usuarios}">
                <tr>
                    <td>${usuario.id}</td>
                    <td>${usuario.nome}</td>
                    <td>${usuario.email}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        
        </center>
    </body>
    <footer>
        <%@include file="jspf/footer.jspf" %>
    </footer>
</html>