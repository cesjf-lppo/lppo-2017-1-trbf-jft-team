<%-- 
    Document   : novaTarefa
    Created on : 26/06/2017, 17:14:01
    Author     : Júnior
--%>

<%@page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estilo.css" >
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Cadastrar tarefa</title>
    </head>
    <body>
        <center>
        <h1>Cadastrar tarefa</h1>
        <p>
            <table border="0">
            <tr align ="left"><td>
        <form method="post">
                <p>Título <input type="text" name="nome" size="35" value="" /><p>
                Descrição <input type="text" name="email" size="35" value="" /><p>
                Data para concluir: <input type="text" name="dataConcluir" value="" size="25" placeholder="Somente números (ddmmaaaa)" /><br><br> 
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
