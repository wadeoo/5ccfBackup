<%-- 
    Author     : lzd
--%>

<%@page import="com.sm.util.STATUS_TYPE"%>
<%@page import="com.sm.util.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>还书</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%!
            boolean hasStatus = false;
        %>
        <%
            if (request.getAttribute(Constants.HAS_STATUS) != null) {
                if ((Boolean) request.getAttribute(Constants.HAS_STATUS) == true) {
                    hasStatus = true;
                }
            } else {
                hasStatus = false;
            }
        %>

        <nav class="navbar navbar-inverse navbar-fixed-top " style="background:purple">
            <div class="container ">
                <div class="navbar-header  text-dark">
                    <a class="navbar-brand" href="index.html">图书馆管理系统</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html">主页</a></li>
                        <li><a href="SearchBookController">查询</a></li>
                        <li class="active"><a href="#">借阅</a></li>
                        <li><a href="FineTrackingController">罚款</a></li>
                        <li><a href="NewBorrowerController">借阅人</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <br><br><br>


        <div class="panel panel-default">
            <div class="panel-heading">还书</div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/CheckInBookController" method="POST">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="<%=Constants.CHECK_IN_REQ_DATE%>">日期:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="<%= Constants.CHECK_IN_REQ_DATE%>" placeholder="请输入日期yyyy-MM-dd format only"/>
                        </div>
                    </div>
                    <input type="hidden" name="<%= Constants.CHECK_IN_REQ_BOOK_ID%>" value="<%= request.getParameter(Constants.CHECK_IN_REQ_BOOK_ID)%>">
                    <input type="hidden" name="<%= Constants.CHECK_IN_REQ_BRANCH_ID%>" value="<%= request.getParameter(Constants.CHECK_IN_REQ_BRANCH_ID)%>">
                    <input type="hidden" name="<%= Constants.CHECK_IN_REQ_CARD_NO%>" value="<%= request.getParameter(Constants.CHECK_IN_REQ_CARD_NO)%>">
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-dark">提交</button>
                        </div>
                    </div>
                </form>

                <% if (hasStatus) {%>
                <h5>
                    <% if (request.getAttribute(Constants.STATUS_TYPE) == STATUS_TYPE.ERROR) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <strong>
                            <%= request.getAttribute(Constants.STATUS_BODY)%>
                        </strong>
                    </div>
                    <% } else if (request.getAttribute(Constants.STATUS_TYPE) == STATUS_TYPE.WARNING) {
                    %>
                    <div class="alert alert-info" role="alert">
                        <strong>
                            <%= request.getAttribute(Constants.STATUS_BODY)%>
                        </strong>
                    </div>
                    <% } else if (request.getAttribute(Constants.STATUS_TYPE) == STATUS_TYPE.SUCCESS) {
                    %>
                    <div class="alert alert-success" role="alert">
                        <strong>
                            <%= request.getAttribute(Constants.STATUS_BODY)%>
                        </strong>
                    </div>
                    <% }%>
                </h5>
                <%}%>
            </div>
        </div>
    </body>
</html>
