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
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/plug-ins/1.10.7/integration/bootstrap/3/dataTables.bootstrap.js"></script>
</head>
<body>

<nav role="navigation" class="navbar navbar-inverse">
    <div class="navbar-header">
        <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="/show?" class="navbar-brand">AMNews</a>
    </div>
    <div id="navbarCollapse" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li class="active"><a href="/edit.jsp">Додати</a></li>
            <li><a href="/edit.jsp">Редагувати</a></li>
            <li><a href="#">Видалити</a></li>
            <li><a href="#">Контакти</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="jumbotron">
        <div class="panel panel-default">
            <div class="panel-heading">Вас вітає система верстки новин AMNews</div>
            <div class="panel-body">
                <p>Список останніх новин.</p>
            </div>
            <table id="newsTable" class="table table-hover">
                <thead>
                <tr>
                    <th>№</th>
                    <th>Тема</th>
                    <th>Востаннє змінено</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="news" items="${requestScope.newsData}">
                        <tr class="clickable-row">
                            <td>${news.id}</td>
                            <td>${news.subject}</td>
                            <td>${news.lastModifiedDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <script>
                $(document).ready(function() {
                    $('#newsTable').dataTable();

                    $('#newsTable').on('click', '.clickable-row', function(event) {
                        if($(this).hasClass('active')){
                            $(this).removeClass('active');
                        } else {
                            $(this).addClass('active').siblings().removeClass('active');
                        }
                    } );
                });
            </script>
        </div>
    </div>

    <form action="show" method="get">
        <button type="submit" class="btn btn-default">Отримати дані</button>
    </form>

    <hr>
    <div class="row">
        <div class="col-xs-12">
            <footer>
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