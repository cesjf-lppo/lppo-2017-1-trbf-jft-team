<%-- 
    Document   : editarEtiqueta
    Created on : 29/06/2017, 19:54:11
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
        <title>Editar etiqueta</title>
    </head>
    <body>
	<div id="conteudo">
	    <center>
		<h1>Editar Etiqueta</h1>
		<form method="post">
		    <table>
			<tr>
			    <td>Id: </td>
			    <td> <input type="hidden" name="id" value="${etiqueta.id}"/>${etiqueta.id}</td>
			</tr>
			<tr>
			    <td>Titulo: </td>
			    <td><input type="text" name="titulo" value="${etiqueta.titulo}" /></td>
			</tr>
			<tr>
			    <td colspan="2" align="right">
				<button type="submit">Salvar</button>
			    </td>
			</tr>
		    </table>
		</form>
	    </center>
	</div>
    </body>
</html>
