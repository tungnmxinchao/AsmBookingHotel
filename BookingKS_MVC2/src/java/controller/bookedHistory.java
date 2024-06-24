/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static constant.constant.RECORD_PER_PAGE;
import dal.RoomDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.PageControl;
import model.ResponseTrackBookingUser;
import model.Users;

/**
 *
 * @author TNO
 */
public class bookedHistory extends HttpServlet {
     private static final String PAGE_HISTORY_BOOKED = "historyBooked.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        List<ResponseTrackBookingUser> trackBooking = null;
        String url = null;

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        int roleUser = 0;
        if (user == null) {
            response.sendRedirect("login");
            return;
        } else {
            roleUser = user.getRole();
        }

        if (action == null && roleUser == 1) {
            PageControl pageControl = new PageControl();

            trackBooking = pagination(request, pageControl);

            request.setAttribute("trackBooking", trackBooking);
            request.setAttribute("pageControl", pageControl);

            url = PAGE_HISTORY_BOOKED;
        } else if (roleUser != 1) {
            response.sendRedirect("login");
            return;
        }
        try {
            switch (action) {
                case "1":
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
                int adminMode = 1;
                totalRecord = roomDAO.findTotalRecordTrackingBooked(idUser, adminMode, 3);
                listTrackingBooked = roomDAO.findTrackingBookedByPage(page, idUser, adminMode, 3);

                pageControl.setUrlPattern("roomConfirm?");

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
