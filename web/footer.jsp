<%--
  Created by IntelliJ IDEA.
  User: snooki
  Date: 31.03.16
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<div class="row">
    <div class="col-xs-12">
        <footer>
            <div class="container">
                <hr>
                <div class="text-center center-block">
                    <a href="/show?">--- AMNews ---</a>
                    <br>
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
            <div class="text-center center-block">
                <p>&copy; Copyright <%= currentYear%> AMProduction</p>
            </div>
        </footer>
    </div>
</div>

</body>
</html>
