<%-- 
    Document   : quadroKanban
    Created on : 29/06/2017, 23:09:21
    Author     : Júnior
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h1>Quadro Kanban</h1>
            <br>
            <h1>Usuário: ${usuario.nome}</h1>
            <div id="etiqueta">
                <h3>A Fazer: </h3>
                <c:forEach items="${etiqueta}" var="etiqueta">
                    <c:if test="${etiqueta.titulo == 'A Fazer'}">
                        <div id="tarefa">
                            #${etiqueta.tarefa.id} - ${etiqueta.tarefa.titulo}
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div id="etiqueta">
                <h3>Fazendo: </h3>
                <c:forEach items="${etiqueta}" var="etiqueta">
                    <c:if test="${etiqueta.titulo == 'Fazendo'}">
                        <div id="tarefa">
                            #${etiqueta.tarefa.id} - ${etiqueta.tarefa.titulo}
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div id="etiqueta">
                <h3>Bloqueado: </h3>
                <c:forEach items="${etiqueta}" var="etiqueta">
                    <c:if test="${etiqueta.titulo == 'Bloqueado'}">
                        <div id="tarefa">
                            #${etiqueta.tarefa.id} - ${etiqueta.tarefa.titulo}
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div id="etiqueta">
                <h3>Finalizado: </h3>
                <c:forEach items="${etiqueta}" var="etiqueta">
                    <c:if test="${etiqueta.titulo == 'Finalizado'}">
                        <div id="tarefa">
                            #${etiqueta.tarefa.id} - ${etiqueta.tarefa.titulo}
                        </div>
                    </c:if>
                </c:forEach>
        </center>    
    </div>
</body>
<footer>
    <%@include file="jspf/footer.jspf" %>
</footer>
</html>