/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author TNO
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       request.getRequestDispatcher("Login.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
             String username = request.getParameter("username");
      String pass = request.getParameter("password");
      
      UserDAO userDAO = new UserDAO();
      HttpSession session = request.getSession();
      
      Users user = userDAO.login(username, pass);
      String msg = "";
      
      if(user != null){
          session.setAttribute("user", user);
          response.sendRedirect("home");
      }else{
          msg = "User not exist";
          request.setAttribute("msg", msg);
          request.getRequestDispatcher("Login.jsp").forward(request, response);
      }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
