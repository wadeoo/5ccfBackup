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
        <title>借阅人管理</title>
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
            <div class="container">
                <div class="navbar-header  text-dark">
                    <a class="navbar-brand" href="index.html">图书馆管理系统</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html">主页</a></li>
                        <li><a href="SearchBookController">查询</a></li>
                        <li><a href="BookLoanController">借阅</a></li>
                        <li><a href="FineTrackingController">罚款</a></li>
                        <li class="active"><a href="#">借阅人</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <br>
        <br>
        <br>

        <div class="panel panel-default">
            <div class="panel-heading">新增借阅人</div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/NewBorrowerController" method="POST">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="<%=Constants.NEW_BORROWER_REQ_FNAME%>">姓:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="<%= Constants.NEW_BORROWER_REQ_FNAME%>" placeholder="输入姓" 
                                   value="<% if (request.getParameter(Constants.NEW_BORROWER_REQ_FNAME) != null) {
                                           out.println(request.getParameter(Constants.NEW_BORROWER_REQ_FNAME));
                                       }%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="<%=Constants.NEW_BORROWER_REQ_LNAME%>">名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="<%= Constants.NEW_BORROWER_REQ_LNAME%>" placeholder="输入名"
                                   value="<% if (request.getParameter(Constants.NEW_BORROWER_REQ_LNAME) != null) {
                                           out.println(request.getParameter(Constants.NEW_BORROWER_REQ_LNAME));
                                       }%>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="<%=Constants.NEW_BORROWER_REQ_EMAIL%>">邮箱:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="<%= Constants.NEW_BORROWER_REQ_EMAIL%>" placeholder="输入邮箱"
                                   value="<% if (request.getParameter(Constants.NEW_BORROWER_REQ_EMAIL) != null) {
                                           out.println(request.getParameter(Constants.NEW_BORROWER_REQ_EMAIL));
                                       }%>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="<%=Constants.NEW_BORROWER_REQ_ADDRESS%>">地址:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="<%= Constants.NEW_BORROWER_REQ_ADDRESS%>" placeholder="输入地址"
                                   value="<% if (request.getParameter(Constants.NEW_BORROWER_REQ_ADDRESS) != null) {
                                           out.println(request.getParameter(Constants.NEW_BORROWER_REQ_ADDRESS));
                                       }%>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="<%=Constants.NEW_BORROWER_REQ_CITY%>">城市:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="<%= Constants.NEW_BORROWER_REQ_CITY%>" placeholder="输入城市"
                                   value="<% if (request.getParameter(Constants.NEW_BORROWER_REQ_CITY) != null) {
                                           out.println(request.getParameter(Constants.NEW_BORROWER_REQ_CITY));
                                       }%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="<%=Constants.NEW_BORROWER_REQ_STATE%>">省份:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="<%= Constants.NEW_BORROWER_REQ_STATE%>" placeholder="输入省份"
                                   value="<% if (request.getParameter(Constants.NEW_BORROWER_REQ_STATE) != null) {
                                           out.println(request.getParameter(Constants.NEW_BORROWER_REQ_STATE));
                                       }%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="<%=Constants.NEW_BORROWER_REQ_PHONE%>">电话:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="<%= Constants.NEW_BORROWER_REQ_PHONE%>" placeholder="输入电话号码"
                                   value="<% if (request.getParameter(Constants.NEW_BORROWER_REQ_PHONE) != null) {
                                           out.println(request.getParameter(Constants.NEW_BORROWER_REQ_PHONE));
                                       }%>">
                        </div>
                    </div>


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
