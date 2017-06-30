<%-- 
    Document   : buscaUsuarioQuadroKanban
    Created on : 29/06/2017, 23:27:40
    Author     : Júnior
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo.css" type="text/css" media="screen"> 
	<div id="header"><%@include file="jspf/header.jspf" %></div>
        <div id="menu"><%@include file="jspf/menu.jspf" %></div>
        <title>Buscar usuário</title>
    </head>
    <body>
        <div id="conteudo">
        <center>
            <h1>Buscar usuário</h1>
            <br>
            <form method="post">
                <select name="idUsuario">
                    <c:forEach items="${usuario}" var="usuario">
                        <option value="${usuario.id}">${usuario.nome}</option>
                    </c:forEach>
                </select>
                <button type="submit">Criar quadro Kanban</button>
            </form>
        </center>    
        </div>
    </body>
    <footer>
        <%@include file="jspf/footer.jspf" %>
    </footer>
</html>