<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 20.05.16
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error 401</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="../bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div class="jumbotron">
        <div class="page-header">
            <h1>Помилка 401</h1>
        </div>
        <p class="text-danger">Несанкційонований доступ</p>
        <p class="text-info">Для продовження поверніться на попередню сторінку</p>
    </div>
</div>

<c:import url="../tools/footer.jsp"/>