package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import javax.servlet.http.HttpSession;
//import org.apache.catalina.User;
//import jakarta.servlet.http.HttpSession;

import javax.servlet.annotation.*;


@WebServlet("/register")

public class RegisterServlet extends HttpServlet {
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try
		{
			
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check  = req.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check!=null)
			{
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				
				boolean f2 = dao.checkUser(email);
				if(f2)
				{
					  
					boolean f = dao.userRegister(us);
					
					
					if(f)
					{
						//System.out.println("User Register Success...");
						session.setAttribute("succMsg" , "Registration successfully...");
						resp.sendRedirect("register.jsp");
					}
					else
					{
						//System.out.println("Something went wrong...");
						session.setAttribute("failedMsg" , "Something went wrong...");
						resp.sendRedirect("register.jsp");
					}
					
					
					
				}
				else
				{
					session.setAttribute("failedMsg" , "User already exist try with another email...!");
					resp.sendRedirect("register.jsp");
					
				}
				/*if (phno == null || phno.trim().isEmpty() || !phno.matches("\\d{10}")) {
		            // Invalid mobile number
					session.setAttribute("failedMsg","Please enter 10 digit mobile number..");
		            resp.sendRedirect("register.jsp");
		            return;
		        }*/
			
		}else{
				//System.out.println("Please agree terms and conditions...");
				session.setAttribute("failedMsg" , "Please agree terms and conditions...");
				resp.sendRedirect("register.jsp");
			}
			
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}

	
	
}
