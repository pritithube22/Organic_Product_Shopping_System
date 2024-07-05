package com.user.servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.CartDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.ProductDtls;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
		
			
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			//System.out.println("bid="+bid+"uid= "+uid);
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			ProductDtls b =dao.getProductById(bid);
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUserid(uid);
			c.setProductname(b.getProductName());
			c.setDescription(b.getDescription());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalprice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession session =req.getSession();
			
			if(f)
			{
				session.setAttribute("addCart", "Product added to cart");
				resp.sendRedirect("all_new_product.jsp");
				
			}
			else
			{
				session.setAttribute("failed", "Something went wrong");
				resp.sendRedirect("all_new_product.jsp");
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

	
	
}
