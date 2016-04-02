<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 02.04.16
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<html>
<head>
    <title>Login</title>
    <link href="bootstrap/css/login.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please sign in</h3>
                </div>
                <div class="panel-body">
                    <form accept-charset="UTF-8" role="form" method="post" action="show">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Login" name="login" type="text" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password" type="password" value="">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me"> Remember Me
                                </label>
                            </div>
                            <input class="btn btn-lg btn-primary btn-block" type="submit" value="Login">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
