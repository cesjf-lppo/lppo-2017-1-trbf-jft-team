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
	 <link href="../css/estilo.css" rel="stylesheet" type="text/css" >
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Editar Usuario</title>
    </head>
    <body>
	
           <h1>Editar Usuario</h1>
	<form method="post">
	    <label> id: <input name="id" type="hidden" value="${usuario.id}"/> ${usuario.id} </label>
	    <label> Nome: <input name="nome" value="${usuario.nome}"/>  </label>
	    <label> Email: <input name="email"  value="${usuario.email}"/>  </label>
	    <label> Senha <input name="senha"  value="${usuario.senha}"/>  </label>
	    
		
	<input type="submit" value="Cadastrar" />
        <input type="reset" value="Cancelar" />	
	    
	</form>
	    
	
    </body>
</html>
