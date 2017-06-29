<%-- 
    Document   : index
    Created on : 24/06/2017, 23:31:00
    Author     : Júnior
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo.css" type="text/css" media="screen"> 
        <div id="header"><%@include file="WEB-INF/jspf/header.jspf" %></div>
        <div id="menu"><%@include file="WEB-INF/jspf/menu.jspf" %></div>
        <title>Início</title>
    </head>
    <body>
        <div id="conteudo">
        <table text border="1" width="400" cellpadding="7" cellspacing="1" align="center">
            <thead>
                <tr>
                    <th>Aluno</th>
                    <th>Matrícula</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>José Flávio de Assis Júnior</td>
                    <td>02528860</td>
                </tr>
                <tr>
                    <td>Tiago Souza Nogueira</td>
                    <td>02528428</td>
                </tr>
            </tbody>
        </table>
        <p>
            </div>
    </body>
    <footer>
        <div id="footer"><%@include file="WEB-INF/jspf/footer.jspf" %></div>
    </footer>
</html>
