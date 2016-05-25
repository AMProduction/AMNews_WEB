<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 15.05.16
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Admin panel</title>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.2.js"></script>
        <script src="../bootstrap/js/bootstrap.js"></script>
        <script src="../design/js/usersSearch.js"></script>
        <script src="../design/js/usersTable.js"></script>

        <link href="../design/css/admin.css" rel="stylesheet">
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    </head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-2 well well-sm">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="/show?"><i class="fa fa-fw"></i><span class="glyphicon glyphicon-home"></span> На головну</a></li>
                <li><a href="../admin/adduser.jsp"><i class="fa fa-fw"></i><span class="glyphicon glyphicon-plus"></span> Додати користувача</a></li>
                <li><a class="edit_user" href="#"><i class="fa fa-fw"></i><span class="glyphicon glyphicon-pencil"></span> Редагувати користувача</a></li>
                <li><a class="delete_user" href="#"><i class="fa fa-fw"></i><span class="glyphicon glyphicon-trash"></span> Видалити користувача</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Список користувачів</h3>
                    <div class="pull-right">
                        <span class="clickable filter" data-toggle="tooltip" title="Пошук" data-container="body">
                                <i class="glyphicon glyphicon-filter"></i>
                        </span>
                    </div>
                </div>
                <div class="panel-body">
                    <input type="text" class="form-control" id="usersTable-filter" data-action="filter" data-filters="#usersTable" placeholder="Пошук" />
                </div>
                <table id="usersTable" class="table table-hover table-condensed">
                    <thead>
                    <tr>
                        <th>№</th>
                        <th>Прізвище</th>
                        <th>Ім'я</th>
                        <th>Посада</th>
                        <th>Логін</th>
                        <th>Пароль</th>
                        <th>Рівень доступу</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${requestScope.usersData}">
                            <tr class="clickable-row" style="cursor: pointer">
                                <td>${user.id}</td>
                                <td>${user.lastName}</td>
                                <td>${user.firstName}</td>
                                <td>${user.position}</td>
                                <td>${user.login}</td>
                                <td>${user.password}</td>
                                <td>${user.accessLevel}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<c:import url="../tools/footer.jsp"/>
