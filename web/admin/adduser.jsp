<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 16.05.16
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Введення інформації про користувача</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.2.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../design/js/addUserValidation.js"></script>

    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="../design/css/margin-top.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="panel-title">Введення інформації про користувача</h1>
        </div>
        <form role = "form" method="post" id="addUserForm">
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-6"><!--Column left-->
                        <div class="form-group">
                            <label for="lastName" class="control-label">Прізвище</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Прізвище">
                        </div>
                        <div class="form-group">
                            <label for="login" class="control-label">Логін</label>
                            <input type="text" class="form-control" id="login" name="login" placeholder="Логін">
                        </div>
                        <div class="form-group">
                            <label for="password" class="control-label">Пароль</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Пароль">
                        </div>
                    </div><!--Column left-->

                    <div class="col-sm-6"><!--Column right-->
                        <div class="form-group">
                            <label for="firstName" class="control-label">Ім'я</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Ім'я">
                        </div>
                        <div class="form-group">
                            <label for="position" class="control-label">Посада</label>
                            <select class="form-control" name="position" id="position">
                                <option value="">Виберіть посаду</option>
                                <option value="Журналіст/редактор">Журналіст/редактор</option>
                                <option value="Випусковий редактор">Випусковий редактор</option>
                                <option value="Диктор/ведучий">Диктор/ведучий</option>
                                <option value="Літературний редактор">Літературний редактор</option>
                                <option value="Продюсер">Продюсер</option>
                                <option value="Режисер">Режисер</option>
                                <option value="Режисер монтажу">Режисер монтажу</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="repeatPassword" class="control-label">Введіть пароль ще раз</label>
                            <input type="password" class="form-control" id="repeatPassword" name="repeatPassword" placeholder="Введіть пароль ще раз">
                        </div>
                    </div><!--Column right-->
                </div>
            </div>
            <div class="panel-footer clearfix">
                <div class="pull-left">
                    <button id="save" type="submit" class="btn btn-primary" formaction="../adduser">
                        <span class="glyphicon glyphicon-floppy-disk"></span> Зберегти</button>
                    <a href="/users" class="btn btn-primary">
                        <span class="glyphicon glyphicon-arrow-left"></span> Назад</a>
                </div>
            </div>
        </form>
    </div>
</div>

<c:import url="../tools/footer.jsp"/>
