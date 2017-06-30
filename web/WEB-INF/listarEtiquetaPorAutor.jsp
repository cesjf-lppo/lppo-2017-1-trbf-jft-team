<%-- 
    Document   : listarEtiquetaPorAutor
    Created on : 29/06/2017, 21:34:08
    Author     : tiago
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Etiqueta por Autor</title>
    </head>
    <body>
               <table>
                            <select>  
                                <c:forEach var="usuario" items="${usuario}">  
                                    <option value="${usuario.id}">${usuario.nome}</option>  
                                </c:forEach> 
                            </select>
                            <input type="submit" value="Pesquisar" /><p>
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Referência para uma tarefa</th><br>
                            <th>Título</th><br>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="etiqueta" items="${etiqueta2}">
                                    <tr>
                                        <td><a href="editarEtiqueta.html?id=${etiqueta.id}">${etiqueta.id}</a></td>
                                        <td><a href="listarTarefa.html?id=${etiqueta.tarefa.id}">${etiqueta.tarefa.titulo}</td>
                                        <td>${etiqueta.titulo}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                    </table>
    </body>
</html>
