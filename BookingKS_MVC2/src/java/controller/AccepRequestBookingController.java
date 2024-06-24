/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TNO
 */
public class AccepRequestBookingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        int quantityBooking = Integer.parseInt(request.getParameter("quantityBooking"));

        RoomDAO roomDAO = new RoomDAO();
        String msg = "";

        // amount room in table room
        int amountRoom = roomDAO.findRoomByID(roomID).getAmountRoom();

        int statusBooking = roomDAO.findBookingRoomByID(id).getStatus();

        if (statusBooking != 2) {
            //status = 2 : accept
            if (roomDAO.updateStatusBooking(2, id)) {
                int amountRoomUpdate = amountRoom - quantityBooking;
                if (roomDAO.updateAmountRoom(roomID, amountRoomUpdate)) {
                    response.sendRedirect("roomWaitingConfirm");
                    return;
                } else {
                    msg = "Update amount failed!";
                }

            } else {
                msg = "Update status failed!";
            }

            request.setAttribute("msg", msg);
            request.getRequestDispatcher("roomWaitingConfirm").forward(request, response);
        } else {
            response.sendRedirect("roomWaitingConfirm");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
