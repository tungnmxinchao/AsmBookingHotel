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
import java.util.List;
import model.PageControl;
import static constant.constant.RECORD_PER_PAGE;
import model.ResponseRoom;

/**
 *
 * @author TNO
 */
public class RoomController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PageControl pageControl = new PageControl();
        List<ResponseRoom> listRoom = pagination(request, pageControl);

        request.setAttribute("listRoom", listRoom);
        request.setAttribute("pageControl", pageControl);
        request.getRequestDispatcher("room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

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
            case "search":
                String nameRoom = request.getParameter("roomName");
                totalRecord = roomDAO.findTotalRecordBySearch(1, nameRoom);
                listRoom = roomDAO.findRoomByPageAndSearch(page, 1, nameRoom);

                pageControl.setUrlPattern("room?roomName="+ nameRoom + "&action=search&");
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
