/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RoomDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import model.Hotel;
import model.ResponseRoom;
import model.RoomImage;
import model.Users;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author TNO
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class adminViewRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null && user.getRole() == 1) {
            int idRoom = Integer.parseInt(request.getParameter("id"));
            RoomDAO roomDAO = new RoomDAO();
            ResponseRoom room = roomDAO.findRoomByID(idRoom);
            List<Hotel> listHotel = roomDAO.findAllHotel();
            List<RoomImage> imageRoom = roomDAO.findImageRoomByID(idRoom);
            int idHotel = room.getHotel_id();

            request.setAttribute("idHotel", idHotel);
            request.setAttribute("imageRoom", imageRoom);
            request.setAttribute("room", room);
            request.setAttribute("listHotel", listHotel);
            request.getRequestDispatcher("adminViewRoom.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idHotel = Integer.parseInt(request.getParameter("hotel"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        int status = Integer.parseInt(request.getParameter("status"));
        int adultAmount = Integer.parseInt(request.getParameter("adultAmount"));
        int childAmount = Integer.parseInt(request.getParameter("childAmount"));
        int amountRoom = Integer.parseInt(request.getParameter("amountRoom"));
        int roomID = Integer.parseInt(request.getParameter("idRoom"));

        String uploadPath = getServletContext().getRealPath("") + "../../web/img";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Xử lý upload file thumbnail
        Part thumbnailPart = request.getPart("thumbnail");
        String thumbnailFileName = getSubmittedFileName(thumbnailPart);
        String thumbnailFilePath = "";

        if (thumbnailFileName != null && !thumbnailFileName.isEmpty()) {
            String originalFileName = thumbnailFileName;
            String uniqueFileName = getUniqueFileName(uploadDir.getAbsolutePath(), originalFileName);
            thumbnailFilePath = uploadDir + File.separator + uniqueFileName;

            try (InputStream thumbnailStream = thumbnailPart.getInputStream()) {
                Files.copy(thumbnailStream, Paths.get(thumbnailFilePath));

            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
        }

        // Xử lý upload file roomImages
        // Lấy danh sách các file được chọn từ form
        List<Part> fileParts = (List<Part>) request.getParts();
        List<String> listRoomImage = new ArrayList<>();

        for (Part part : fileParts) {
            String fileName = getSubmittedFileName(part);
            // Ghi file vào đường dẫn lưu trữ
            if (fileName != null && !fileName.isEmpty() && !fileName.equals(thumbnailFileName)) {
                try {
                    part.write(uploadPath + File.separator + fileName);
                    String imageRooms = "img/" + fileName;
                    listRoomImage.add(imageRooms);
                } catch (IOException e) {
                    // Xử lý ngoại lệ khi ghi file
                    e.printStackTrace();
                    // Có thể thêm logic để thông báo lỗi hoặc thực hiện hành động khác
                }
            }
        }

        String thumbnailRoom = "img/" + thumbnailFileName;
        RoomDAO roomDAO = new RoomDAO();
        String msg = "";
        int updateMode = 0;
        List<RoomImage> listImage = roomDAO.findImageRoomByID(roomID);
        int totalImageOfRoomID = roomDAO.numberImageOfRoomID(roomID);

        if (thumbnailFileName.isEmpty() && listRoomImage.isEmpty()) {
            updateMode = 1;
            if (roomDAO.updateRoom(idHotel, name, description, price, status, adultAmount,
                    childAmount, amountRoom, thumbnailRoom, updateMode, roomID)) {
                response.sendRedirect("adminViewRoom?id=" + roomID);
                return;
            } else {
                response.sendRedirect("adminViewRoom?id=" + roomID);
                return;
            }

        } else if (!thumbnailFileName.isEmpty() && listRoomImage.isEmpty()) {
            updateMode = 2;
            if (roomDAO.updateRoom(idHotel, name, description, price, status, adultAmount,
                    childAmount, amountRoom, thumbnailRoom, updateMode, roomID)) {
                response.sendRedirect("adminViewRoom?id=" + roomID);
                return;
            } else {
                response.sendRedirect("adminViewRoom?id=" + roomID);
                return;
            }

        } else {
            updateMode = 1;
            if (roomDAO.updateRoom(idHotel, name, description, price, status, adultAmount,
                    childAmount, amountRoom, thumbnailRoom, updateMode, roomID)) {
                for (int i = 0; i < totalImageOfRoomID; i++) {
                    int idRoomImage = listImage.get(i).getId();
                    String roomImage = listRoomImage.get(i);
                    if (roomDAO.updateImageByID(idRoomImage, roomImage, roomID)) {
                        msg = "Update sucsesfully!";
                    } else {
                        msg = "Update failed";
                    }
                }
                response.sendRedirect("adminViewRoom?id=" + roomID);
                return;
            } else {
                response.sendRedirect("adminViewRoom?id=" + roomID);
                return;
            }

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String getSubmittedFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return null;
    }

    private String getUniqueFileName(String uploadDir, String fileName) {
        File file = new File(uploadDir, fileName);
        String baseName = FilenameUtils.getBaseName(fileName);
        String extension = FilenameUtils.getExtension(fileName);
        int count = 1;

        // Kiểm tra nếu file đã tồn tại, thì thay đổi tên file
        while (file.exists()) {
            fileName = baseName + "_" + count + "." + extension;
            file = new File(uploadDir, fileName);
            count++;
        }

        return fileName;
    }

}
