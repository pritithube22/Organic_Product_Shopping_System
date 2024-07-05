package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.entity.ProductDtls;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;


@WebServlet("/editproducts")
public class EditProductsServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			int id = Integer.parseInt(req.getParameter("id"));
			String productName=req.getParameter("bname");
			String description = req.getParameter("desc");
			String price=req.getParameter("price");
			String status=req.getParameter("status");
			
			ProductDtls b = new ProductDtls();
			b.setProductId(id);
			b.setProductName(productName);
			b.setDescription(description);
			b.setPrice(price);
			b.setStatus(status);
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditProducts(b);
			
			HttpSession session = req.getSession();
			
			
			if(f)
			{
				session.setAttribute("succMsg", "Product Update Successfully...");
				resp.sendRedirect("admin/all_products.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something went wrong...");
				resp.sendRedirect("admin/all_products.jsp");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	
	
	
}
