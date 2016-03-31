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

    <link href="bootstrap/css/navbar.css" rel="stylesheet">
    <link href="bootstrap/css/table.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="bootstrap/css/footer_social.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.2.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/filter.js"></script>
    <script src="bootstrap/js/table.js"></script>
    <script src="bootstrap/js/navbar.js"></script>
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
            <a href="/show?" class="navbar-brand">AMNews</a>
        </div>
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="edit.jsp">Додати</a></li>
                <li><a class="edit_item" href="#">Редагувати</a></li>
                <li><a class="delete_item" href="#">Видалити</a></li>
                <li><a href="contact.jsp">Контакти</a></li>
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
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table id="newsTable" class="table table-hover table-condensed">
                <thead class="filters">
                <tr>
                    <th><input type="text" class="form-control" placeholder="№" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Тема" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Востаннє змінено" disabled></th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="news" items="${requestScope.newsData}">
                        <tr class="clickable-row" style="cursor: pointer">
                            <td>${news.id}</td>
                            <td>${news.subject}</td>
                            <td>${news.lastModifiedDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <footer>
                <div class="container">
                    <hr>
                    <div class="text-center center-block">
                        <a href="https://www.facebook.com/Andrii.Malchyk"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
                        <a href="https://plus.google.com/u/0/+AndriiMalchyk"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
                        <a href="mailto:snooki17@gmail.com"><i id="social-em" class="fa fa-envelope-square fa-3x social"></i></a>
                    </div>
                    <hr>
                </div>
                <%@ page import="java.util.GregorianCalendar, java.util.Calendar" %>
                <%
                    GregorianCalendar currentDate = new GregorianCalendar();
                    int currentYear = currentDate.get(Calendar.YEAR);
                %>
                <p>&copy; Copyright <%= currentYear%> AMProduction</p>
            </footer>
        </div>
    </div>
</div>

</body>
</html>