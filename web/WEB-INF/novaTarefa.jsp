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
        <link rel="stylesheet" href="css/estilo.css" type="text/css" media="screen"> 
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Cadastrar tarefa</title>
    </head>
    <body>
        <div id="conteudo">
        <center>
        <h1>Cadastrar tarefa</h1>
        <p>
            <table border="0">
            <tr align ="left"><td>
        <form method="post">
                <p>Título: <input type="text" name="titulo" size="35" value="" /><p>
                Descrição: <input type="text" name="descricao" size="29" value="" /><p>
                Data para concluir: <input type="date" name="dataConcluir" value="" size="24" /><br><br> 
                <input type="submit" value="Cadastrar" />
                <input type="reset" value="Cancelar" />
        </center>
        </td></tr></table>
          </form>
        </div>
    </body>
    <footer>
        <%@include file="jspf/footer.jspf" %>
    </footer>
</html>
