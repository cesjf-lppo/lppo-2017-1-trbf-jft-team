<%-- 
    Document   : novaEtiqueta
    Created on : 26/06/2017, 17:25:46
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
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Cadastrar etiqueta</title>
    </head>
    <body>
        <div id="conteudo">
        <center>
       <h1>Nova Etiqueta</h1>
                <form method="post">
                    <table>
                        <tr>
                            <td>Usuário: </td>
                            <td>
                                <select name="usuarioId">
                                    <c:forEach var="usuario" items="${usuario}">
                                        <option value="${usuario.id}">${usuario.nome}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Tarefa </td>
                            <td>
                                <select name="tarefaId">
                                    <c:forEach var="tarefa" items="${tarefa}">
                                        <option value="${tarefa.id}">${tarefa.titulo}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Titulo: </td>
                            <td>
                                <input type="text" name="titulo" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <button type="submit">Enviar</button>
                            </td>
                        </tr>
                    </table>
                </form>
    </body>
    <footer>
        <%@include file="jspf/footer.jspf" %>
    </footer>
</html>
