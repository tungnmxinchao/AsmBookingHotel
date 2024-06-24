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
import model.PageControl;
import model.ResponseRoom;

/**
 *
 * @author TNO
 */
public class RoomController extends HttpServlet {

    private static final String ROOM_PAGE = "room.jsp";
    private static final String ROOM_DETAILS_CONTROLLER = "roomDetails";
    private static final String BOOKING_ROOM_CONTROLLER = "bookingRoom";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        List<ResponseRoom> listRoom = null;
        String url = null;
        if (action == null) {
            PageControl pageControl = new PageControl();
            listRoom = pagination(request, pageControl);
            request.setAttribute("listRoom", listRoom);
            request.setAttribute("pageControl", pageControl);
            url = ROOM_PAGE;
        }
        try {
            switch (action) {
                case "roomDetails":
                    url = ROOM_DETAILS_CONTROLLER;
                    break;
                case "bookingRoom":
                    url = BOOKING_ROOM_CONTROLLER;
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

                pageControl.setUrlPattern("room?");

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
