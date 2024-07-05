package com.DAO;

import com.entity.Cart;
import com.entity.ProductDtls;
import java.util.*;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getProductByUser(int userId);
	
    public boolean deleteProduct(int bid , int uid , int cid);	

}
