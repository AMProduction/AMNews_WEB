<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 19.05.16
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редагування даних користувача</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.2.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>

    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="../design/css/margin-top.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="panel-title">Редагування інформації про користувача</h1>
        </div>
        <form role = "form" method="post" id="editUserForm">
            <div class="panel-body">
                <div class="row">

                    <div class="col-sm-6 col-md-4 col-lg-3"><!--Column left-->
                        <div class="form-group">
                            <label for="id" class="control-label">№</label>
                            <textarea class="form-control" rows="1" id="id" name="id"
                                      placeholder="№" readonly style="resize: none">${user.id}</textarea>
                        </div>
                    </div><!--Column left-->

                    <div class="col-sm-6 col-md-4 col-lg-3"><!--Column middle-->
                        <div class="form-group">
                            <label for="lastName" class="control-label">Прізвище</label>
                            <textarea class="form-control" rows="1" id="lastName" name="lastName"
                                      placeholder="Прізвище" style="resize: none">${user.lastName}</textarea>
                        </div>
                    </div><!--Column middle-->

                    <div class="col-sm-6 col-md-4 col-lg-3"><!--Column middle-->
                        <div class="form-group">
                            <label for="firstName" class="control-label">Ім'я</label>
                            <textarea rows="1" class="form-control" id="firstName" name="firstName"
                                      placeholder="Ім'я" style="resize: none">${user.firstName}</textarea>
                        </div>
                    </div><!--Column middle-->

                    <div class="col-sm-6 col-md-4 col-lg-3"><!--Column right-->
                        <div class="form-group">
                            <label for="login" class="control-label">Логін</label>
                            <textarea rows="1" class="form-control" id="login" name="login"
                                      placeholder="Логін" style="resize: none">${user.login}</textarea>
                        </div>
                    </div><!--Column right-->

                    <div class="col-sm-6"><!--Column left-->
                        <div class="form-group">
                            <label for="password" class="control-label">Пароль</label>
                            <textarea rows="1" type="password" class="form-control" id="password" name="password"
                                      placeholder="Пароль" style="resize: none">${user.password}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="position" class="control-label">Посада</label>
                            <select class="form-control" name="position" id="position"
                                    onChange="pastePosition(this, 'newposition')" onMouseOut="pastePositionInit(this, 'newposition')">
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
                            <input type="text" class="form-control" name="newposition" id="newposition"
                                      placeholder="Посада" readonly value="${user.position}">
                        </div>
                    </div><!--Column left-->

                    <div class="col-sm-6"><!--Column right-->
                        <div class="form-group">
                            <label for="repeatPassword" class="control-label">Введіть пароль ще раз</label>
                            <textarea rows="1" type="password" class="form-control" id="repeatPassword"
                                      name="repeatPassword" placeholder="Введіть пароль ще раз" style="resize: none">${user.password}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="accessLevel" class="control-label">Рівень доступу</label>
                            <select class="form-control" name="accessLevel" id="accessLevel"
                                    onChange="pasteAccessLevel(this, 'newaccessLevel')" onMouseOut="pasteAccessLevelInit(this, 'newaccessLevel')">
                                <option value="">Виберіть рівень доступу</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="newaccessLevel" id="newaccessLevel"
                                      placeholder="Рівень доступу" readonly value="${user.accessLevel}">
                        </div>
                    </div><!--Column right-->
                </div>
            </div>
            <div class="panel-footer clearfix">
                <div class="pull-left">
                    <button id="save" type="submit" class="btn btn-primary" formaction="../updateuser">
                        <span class="glyphicon glyphicon-floppy-disk"></span> Зберегти</button>
                    <a href="/users" class="btn btn-primary">
                        <span class="glyphicon glyphicon-arrow-left"></span> Назад</a>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function pastePositionInit(position)
    {
        newposition = document.getElementById(newposition);
        var idx = position.selectedIndex;
        var content = position.options[idx].innerHTML;
        if(newposition.value == "")
            newposition.value = content;
    }

    function pastePosition(position, newposition)
    {
        newposition = document.getElementById(newposition);
        var idx = position.selectedIndex;
        var content = position.options[idx].innerHTML;
        newposition.value = content;
    }

    function pasteAccessLevelInit(accessLevel)
    {
        newaccessLevel = document.getElementById(newaccessLevel);
        var idx = accessLevel.selectedIndex;
        var content = accessLevel.options[idx].innerHTML;
        if(newaccessLevel.value == "")
            newaccessLevel.value = content;
    }

    function pasteAccessLevel(accessLevel, newaccessLevel)
    {
        newaccessLevel = document.getElementById(newaccessLevel);
        var idx = accessLevel.selectedIndex;
        var content = accessLevel.options[idx].innerHTML;
        newaccessLevel.value = content;
    }
</script>

<c:import url="../tools/footer.jsp"/>