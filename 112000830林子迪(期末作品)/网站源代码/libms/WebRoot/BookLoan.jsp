<%-- 
    Author     : lzd
--%>

<%@page import="com.sm.util.STATUS_TYPE"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sm.bean.LoanBookListBean"%>
<%@page import="com.sm.controller.BookLoanController"%>
<%@page import="com.sm.util.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>图书借阅</title>
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
        
        <br><br><br><br>

        <div class="container ">
            
            <ul class="nav nav-tabs">
                <li <% if ((request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE) == null) || request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE).equals(Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE)) {
                        out.println("class=\"active\"");
                    }%>><a data-toggle="tab" href="#checkOut">借书</a></li>
                <li <% if (request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE) != null && request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE).equals(Constants.BOOK_LOAN_REQ_CHECKIN_TYPE)) {
                        out.println("class=\"active\"");
                    }%>><a data-toggle="tab" href="#checkIn">还书</a></li>
            </ul>

            <br>

            <div class="tab-content">

                <div id="checkOut" class="tab-pane fade in <% if ((request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE) == null && request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE) == null) || request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE).equals(Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE)) {
                        out.println("active");
                    }%>">
                    <div class="panel panel-default">
                        <div class="panel-heading">借书</div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/BookLoanController" method="POST">
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="<%=Constants.BOOK_LOAN_REQ_BOOK_ID%>">书本 ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="<%= Constants.BOOK_LOAN_REQ_BOOK_ID%>" 
                                               placeholder="输入书本id" 
                                               value="<% if (request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID) != null) {
                                                       out.println(request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                                                   }%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="<%= Constants.BOOK_LOAN_REQ_BRANCH_ID%>">分馆 ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="<%= Constants.BOOK_LOAN_REQ_BRANCH_ID%>" 
                                               placeholder="输入分馆 id" 
                                               value="<%if (request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID) != null) {
                                                       out.println(request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                                                   }%>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="<%= Constants.BOOK_LOAN_REQ_CARD_NO%>">卡号:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="<%= Constants.BOOK_LOAN_REQ_CARD_NO%>" 
                                               placeholder="输入借阅人卡号" 
                                               value="<%if (request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO) != null) {
                                                       out.println(request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                                                   }%>">
                                    </div>
                                </div>
                                <input type ="hidden" name ="<%=Constants.BOOK_LOAN_REQ_TYPE%>" value="<%=Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE%>">
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-dark">提交</button>
                                    </div>
                                </div>
                            </form>
                            <% if (hasStatus && request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE).equals(Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE)) {%>
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
                </div>

                <div id="checkIn" class="tab-pane fade in <% if (request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE) != null && request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE).equals(Constants.BOOK_LOAN_REQ_CHECKIN_TYPE)) {
                        out.println("active");
                    }%>">
                    <div class="panel panel-default">
                        <div class="panel-heading">还书</div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/BookLoanController" method="POST">
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="<%=Constants.BOOK_LOAN_REQ_BOOK_ID%>">书本 ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="<%= Constants.BOOK_LOAN_REQ_BOOK_ID%>" 
                                               placeholder="输入书本 id" 
                                               value="<% if (request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID) != null) {
                                                       out.println(request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                                                   }%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="<%= Constants.BOOK_LOAN_REQ_CARD_NO%>">卡号:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="<%= Constants.BOOK_LOAN_REQ_CARD_NO%>" 
                                               placeholder="输入借阅人卡号" 
                                               value="<%if (request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO) != null) {
                                                       out.println(request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                                                   }%>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="<%= Constants.BOOK_LOAN_REQ_BORROWER_NAME%>">借阅人姓名:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="<%= Constants.BOOK_LOAN_REQ_BORROWER_NAME%>" 
                                               placeholder="输入借阅人姓名" 
                                               value="<%if (request.getParameter(Constants.BOOK_LOAN_REQ_BORROWER_NAME) != null) {
                                                       out.println(request.getParameter(Constants.BOOK_LOAN_REQ_BORROWER_NAME));
                                                   }%>">
                                    </div>
                                </div>
                                <input type ="hidden" name ="<%=Constants.BOOK_LOAN_REQ_TYPE%>" value="<%=Constants.BOOK_LOAN_REQ_CHECKIN_TYPE%>">
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-dark">提交</button>
                                    </div>
                                </div>
                            </form>



                            <% if (hasStatus && request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE).equals(Constants.BOOK_LOAN_REQ_CHECKIN_TYPE)) {%>
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
                    

                    <%!
                        boolean hasData = false;
                    %>

                    <%
                        if (request.getAttribute(Constants.BOOK_LOAN_JSP_REQ) != null) {
                            hasData = true;
                        } else {
                            hasData = false;
                        }
                    %>
                    <div class="panel panel-default">
                        <div class="panel-heading">搜索结果</div>
                        <div class="panel-body">
                            <%
                                if (hasData) {
                            %>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>姓</th>
                                        <th>名</th>
                                        <th>卡号</th>
                                        <th>书本ID</th>
                                        <th>分馆 ID</th>
                                        <th>还书日期</th>
                                        <th>操作</th>
                                    </tr>
                                    <%!
                                        ArrayList<LoanBookListBean> data = new ArrayList<LoanBookListBean>();
                                    %>
                                    <%
                                        data = (ArrayList<LoanBookListBean>) request.getAttribute(Constants.BOOK_LOAN_JSP_REQ);
                                        for (LoanBookListBean bean : data) {
                                            out.println("<tr>");
                                    %>
                                    <%= "<td>" + bean.getBorrowerFName()
                                            + "</td>"%>
                                    <%= "<td>" + bean.getBorrowerLName()
                                            + "</td>"%>
                                    <%= "<td>" + bean.getCardNo()
                                            + "</td>"%>
                                    <%= "<td>" + bean.getBookId()
                                            + "</td>"%>
                                    <%= "<td>" + bean.getBranchId()
                                            + "</td>"%>
                                    <%= "<td>" + bean.getDueDate()
                                            + "</td>"%>
                                    <td>
                                        <%="<form method=\"POST\" action=\"CheckInBookController\">"
                                                + "<input type='submit' class='btn btn-sm btn-dark' value='归还'>"
                                                + "<input type='hidden' name='" + Constants.CHECK_IN_REQ_BOOK_ID + "' value='" + bean.getBookId() + "'> "
                                                + "<input type='hidden' name='" + Constants.CHECK_IN_REQ_BRANCH_ID + "' value='" + bean.getBranchId() + "'> "
                                                + "<input type='hidden' name='" + Constants.CHECK_IN_REQ_CARD_NO + "' value='" + bean.getCardNo() + "'> "
                                                + "</form>"%>
                                    </td>

                                    <%
                                            out.println("</tr>");
                                        }
                                    %>
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
                </div>
            </div>
        </div>
    </body>
</html>