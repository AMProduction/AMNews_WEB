<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 18.03.16
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AMNews</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>requestScope
</head>
<body>

<nav id="myNavbar" class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">AMNews</a>
        </div>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="http://www.tutorialrepublic.com" target="_blank">Home</a></li>
                <li><a href="/show" target="_blank">About</a></li>
                <li><a href="http://www.tutorialrepublic.com/contact-us.php" target="_blank">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="jumbotron">
        <div class="panel panel-default">
            <div class="panel-heading">Вас вітає система верстки новин AMNews</div>
            <div class="panel-body">
                <p>Список останніх новин.</p>
            </div>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>№</th>
                    <th>Тема</th>
                    <th>Востаннє змінено</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="news" items="${requestScope.newsData}">
                        <tr>
                            <td>${news.id}</td>
                            <td>${news.subject}</td>
                            <td>${news.lastModifiedDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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