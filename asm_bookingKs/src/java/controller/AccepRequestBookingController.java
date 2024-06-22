/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RoomDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author TNO
 */
public class AccepRequestBookingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
                    msg = "Update status succesfully with booking id = " + id;
                } else {
                    msg = "Update amount failed!";
                }

            } else {
                msg = "Update status failed!";
            }

            request.setAttribute("msg", msg);
            request.getRequestDispatcher("roomWaitingConfirm").forward(request, response);
        }else{
            response.sendRedirect("roomWaitingConfirm");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
