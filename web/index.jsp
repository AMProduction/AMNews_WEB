<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 18.03.16
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>AMNews</title>

    <link href="design/css/navbar.css" rel="stylesheet">
    <link href="design/css/table.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.2.js"></script>
    <script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="design/js/filter.js"></script>
    <script src="design/js/table.js"></script>
    <script src="design/js/navbar.js"></script>
</head>
<body>

<nav id="header" role="navigation" class="navbar navbar-fixed-top">
    <div id="header-container" class="container navbar-container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="/show?" class="navbar-brand"><span class="glyphicon glyphicon-home"></span> AMNews</a>
        </div>
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="edit.jsp?hideUpdate=1&hideSave=0">
                    <span class="glyphicon glyphicon-plus"></span> Додати</a></li>
                <li><a class="edit_item" href="#">
                    <span class="glyphicon glyphicon-pencil"></span> Редагувати</a></li>
                <li><a class="delete_item" href="#">
                    <span class="glyphicon glyphicon-trash"></span> Видалити</a></li>
                <li><a href="tools/contact.jsp">
                    <span class="glyphicon glyphicon-envelope"></span> Контакти</a></li>
                <li><a href="/users">
                    <span class="glyphicon glyphicon-wrench"></span> Адмін</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a>Вітаємо, ${sessionScope.userName}</a></li>
                <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Вихід</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="jumbotron">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">Вас вітає система верстки новин AMNews</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Пошук</button>
                </div>
            </div>
            <table id="newsTable" class="table table-hover table-condensed">
                <thead class="filters">
                <tr>
                    <th><input type="text" class="form-control" placeholder="№" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Тема" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Востаннє змінено" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Автор" disabled></th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="news" items="${requestScope.newsData}">
                        <tr class="clickable-row" style="cursor: pointer"
                            data-toggle="tooltip" data-placement="top" title="${news.textNews}">
                            <td>${news.id}</td>
                            <td>${news.subject}</td>
                            <script>
                                var formattedDate = moment("${news.lastModifiedDate}").format("H:mm:ss DD/MM/YYYY");
                                document.write('<td>' + formattedDate + '</td>');
                            </script>
                            <td>${news.author}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:import url="tools/footer.jsp"/>