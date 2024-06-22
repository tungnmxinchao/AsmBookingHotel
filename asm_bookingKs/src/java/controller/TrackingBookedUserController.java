/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static constant.constant.RECORD_PER_PAGE;
import dal.RoomDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.PageControl;
import model.ResponseTrackBookingUser;
import model.Users;

/**
 *
 * @author TNO
 */
public class TrackingBookedUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            PageControl pageControl = new PageControl();
            List<ResponseTrackBookingUser> trackBooking = pagination(request, pageControl);

            request.setAttribute("trackBooking", trackBooking);
            request.setAttribute("pageControl", pageControl);
            request.getRequestDispatcher("trackBookedUser.jsp").forward(request, response);
        }else{
            response.sendRedirect("login");
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

    private List<ResponseTrackBookingUser> pagination(HttpServletRequest request, PageControl pageControl) {
        String pageRaw = request.getParameter("page");
        RoomDAO roomDAO = new RoomDAO();

        //valid page
        int page;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (NumberFormatException e) {
            page = 1;
        }
        int totalRecord = 0;
        List<ResponseTrackBookingUser> listTrackingBooked = null;
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        int idUser = user.getId();

        String action = request.getParameter("action") == null
                ? "defaultFindAll"
                : request.getParameter("action");
        switch (action) {
            case "Search":
                break;
            case "category":
                break;
            default:
                int adminMode = 0;
                totalRecord = roomDAO.findTotalRecordTrackingBooked(idUser , adminMode, 0);
                listTrackingBooked = roomDAO.findTrackingBookedByPage(page, idUser , adminMode, 0);

                pageControl.setUrlPattern("trackingBooked?");

        }

        //tìm kiếm xem tổng có bao nhiêu page
        int totalPage = (totalRecord % RECORD_PER_PAGE) == 0
                ? (totalRecord / RECORD_PER_PAGE)
                : (totalRecord / RECORD_PER_PAGE) + 1;
        //set những giá trị vào pageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        return listTrackingBooked;
    }

}
