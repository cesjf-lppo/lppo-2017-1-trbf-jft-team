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
        <h1>Editar Tarefa</h1>
	<form method="post">
	    <label> id: <input name="id" type="hidden" value="${tarefa.id}"/> ${tarefa.id} </label>
	    <label> Título: <input name="nome" value="${tarefa.titulo}"/>  </label>
	    <label> Descrição: <input name="email"  value="${tarefa.descricao}"/>  </label>
	    <label>Data para concluir: <fmt:formatDate value="${tarefa.dataConcluir}" type="date" dateStyle="default" />  </label>
            <label>Data de conclusão: <fmt:formatDate value="${tarefa.dataConclusao}" type="date" dateStyle="default" /></label>
        <input type="submit" value="Cadastrar" />
        <input type="reset" value="Cancelar" />	
        </form>
    </body>
    <footer>
        <%@include file="jspf/footer.jspf" %>
    </footer>
</html>
