package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.jmi.shop.bean.ProductCategory;

public class ProductCategoryDAO extends BaseDAO {
	
	public List<ProductCategory> selectAll() {
		Connection c =null;
		List<ProductCategory> list=new ArrayList<ProductCategory>();
		try {
			 c = this.getConnection();
			String sql = " SELECT id, name FROM product_category order by sort_order asc" ;
			PreparedStatement pst = c.prepareStatement(sql);	
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				ProductCategory productCategory=new ProductCategory();
				productCategory.setId(rs.getInt("id"));
				productCategory.setName(rs.getString("name"));
				list.add(productCategory);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}finally {
			this.closeConnection(c);
		}

	}
	public List<ProductCategory> select() {		//获取全部信息
		List<ProductCategory> list=new ArrayList<ProductCategory>();
		try {
			Connection c = this.getConnection();
			String sql = " SELECT product_category.*,user.user_name FROM product_category,user where product_category.update_user_id=user.id order by sort_order asc" ;
			PreparedStatement pst = c.prepareStatement(sql);	
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				ProductCategory productCategory=new ProductCategory();
				productCategory.setId(rs.getInt("id"));
				productCategory.setName(rs.getString("name"));
				productCategory.setUpdateTime(rs.getDate("update_time"));
				productCategory.setDescription(rs.getString("description"));
				productCategory.setUsername(rs.getString("user_name"));
				list.add(productCategory);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return list;
		}

	}
	public ProductCategory selectById(int id)		//根据id获取指定商品分类信息
	{
		ProductCategory productCategory=null;
		try
		{
			Connection c = this.getConnection();
			String sql="select * from product_category where id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				productCategory=new ProductCategory();
				productCategory.setId(rs.getInt("id"));
				productCategory.setName(rs.getString("name"));
				productCategory.setUpdateTime(rs.getDate("update_time"));
				productCategory.setDescription(rs.getString("description"));
				productCategory.setUpdateUserId(rs.getInt("update_user_id"));
				
			
			}
			return productCategory;
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return productCategory;
		}
	}
	public boolean update(ProductCategory productcategory)		//跟新商品分类信息
	{
		try
		{
			Connection c=this.getConnection();
			String sql="update product_category set name=?,description=?,update_time=?,update_user_id=?  where id=?";
			PreparedStatement pst= c.prepareStatement(sql);
			pst.setString(1, productcategory.getName());
			pst.setString(2, productcategory.getDescription());
			pst.setDate(3, productcategory.getUpdateTime());
			pst.setInt(4, productcategory.getUpdateUserId());
			pst.setInt(5, productcategory.getId());
			pst.execute();
			return true;
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	public boolean delete(int id)		//删除商品类别信息
	{
		try
		{
			Connection c=this.getConnection();
			String sql="delete from product_category where id=?";
			PreparedStatement pst= c.prepareStatement(sql);
			pst.setInt(1,id);
			pst.execute();
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	public static void main(String args[]) {
		ProductCategoryDAO productDao=new ProductCategoryDAO();
		List<ProductCategory> list = productDao.selectAll();
		for(ProductCategory productCategory:list) {
			System.out.println(productCategory.getName());
		}
	}
	public boolean insert(ProductCategory productcategory)
	{
		try{
			Connection c = this.getConnection(); 
			String sql="insert into product_category(name,description,update_time,update_user_id) values(?,?,?,?) ";
			PreparedStatement pst= c.prepareStatement(sql);
			pst.setString(1, productcategory.getName());
			pst.setString(2, productcategory.getDescription());
			pst.setDate(3, productcategory.getUpdateTime());
			pst.setInt(4, productcategory.getUpdateUserId());
			pst.execute();
			return true;
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
		
	}
	public List<ProductCategory> selectbyid(int Id) {
		Connection c =null;
		List<ProductCategory> list=new ArrayList<ProductCategory>();
		try {
			 c = this.getConnection();
			String sql = " SELECT id, name FROM product_category where id=?" ;
			PreparedStatement pst = c.prepareStatement(sql);	
			pst.setInt(1,Id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				ProductCategory productCategory=new ProductCategory();
				productCategory.setId(rs.getInt("id"));
				productCategory.setName(rs.getString("name"));
				list.add(productCategory);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}finally {
			this.closeConnection(c);
		}

	}
}
