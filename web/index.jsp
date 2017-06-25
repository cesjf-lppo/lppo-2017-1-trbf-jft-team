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
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <title>Início</title>
    </head>
    <body>
        <table border="1" width="500" align="center">
            <thead>
                <tr>
                    <th>Aluno</th>
                    <th>Matrícula</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>José Flávio de Assis Júnior</td>
                    <td>Tiago Souza Nogueira</td>
                </tr>
                <tr>
                    <td>02528860</td>
                    <td>00000000</td>
                </tr>
            </tbody>
        </table>
        <p>
    </body>
    <footer>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </footer>
</html>
