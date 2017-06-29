<%-- 
    Document   : editarTarefa
    Created on : 28/06/2017, 14:34:09
    Author     : Júnior
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="erro.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" >
        <%@include file="jspf/header.jspf" %>
        <%@include file="jspf/menu.jspf" %>
        <title>Editar Tarefa</title>
    </head>
    <body>
        <center>
        <h1>Editar Tarefa</h1><br><br>
	<form method="post">
	    <label> ID: <input name="id" type="hidden" value="${tarefa.id}"/> ${tarefa.id} </label><p>
	    <label> Título: <input name="nome" value="${tarefa.titulo}"/>  </label><p>
	    <label> Descrição: <input name="email"  value="${tarefa.descricao}"/>  </label><p>
	    <label>Data para concluir: <input name="dataConcluir" value="${tarefa.dataConcluir}" type="date" dateStyle="default" />  </label><p>
            <label>Data de conclusão: <input name="dataConclusao" value="${tarefa.dataConclusao}" type="date" dateStyle="default" /></label><p>
        <input type="submit" value="Cadastrar" />
        <input type="reset" value="Cancelar" />	
        </form>
        </center>
    </body>
    <footer>
        <%@include file="jspf/footer.jspf" %>
    </footer>
</html>
