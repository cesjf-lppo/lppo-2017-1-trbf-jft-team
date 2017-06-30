<%-- 
    Document   : listaPorTitulo
    Created on : 29/06/2017, 22:40:00
    Author     : tiago
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo.css" type="text/css" media="screen"> 
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Listar etiqueta por Titulo</title>
    </head>
    <body>
	<div id="conteudo">
	    <center>
	<h1>Listar Etiqueta Por Titulo</h1>
                <table border="1" align="center">
                    <tr>
                        <th>Id</th>
                        <th>Autor</th>
                        <th>Tarefa</th>
                        <th>Titulo</th>
                        
                    </tr>
                    <c:forEach var="etiqueta" items="${etiqueta}">
                        <tr>
                            <td><a href="editarEtiqueta.html?id=${etiqueta.id}">${etiqueta.id}</a></td>
                            <td><a href="etiquetaPorAutor.html?id=${etiqueta.usuario.id}">${etiqueta.usuario.nome}</a></td>
                            <td>${etiqueta.tarefa.titulo}</td>
                            <td><a href="listarEtiqueta.html?titulo=${etiqueta.titulo}">${etiqueta.titulo}</a></td>
                            <td><a href="excluirEtiqueta.html?id=${etiqueta.id}">&#128465;</a></td>
                        </tr>    
                    </c:forEach>        
                </table>
	    </center>
	</div>
        
    </body>
</html>
