/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static constant.constant.RECORD_PER_PAGE;
import dal.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Hotel;
import model.PageControl;
import model.ResponseRoom;
import model.Users;

/**
 *
 * @author TNO
 */
public class ManageRoom extends HttpServlet {

    private static final String PAGE_ADMIN_MANAGE_ROOMS = "manageRoom.jsp";
    private static final String PAGE_ADD_ROOMS = "addRoom.jsp";
    private static final String ADMIN_VIEW_ROOM = "adminViewRoom";
    private static final String ADMIN_DELETE_ROOM = "deleteRoom";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        List<ResponseRoom> listRoom = null;
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

            listRoom = pagination(request, pageControl);

            request.setAttribute("listRoom", listRoom);
            request.setAttribute("pageControl", pageControl);

            url = PAGE_ADMIN_MANAGE_ROOMS;
        } else if (roleUser != 1) {
            response.sendRedirect("login");
            return;
        }
        try {
            switch (action) {
                case "addRooms":
                    RoomDAO roomDAO = new RoomDAO();
                    List<Hotel> listHotel = roomDAO.findAllHotel();

                    request.setAttribute("listHotel", listHotel);
                    url = PAGE_ADD_ROOMS;
                    break;
                case "adminViewRoom":
                    url = ADMIN_VIEW_ROOM;
                    break;
                case "deleteRoom":
                    url = ADMIN_DELETE_ROOM;
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

    private List<ResponseRoom> pagination(HttpServletRequest request, PageControl pageControl) {
        //get page
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
        List<ResponseRoom> listRoom = null;

        String action = request.getParameter("action") == null
                ? "defaultFindAll"
                : request.getParameter("action");
        switch (action) {
            case "Search":
                break;
            case "category":
                break;
            default:
                totalRecord = roomDAO.findTotalRecord(1);
                listRoom = roomDAO.findRoomByPage(page, 1);

                pageControl.setUrlPattern("manageRoom?");

        }

        //tìm kiếm xem tổng có bao nhiêu page
        int totalPage = (totalRecord % RECORD_PER_PAGE) == 0
                ? (totalRecord / RECORD_PER_PAGE)
                : (totalRecord / RECORD_PER_PAGE) + 1;
        //set những giá trị vào pageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        return listRoom;
    }

}
