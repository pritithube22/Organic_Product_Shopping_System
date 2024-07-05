package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Product_Order;

public class ProductOrderImpl implements ProductOrderDAO {
	
	private Connection conn;

	public ProductOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	
 /*	public int getOrderNo() {
		int i=1;
		try {
			
			String sql = "select * from product_order2";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) 
			{
				i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return i;
	}  */

	
	public boolean saveOrder(List<Product_Order> blist) {
		
		boolean f= false;
		try {
		    
			String sql = "insert into product_order2(order_id,user_name,email,address,phone,product_name,description,price,payment) values(?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for(Product_Order b: blist )
			{
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail() );
				ps.setString(4, b.getFullAdd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getProductName());
				ps.setString(7, b.getDescription());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
			}
			
			int [] count = ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		
		
		return f;
	}


	
	public List<Product_Order> getProduct(String email) {
		List<Product_Order> list = new ArrayList<Product_Order>();
		Product_Order o = null;
		
		
		try {
			String sql = "select * from product_order2 where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o=new Product_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setProductName(rs.getString(7));
				o.setDescription(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}


	
	public List<Product_Order> getAllOrder() {
		
		List<Product_Order> list = new ArrayList<Product_Order>();
		Product_Order o = null;
		
		
		try {
			String sql = "select * from product_order2 ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o=new Product_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setProductName(rs.getString(7));
				o.setDescription(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	

}
