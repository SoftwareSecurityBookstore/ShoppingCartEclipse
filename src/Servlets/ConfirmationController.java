package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ConfirmationController", urlPatterns = {"/ConfirmationController"})
public class ConfirmationController extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    	//todo: update the books database and subtract the number of books purchased in this session.
    	//todo: send the user back to the list of books (list.jsp?)
    }
}