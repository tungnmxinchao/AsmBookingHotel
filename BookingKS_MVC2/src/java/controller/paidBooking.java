/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RoomDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class paidBooking extends HttpServlet {

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

        if (statusBooking != 3) {
            //status = 3 : user paid money
            if (roomDAO.updateStatusBooking(3, id)) {
                int amountRoomUpdate = amountRoom + quantityBooking;
                if (roomDAO.updateAmountRoom(roomID, amountRoomUpdate)) {
                    response.sendRedirect("roomConfirm");
                    return;
                } else {
                    msg = "Update amount failed!";
                }

            } else {
                msg = "Update status failed!";
            }

            request.setAttribute("msg", msg);
            request.getRequestDispatcher("roomConfirm").forward(request, response);
        } else {
            response.sendRedirect("roomConfirm");
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
        return "Short description";
    }// </editor-fold>

}
