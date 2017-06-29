<%-- 
    Document   : listarTarefa
    Created on : 27/06/2017, 20:02:41
    Author     : Júnior
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo.css" type="text/css" media="screen"> 
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Lista de tarefas</title>
    </head>
    <body>
        <div id="conteudo">
        <center>
        <h1>Listar tarefas</h1>
        <table border="1" align="center">
            <tr>
                <th>ID: </th>
                <th>Título: </th>
                <th>Descrição: </th>
                <th>Data para concluir: </th>
                <th>Data de conlusão: </th>
            </tr>
            <c:forEach var="tarefa" items="${tarefa}">
                <tr>
                    <td><a href="editarTarefa.html?id=${tarefa.id}">${tarefa.id}</a></td>
                    <td>${tarefa.titulo}</td>
                    <td>${tarefa.descricao}</td>
                    <td>${tarefa.dataConcluir}</td>
                    <td>${tarefa.dataConclusao}</td>
                    <td><a href="excluirTarefa.html?id=${tarefa.id}">&#128465;</a></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        </center>
        </div>
    </body>
    <footer>
        <%@include file="jspf/footer.jspf" %>
    </footer>
</html>