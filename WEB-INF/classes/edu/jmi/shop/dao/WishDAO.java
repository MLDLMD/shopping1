package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.jmi.shop.bean.Product;

public class WishDAO extends BaseDAO{
	public List<Product> wishList(String user_id)
	{
		try{
			
			Connection c=new BaseDAO().getConnection();
			Statement st=c.createStatement();
			ResultSet rs=st.executeQuery("SELECT * FROM shopping.wishlist,shopping.product where wishlist.product_id=product.id and user_id='"+user_id+"'");
			List<Product> list=new ArrayList<Product>();
			while(rs.next())
			{	
				Product product=new Product();
				product.setId(rs.getInt("product_id"));
				product.setDefaultImg(rs.getString("default_img"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setShopPrice(rs.getInt("shop_price"));
				list.add(product);
			}
			return list;
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		
	}
	public boolean deleteWish(String user_id,String product_id)
	{
		try{
			
			Connection c=new BaseDAO().getConnection();
			String sql ="delete from wishlist where user_id=? and product_id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, user_id);
			pst.setString(2, product_id);
			pst.execute();
			this.closeConnection(c);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		
	}
	public static void main(String[] args){
		WishDAO wish=new WishDAO();
		List list=wish.wishList("123486");
		for(int i=0;i<list.size();i++){
			Product product=(Product) list.get(i);
			System.out.println(product.getId());
		}
	}
	
}
