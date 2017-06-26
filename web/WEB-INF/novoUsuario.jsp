<%-- 
    Document   : novoUsuario
    Created on : 26/06/2017, 16:08:26
    Author     : cpd
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
        <title>Cadastrar usuário</title>
    </head>
    <body>
        <center>
        <h1>Cadastrar usuário</h1>
        <p>
            <table border="0">
            <tr align ="left"><td>
        <form method="post">
                <p>Nome: <input type="text" name="nome" size="35" value="" /><p>
                E-mail: <input type="text" name="email" size="35" value="" /><p>
                Senha: <input type="password" name="senha" size="35" value="" /><br><br>
                
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
