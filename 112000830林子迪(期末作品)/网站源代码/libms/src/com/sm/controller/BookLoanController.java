/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sm.controller;

import com.sm.bean.LoanBookListBean;
import com.sm.util.Constants;
import com.sm.util.DatabaseConnection;
import com.sm.util.STATUS_TYPE;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lzd
 */
public class BookLoanController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getParameter(Constants.BOOK_LOAN_REQ_TYPE) == null || request.getParameter(Constants.BOOK_LOAN_REQ_TYPE).equals(Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE)) {

            if ((request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID) == null && request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID) == null && request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO) == null)) {
                RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                request.setAttribute(Constants.HAS_STATUS, false);
                rd.forward(request, response);
                return;
            } else if ((request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID).equals("") && request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID).equals("") && request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO).equals(""))) {
                RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                request.setAttribute(Constants.HAS_STATUS, true);
                request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.WARNING);
                request.setAttribute(Constants.STATUS_HEADER, "空查询");
                request.setAttribute(Constants.STATUS_BODY, "请输入");
                rd.forward(request, response);
                return;
            } else if (request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID) != null && request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID) != null && request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO) == null) {
                RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                request.setAttribute(Constants.HAS_STATUS, true);
                request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.WARNING);
                request.setAttribute(Constants.STATUS_HEADER, "借书成功");
                request.setAttribute(Constants.STATUS_BODY, "输入卡号以完成借书");
                rd.forward(request, response);
                return;
            } else {
                DatabaseConnection dbConnection = new DatabaseConnection();
                try {
                    String bookID = request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID);
                    String branchID = request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID);
                    String cardNo = request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO);

                    if (bookID.equals("") || branchID.equals("") || cardNo.equals("")) {
                        RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_CARD_NO, request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                        request.setAttribute(Constants.HAS_STATUS, true);
                        request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                        request.setAttribute(Constants.STATUS_HEADER, "错误出现");
                        request.setAttribute(Constants.STATUS_BODY, "请全部填写");
                        rd.forward(request, response);
                        return;
                    }

                    dbConnection.openConnection();
                    StringBuffer sqlString = new StringBuffer();

                    sqlString.append("SELECT COUNT(*) from book where book_id = ?");
                    dbConnection.preparedStatement = dbConnection.connect.prepareStatement(sqlString.toString());
                    dbConnection.preparedStatement.setString(1, bookID);
                    dbConnection.resultSet = dbConnection.preparedStatement.executeQuery();
                    dbConnection.resultSet.next();
                    if (dbConnection.resultSet.getInt(1) == 0) {
                        RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_CARD_NO, request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                        request.setAttribute(Constants.HAS_STATUS, true);
                        request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                        request.setAttribute(Constants.STATUS_HEADER, "错误出现");
                        request.setAttribute(Constants.STATUS_BODY, "该书本id不存在");
                        rd.forward(request, response);
                        return;
                    }

                    sqlString = new StringBuffer();
                    sqlString.append("SELECT COUNT(*) from library_branch where branch_id = ?");
                    dbConnection.preparedStatement = dbConnection.connect.prepareStatement(sqlString.toString());
                    dbConnection.preparedStatement.setString(1, branchID);
                    dbConnection.resultSet = dbConnection.preparedStatement.executeQuery();
                    dbConnection.resultSet.next();
                    if (dbConnection.resultSet.getInt(1) == 0) {
                        RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_CARD_NO, request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                        request.setAttribute(Constants.HAS_STATUS, true);
                        request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                        request.setAttribute(Constants.STATUS_HEADER, "错误出现");
                        request.setAttribute(Constants.STATUS_BODY, "该分馆id不存在");
                        rd.forward(request, response);
                        return;
                    }

                    sqlString = new StringBuffer();
                    sqlString.append("SELECT COUNT(*) from borrower where card_no = ?");
                    dbConnection.preparedStatement = dbConnection.connect.prepareStatement(sqlString.toString());
                    dbConnection.preparedStatement.setString(1, cardNo);
                    dbConnection.resultSet = dbConnection.preparedStatement.executeQuery();
                    dbConnection.resultSet.next();
                    if (dbConnection.resultSet.getInt(1) == 0) {
                        RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_CARD_NO, request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                        request.setAttribute(Constants.HAS_STATUS, true);
                        request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                        request.setAttribute(Constants.STATUS_HEADER, "错误出现");
                        request.setAttribute(Constants.STATUS_BODY, "该卡号不存在");
                        rd.forward(request, response);
                        return;
                    }

                    sqlString = new StringBuffer();
                    sqlString.append("SELECT ifnull((bc.no_of_copies - t.borrowed),bc.no_of_copies) as available \n"
                            + "from book_copies as bc \n"
                            + "left join \n"
                            + "(select bl.book_id as book_id, bl.branch_id as branch_id,  COUNT(*) as borrowed from book_loans as bl where bl.date_in is null group by book_id,branch_id) as t \n"
                            + "on t.book_id = bc.book_id and t.branch_id = bc.branch_id");
                    sqlString.append(" where bc.book_id = ? and bc.branch_id = ?");
                    sqlString.append(";");
                    dbConnection.preparedStatement = dbConnection.connect.prepareStatement(sqlString.toString());
                    dbConnection.preparedStatement.setString(1, bookID);
                    dbConnection.preparedStatement.setString(2, branchID);
                    dbConnection.resultSet = dbConnection.preparedStatement.executeQuery();
                    dbConnection.resultSet.next();
                    if (dbConnection.resultSet.getInt(1) == 0) {
                        RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_CARD_NO, request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                        request.setAttribute(Constants.HAS_STATUS, true);
                        request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                        request.setAttribute(Constants.STATUS_HEADER, "错误出现");
                        request.setAttribute(Constants.STATUS_BODY, "该分馆不拥有该书");
                        rd.forward(request, response);
                        return;
                    }

                    sqlString = new StringBuffer();
                    sqlString.append("SELECT COUNT(*) from book_loans where date_in is null and book_id = ? and branch_id = ? and card_no = ?;");
                    dbConnection.preparedStatement = dbConnection.connect.prepareStatement(sqlString.toString());
                    dbConnection.preparedStatement.setString(1, bookID);
                    dbConnection.preparedStatement.setString(2, branchID);
                    dbConnection.preparedStatement.setString(3, cardNo);
                    dbConnection.resultSet = dbConnection.preparedStatement.executeQuery();
                    dbConnection.resultSet.next();
                    if (dbConnection.resultSet.getInt(1) > 0) {
                        RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_CARD_NO, request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                        request.setAttribute(Constants.HAS_STATUS, true);
                        request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                        request.setAttribute(Constants.STATUS_HEADER, "错误出现");
                        request.setAttribute(Constants.STATUS_BODY, "该书已被同一个借阅人借走");
                        rd.forward(request, response);
                        return;
                    }

                    sqlString = new StringBuffer();
                    sqlString.append("SELECT COUNT(*) from book_loans where card_no = ? and date_in IS NULL;");
                    dbConnection.preparedStatement = dbConnection.connect.prepareStatement(sqlString.toString());
                    dbConnection.preparedStatement.setString(1, cardNo);
                    dbConnection.resultSet = dbConnection.preparedStatement.executeQuery();
                    dbConnection.resultSet.next();
                    if (dbConnection.resultSet.getInt(1) >= 3) {
                        RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_CARD_NO, request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                        request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                        request.setAttribute(Constants.HAS_STATUS, true);
                        request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                        request.setAttribute(Constants.STATUS_HEADER, "错误出现");
                        request.setAttribute(Constants.STATUS_BODY, "借阅人已借了三本该书,请看看其他的书吧");
                        rd.forward(request, response);
                        return;
                    }

                    sqlString = new StringBuffer();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date currentDate = new Date();
                    Calendar c = Calendar.getInstance();
                    c.setTime(currentDate); 
                    c.add(Calendar.DATE, 14); 
                    String output = sdf.format(c.getTime());
                    sqlString.append("insert into book_loans (book_id,branch_id,card_no,date_out,due_date) values (?,?,?,?,?);");
                    dbConnection.preparedStatement = dbConnection.connect.prepareStatement(sqlString.toString());
                    dbConnection.preparedStatement.setString(1, bookID);
                    dbConnection.preparedStatement.setString(2, branchID);
                    dbConnection.preparedStatement.setString(3, cardNo);
                    dbConnection.preparedStatement.setString(4, sdf.format(currentDate));
                    dbConnection.preparedStatement.setString(5, output);
                    dbConnection.preparedStatement.executeUpdate();

                    dbConnection.closeConnection();

                    RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                    request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, "");
                    request.setAttribute(Constants.BOOK_LOAN_REQ_CARD_NO, "");
                    request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, "");
                    request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                    request.setAttribute(Constants.HAS_STATUS, true);
                    request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.SUCCESS);
                    request.setAttribute(Constants.STATUS_HEADER, "书已借出");
                    request.setAttribute(Constants.STATUS_BODY, "成功借出,请在14天内归还");
                    rd.forward(request, response);
                    return;

                } catch (Exception e) {
                    dbConnection.closeConnection();
                    RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                    request.setAttribute(Constants.BOOK_LOAN_REQ_BOOK_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID));
                    request.setAttribute(Constants.BOOK_LOAN_REQ_CARD_NO, request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO));
                    request.setAttribute(Constants.BOOK_LOAN_REQ_BRANCH_ID, request.getParameter(Constants.BOOK_LOAN_REQ_BRANCH_ID));
                    request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKOUT_TYPE);
                    request.setAttribute(Constants.HAS_STATUS, true);
                    request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                    request.setAttribute(Constants.STATUS_HEADER, "错误出现");
                    request.setAttribute(Constants.STATUS_BODY, "sql出错. Exception:" + e.toString());
                    rd.forward(request, response);
                } finally {
                    dbConnection.closeConnection();
                }

            }
        } else {

            if ((request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID) == null && request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO) == null && request.getParameter(Constants.BOOK_LOAN_REQ_BORROWER_NAME) == null)) {
                RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKIN_TYPE);
                request.setAttribute(Constants.HAS_STATUS, false);
                rd.forward(request, response);
            } else if ((request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID).equals("") && request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO).equals("") && request.getParameter(Constants.BOOK_LOAN_REQ_BORROWER_NAME).equals(""))) {
                RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKIN_TYPE);
                request.setAttribute(Constants.HAS_STATUS, true);
                request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.WARNING);
                request.setAttribute(Constants.STATUS_HEADER, "空查询");
                request.setAttribute(Constants.STATUS_BODY, "请输入");
                rd.forward(request, response);
            } else {
                DatabaseConnection dbConnection = new DatabaseConnection();
                try {
                    String bookId = request.getParameter(Constants.BOOK_LOAN_REQ_BOOK_ID);
                    String cardNo = request.getParameter(Constants.BOOK_LOAN_REQ_CARD_NO);
                    String borrowerName = request.getParameter(Constants.BOOK_LOAN_REQ_BORROWER_NAME);

                    StringBuffer sqlString = new StringBuffer();
                    sqlString.append("SELECT borrower.fname, borrower.lname, book_loans.card_no, book_loans.book_id, book_loans.branch_id, book_loans.due_date "
                            + "FROM borrower join book_loans on borrower.card_no = book_loans.card_no "
                            + "where book_loans.date_in IS NULL");
                    if (!bookId.equals("")) {
                        sqlString.append(" and book_loans.book_id = ?");
                    }
                    if (!cardNo.equals("")) {
                        sqlString.append(" and book_loans.card_no = ?");
                    }
                    if (!borrowerName.equals("")) {
                        sqlString.append(" and borrower.fname like ? or borrower.lname like ?");
                    }
                    sqlString.append(";");
                    dbConnection.openConnection();
                    dbConnection.preparedStatement = dbConnection.connect.prepareStatement(sqlString.toString());
                    int count = 1;
                    if (!bookId.equals("")) {
                        dbConnection.preparedStatement.setString(count++, bookId);
                    }
                    if (!cardNo.equals("")) {
                        dbConnection.preparedStatement.setString(count++, cardNo);
                    }
                    if (!borrowerName.equals("")) {
                        dbConnection.preparedStatement.setString(count++, "%" + borrowerName.trim() + "%");
                        dbConnection.preparedStatement.setString(count++, "%" + borrowerName.trim() + "%");
                    }

                    dbConnection.resultSet = dbConnection.preparedStatement.executeQuery();
                    ArrayList<LoanBookListBean> list = new ArrayList<>();
                    while (dbConnection.resultSet.next()) {
                        list.add(new LoanBookListBean(dbConnection.resultSet.getString("book_id"), dbConnection.resultSet.getString("card_no"), dbConnection.resultSet.getString("fname"), dbConnection.resultSet.getString("lname"), dbConnection.resultSet.getString("branch_id"), dbConnection.resultSet.getString("due_date")));
                    }

                    dbConnection.closeConnection();

                    RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                    request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, Constants.BOOK_LOAN_REQ_CHECKIN_TYPE);
                    request.setAttribute(Constants.HAS_STATUS, true);
                    request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.SUCCESS);
                    request.setAttribute(Constants.STATUS_HEADER, "查询成功");
                    request.setAttribute(Constants.STATUS_BODY, "查询成功");
                    request.setAttribute(Constants.BOOK_LOAN_JSP_REQ, list);
                    rd.forward(request, response);
                    return;
                } catch (Exception e) {
                    dbConnection.closeConnection();
                    RequestDispatcher rd = request.getRequestDispatcher("BookLoan.jsp");
                    request.setAttribute(Constants.BOOK_LOAN_REQ_TYPE, request.getAttribute(Constants.BOOK_LOAN_REQ_TYPE));
                    request.setAttribute(Constants.HAS_STATUS, true);
                    request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                    request.setAttribute(Constants.STATUS_HEADER, "mysql错误");
                    request.setAttribute(Constants.STATUS_BODY, "mysql错误:" + e.toString());
                    rd.forward(request, response);
                    return;
                }
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "简介";
    }// </editor-fold>

}
