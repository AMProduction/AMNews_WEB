<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 29.03.16
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8;" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Редагування</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h1 class="panel-title">Редагування новини</h1>
        </div>
        <form method="post">
        <div class="panel-body">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a data-toggle="tab" href="#subjectNews">Тема</a></li>
                <li><a data-toggle="tab" href="#textPresenterNews">Дикторський текст</a></li>
                <li><a data-toggle="tab" href="#textNewsNews">Текст новини</a></li>
            </ul>
            <div class="tab-content">
                <div id="subjectNews" class="tab-pane fade in active">
                    <textarea class="form-control" rows="15" name="subject" required></textarea>
                </div>
                <div id="textPresenterNews" class="tab-pane fade">
                    <textarea class="form-control" rows="15" name="textPresenter"></textarea>
                </div>
                <div id="textNewsNews" class="tab-pane fade">
                    <textarea class="form-control" rows="15" name="textNews" required></textarea>
                </div>
            </div>
        </div>
        <div class="panel-footer clearfix">
            <div class="pull-left">
                <button type="submit" class="btn btn-primary" formaction="add">Зберегти</button>
                <button type="submit" class="btn btn-info">Оновити</button>
            </div>
        </div>
        </form>
    </div>
</div>
</body>
</html>
