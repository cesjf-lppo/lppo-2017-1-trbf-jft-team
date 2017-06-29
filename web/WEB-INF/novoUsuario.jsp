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
        <link rel="stylesheet" href="css/estilo.css" type="text/css" media="screen"> 
	<div id="header"><%@include file="jspf/header.jspf" %></div>
        <div id="menu"><%@include file="jspf/menu.jspf" %></div>
        <title>Cadastrar usuário</title>
    </head>
    <body>
        <div id="conteudo">
        <center>
        <h1>Cadastrar usuário</h1>
        <p>
            <table border="0">
            <tr align ="left"><td>
        <form method="post">
                <p>Nome: <input type="text" name="nome" size="35" value="" /><p>
                E-mail: <input type="text" name="email" size="35" value="" /><p>
                Senha: <input type="password" name="senha" size="35" value="" /><br><br>
                </td></tr></table>
                <input type="submit" value="Cadastrar" />
                <input type="reset" value="Cancelar" />
        </center>
            </form>
            
        </div>
    </body>
    <footer>
        <%@include file="jspf/footer.jspf" %>
    </footer>
</html>
