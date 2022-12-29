/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sm.controller;

import com.sm.bean.FineTrackingBean;
import com.sm.util.Constants;
import com.sm.util.DatabaseConnection;
import com.sm.util.STATUS_TYPE;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lzd
 */
@WebServlet(name = "FineTrackingController", urlPatterns = {"/FineTrackingController"})
public class FineTrackingController extends HttpServlet {

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

        if (request.getParameter(Constants.FINE_REQ_BORROWER_NAME) == null && request.getParameter(Constants.FINE_REQ_CARD_NO) == null) {
            RequestDispatcher rd = request.getRequestDispatcher("FineTracking.jsp");
            request.setAttribute(Constants.HAS_STATUS, false);
            rd.forward(request, response);

        } else if (request.getParameter(Constants.FINE_REQ_BORROWER_NAME).equals("") && request.getParameter(Constants.FINE_REQ_CARD_NO).equals("")) {
            RequestDispatcher rd = request.getRequestDispatcher("FineTracking.jsp");
            request.setAttribute(Constants.HAS_STATUS, true);
            request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.WARNING);
            request.setAttribute(Constants.STATUS_HEADER, "空查询");
            request.setAttribute(Constants.STATUS_BODY, "请输入.");
            rd.forward(request, response);
        } else {
            DatabaseConnection dbConnection = new DatabaseConnection();
            try {
                String borrowerName = request.getParameter(Constants.FINE_REQ_BORROWER_NAME);
                String cardNo = request.getParameter(Constants.FINE_REQ_CARD_NO);

                StringBuilder sqlString = new StringBuilder();
                sqlString.append("select b.fname,b.lname,bl.card_no,SUM(f.fine_amt) as amount,f.paid "
                        + "from fines as f join book_loans bl on f.loan_id = bl.loan_id join borrower as b on b.card_no = bl.card_no where ");
                if (!borrowerName.equalsIgnoreCase("")) {
                    sqlString.append(" b.fname like ? or b.lname like ?");
                }

                if (!cardNo.equalsIgnoreCase("")) {
                    if (!borrowerName.equals("")) {
                        sqlString.append(" and ");
                    }

                    sqlString.append(" bl.card_no = ?");
                }
                sqlString.append(" group by bl.card_no,f.paid;");

                dbConnection.openConnection();
                dbConnection.preparedStatement = dbConnection.connect.prepareStatement(sqlString.toString());
                int count = 1;
                if (!borrowerName.equalsIgnoreCase("")) {
                    dbConnection.preparedStatement.setString(count++, "%" + borrowerName + "%");
                    dbConnection.preparedStatement.setString(count++, "%" + borrowerName + "%");
                }
                if (!cardNo.equalsIgnoreCase("")) {
                    dbConnection.preparedStatement.setString(count++, cardNo);
                }

                dbConnection.resultSet = dbConnection.preparedStatement.executeQuery();
                ArrayList<FineTrackingBean> list = new ArrayList<>();
                while (dbConnection.resultSet.next()) {
                    list.add(new FineTrackingBean(dbConnection.resultSet.getString("fname"), dbConnection.resultSet.getString("lname"), dbConnection.resultSet.getString("card_no"), dbConnection.resultSet.getString("amount"), dbConnection.resultSet.getBoolean("paid")));
                }

                dbConnection.closeConnection();

                RequestDispatcher rd = request.getRequestDispatcher("FineTracking.jsp");
                request.setAttribute(Constants.HAS_STATUS, true);
                request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.SUCCESS);
                request.setAttribute(Constants.STATUS_HEADER, "查询成功");
                request.setAttribute(Constants.STATUS_BODY, "查询成功");
                request.setAttribute(Constants.FINE_JSP_REQ, list);
                rd.forward(request, response);

            } catch (SQLException e) {
                dbConnection.closeConnection();
                RequestDispatcher rd = request.getRequestDispatcher("FineTracking.jsp");
                request.setAttribute(Constants.HAS_STATUS, true);
                request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                request.setAttribute(Constants.STATUS_HEADER, "出错");
                request.setAttribute(Constants.STATUS_BODY, "mysql出错 " + e.toString());
                rd.forward(request, response);

            } catch (ClassNotFoundException ex) {
                dbConnection.closeConnection();
                RequestDispatcher rd = request.getRequestDispatcher("FineTracking.jsp");
                request.setAttribute(Constants.HAS_STATUS, true);
                request.setAttribute(Constants.STATUS_TYPE, STATUS_TYPE.ERROR);
                request.setAttribute(Constants.STATUS_HEADER, "出错");
                request.setAttribute(Constants.STATUS_BODY, "classnotfound出错: " + ex.toString());
                rd.forward(request, response);
            } finally {
                dbConnection.closeConnection();
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
