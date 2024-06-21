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
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import model.ResponseRoom;
import model.Users;
import utils.GetDataUtils;
import utils.ValidateInput;

/**
 *
 * @author TNO
 */
public class BookingRoomController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        String checkinDate = request.getParameter("checkInDate");
        String checkoutDate = request.getParameter("checkOutDate");
        int numberAdults = Integer.parseInt(request.getParameter("numberAdults"));
        int numberChild = Integer.parseInt(request.getParameter("numberChild"));
        int numberRoom = Integer.parseInt(request.getParameter("numberRoom"));
        
        String msg = "";
        RoomDAO roomDAO = new RoomDAO();
        ResponseRoom room = roomDAO.findRoomByID(roomID);
        int amountRoom = room.getAmountRoom();
        int priceRoom = GetDataUtils.parseVietnamCurrency(room.getPrice());
        
        // Lấy ngày hiện tại
        LocalDate currentDate = LocalDate.now();
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        // total price user have to pay
        int totalPice = numberRoom * priceRoom * (GetDataUtils.calculateStayDuration(checkinDate, checkoutDate));
        
        if(!ValidateInput.isCheckoutDateValid(checkinDate, checkoutDate)){
            msg = "Check in date must be before checkout date!";
        }else if(numberRoom > amountRoom){
             msg = "Number of room is insufficient!";
        }else if(!room.isStatus()){
            msg = "Room is not exist!";
        }else if(user == null){
           response.sendRedirect("login");
           return;
        }else{
            if(roomDAO.insertBookingRoom(roomID, user.getId(), checkinDate, checkoutDate,
                    numberAdults, numberChild, numberRoom,  totalPice, currentDate.toString())){
                msg = "Your booking is awaiting approval!";
            }else{
                msg = "Booking failed!";
            }
        }
        
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("roomDetails.jsp").forward(request, response);
 
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
