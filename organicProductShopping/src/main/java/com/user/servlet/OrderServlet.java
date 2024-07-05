package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProductOrderImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Product_Order;
import com.entity.User;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			
			String fullAdd = address+", "+landmark+","+city+","+state+","+pincode;
			
			//System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);
			
			
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			
			List<Cart> blist= dao.getProductByUser(id);
			
			
			if(blist.isEmpty())
			{
				session.setAttribute("failedMsg", "Please Add Product to cart..");
				resp.sendRedirect("checkout.jsp");
				
			}else {
				
		
			ProductOrderImpl dao2 = new ProductOrderImpl(DBConnect.getConn());
			
			
			Product_Order o = null;
			
			ArrayList<Product_Order> orderList = new ArrayList<Product_Order>();
			Random r = new Random();
			for(Cart c: blist)
			{
				 o= new Product_Order();
				 o.setOrderId("PROD-ORD-00"+r.nextInt(1000));
				 o.setUsername(name);
				 o.setEmail(email);
				 o.setPhno(phno);
				 o.setFullAdd(fullAdd);
				 o.setProductName(c.getProductname());
				 o.setDescription(c.getDescription());
				 o.setPrice(c.getPrice()+"");
				 o.setPaymentType(paymentType);
				 orderList.add(o);
				 
			}
			
			
			if("noselect".equals(paymentType))
			{
				session.setAttribute("failedMsg", "Please choose payment type");
				resp.sendRedirect("checkout.jsp");
			}
			else {
				
				boolean f = dao2.saveOrder(orderList);
				//System.out.println(f);
				if(f)
				{
					resp.sendRedirect("order_success.jsp");
					//System.out.println("Order Successful...");
				}
				else
				{   resp.sendRedirect("order_success.jsp");
					//System.out.println("Order failed....");
				}
				
			} 
			
			
		}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	

}
