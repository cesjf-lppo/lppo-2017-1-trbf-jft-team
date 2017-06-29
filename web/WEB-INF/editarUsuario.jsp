<%-- 
    Document   : editaUsuario
    Created on : 26/06/2017, 21:42:18
    Author     : tiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo.css" type="text/css" media="screen"> 
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Editar usuário</title>
    </head>
    <body>
        <div id="conteudo">
        <center>
           <h1>Editar usuário</h1>
	<form method="post">
	    <label> ID: <input name="id" type="hidden" value="${usuario.id}"/> ${usuario.id} </label><p>
	    <label> Nome: <input name="nome" value="${usuario.nome}"/></label><p>
	    <label> Email: <input name="email"  value="${usuario.email}"/></label><p>
	    <label> Senha <input name="senha"  value="${usuario.senha}"/></label><p>
        <input type="submit" value="Cadastrar" />
        <input type="reset" value="Cancelar" />	
	</form>
        </center>
        </div>
    </body>
    <footer><%@include file="jspf/footer.jspf" %></footer>
</html>
