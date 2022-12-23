<%-- 
    Author     : lzd
--%>

<%@page import="com.sm.util.STATUS_TYPE"%>
<%@page import="java.util.List"%>
<%@page import="com.sm.bean.SearchBookResultBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sm.util.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>查询图书</title>
    </head>
    <body>
        <!DOCTYPE html>
    <html>
        <head>
            <title>图书查询</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        </head>
        <body>
            <%!
                boolean hasData = false;
                boolean hasStatus = false;
            %>

            <%
                if (request.getAttribute(Constants.BOOK_SEARCH_JSP_REQ) != null) {
                    hasData = true;

                } else {
                    hasData = false;
                }
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
                            <li class="active"><a href="#">查询</a></li>
                            <li><a href="BookLoanController">借阅</a></li>
                            <li><a href="FineTrackingController">罚款</a></li>
                            <li><a href="NewBorrowerController">借阅人</a></li>
                        </ul>
                    </div>
                </div>
            </nav>


            <br><br><br>



            <div class="panel panel-default">
                <div class="panel-heading">查询</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/SearchBookController" method="POST">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="<%=Constants.BOOK_SEARCH_CONTROLLER_REQ_BOOK_ID%>">书本 ID:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="<%= Constants.BOOK_SEARCH_CONTROLLER_REQ_BOOK_ID%>" placeholder="输入书本ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="<%= Constants.BOOK_SEARCH_CONTROLLER_REQ_TITLE%>">书名:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="<%= Constants.BOOK_SEARCH_CONTROLLER_REQ_TITLE%>" placeholder="输入书名">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="<%= Constants.BOOK_SEARCH_CONTROLLER_REQ_AUTHORS%>">作者:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="<%= Constants.BOOK_SEARCH_CONTROLLER_REQ_AUTHORS%>" placeholder="输入作者">
                            </div>
                        </div>
                        <input type ="hidden" name ="<%=Constants.BOOK_LOAN_REQ_TYPE%>" value="<%=Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE%>">
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

            <div class="panel panel-default">
                <div class="panel-heading">查询结果</div>
                <div class="panel-body">
                    <%
                        if (hasData) {
                    %>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tr>
                                <th>书本 ID</th>
                                <th>书名</th>
                                <th>作者</th>
                                <th>分馆 ID</th>
                                <th>数量</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <%!
                                ArrayList<SearchBookResultBean> data = new ArrayList<SearchBookResultBean>();
                            %>
                            <%
                                data = (ArrayList<SearchBookResultBean>) request.getAttribute(Constants.BOOK_SEARCH_JSP_REQ);
                                for (SearchBookResultBean bean : data) {
                            %>
                            <tr>
                                <td><%= bean.getBookId()%>
                                </td>
                                <td><%= bean.getTitle()%>
                                </td>
                                <td><%= bean.getAuthors()%>
                                </td>
                                <td><%= bean.getBranchId()%>
                                </td>
                                <td><%= bean.getNoOfCopies()%>
                                </td>
                                <td><%= bean.getAvailability()%>
                                </td>
                                <td>
                                    <%
                                        if (Integer.parseInt(bean.getAvailability()) > 0) {
                                    %>
                                    <form method='POST' action='<%= request.getContextPath()%>/BookLoanController'>
                                        <input type='submit' class='btn btn-sm btn-dark' value='Check Out'/>
                                        <input type='hidden' name='<%= Constants.BOOK_LOAN_REQ_BOOK_ID%>' value='<%=bean.getBookId()%>'/> 
                                        <input type='hidden' name='<%= Constants.BOOK_LOAN_REQ_BRANCH_ID%>' value='<%= bean.getBranchId()%>'/>
                                    </form>

                                    <%
                                    } else {
                                    %>
                                    <%= "暂不能借阅"%>
                                    <%}%>
                                </td>
                            </tr>
                            <%}%>
                            <% if (data.size() == 0) { %> 
                            <h4><span class="label label-warning">无结果</span> </h4>       
                            <%}%>
                        </table>
                    </div>
                    <%                    } else {
                    %>
                    <h4><span class="label label-warning">无结果</span> </h4>       
                    <% }%>
                </div>
            </div>
        </body>
    </html>
</body>
</html>