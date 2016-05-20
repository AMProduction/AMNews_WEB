<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 28.03.16
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Java Error</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">

    <script src="../bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <div class="page-header">
            <h1>Java Error</h1>
        </div>
        <p class="text-danger">Вибачте, але трапилась помилка Java</p>
        <p class="text-info">Для продовження поверніться на попередню сторінку</p>

        <h3>Подробиці</h3>
        <p><code>Тип: ${pageContext.exception["class"]}</code></p>
        <p><code>Повідомлення: ${pageContext.exception.message}</code></p>
    </div>
</div>

<c:import url="../tools/footer.jsp"/>
