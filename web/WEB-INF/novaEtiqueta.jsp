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
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" >
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Cadastrar etiqueta</title>
    </head>
    <body>
        <center>
        <h1>Cadastrar etiqueta</h1>
        <p>
            <table border="0">
            <tr align ="left"><td>
        <form method="post">
                <c:forEach var="variavel" items="${usuarios}">
                <p>Usuário: ${usuario.nome}<p>
                </c:forEach>
                <c:forEach var="variavel" items="${tarefas}">
                Tarefa: ${tarefa.descricao}<p>
                Título: <select name="titulo">
                        <option value="1">A fazer</option>
                        <option value="2">Fazendo</option>
                        <option value="3">Bloqueado</option>
                        <option value="4">Feito</option>
                    </select>
                </c:forEach>
<br><br> 
                <input type="submit" value="Cadastrar" />
                <input type="reset" value="Cancelar" />
        </center>
            </form>
        </td></tr></table>
    </body>
    <footer>
        <%@include file="jspf/footer.jspf" %>
    </footer>
</html>
