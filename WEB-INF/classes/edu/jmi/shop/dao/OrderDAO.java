package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.jmi.shop.dao.BaseDAO;
import edu.jmi.shop.bean.OrderInfo;
import edu.jmi.shop.bean.OrderItem;

public class OrderDAO extends BaseDAO {

	public List<OrderItem> selectOrderItem(int userId,String orderNumber) {
		Connection c =null;
		List<OrderItem> list = new ArrayList<OrderItem>();
		try {
			 c = this.getConnection();
			String sql = " SELECT order_item.*,product.name as product_name,product.default_img as product_img"+
			                " from order_item,product where order_num=? and user_id=? and product.id=order_item.product_id";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, orderNumber);
			pst.setInt(2, userId);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				OrderItem orderItem = new OrderItem();

				orderItem.setId(rs.getString("id"));
				orderItem.setOrderNumber(rs.getString("order_num"));
				orderItem.setProductId(rs.getInt("product_id"));
				orderItem.setPrice(rs.getInt("price"));
				orderItem.setQuantity(rs.getInt("quantity"));
				orderItem.setUserId(rs.getInt("user_id"));
				orderItem.setProductName(rs.getString("product_name"));
				orderItem.setProductImg(rs.getString("product_img"));
				list.add(orderItem);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		} finally {
			this.closeConnection(c);
		}

	}

	public OrderItem selectOrderItem(String orderNumber, int productId, int userId) {
		Connection c =null;
		OrderItem orderItem = null;
		try {
			 c = this.getConnection();
			String sql = " SELECT * from order_item where order_num=? and product_id=? and user_id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, orderNumber);
			pst.setInt(2, productId);
			pst.setInt(3, userId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				orderItem = new OrderItem();

				orderItem.setId(rs.getString("id"));
				orderItem.setOrderNumber(rs.getString("order_num"));
				orderItem.setProductId(rs.getInt("product_id"));

				orderItem.setPrice(rs.getInt("price"));
				orderItem.setQuantity(rs.getInt("quantity"));
				orderItem.setUserId(rs.getInt("user_id"));

			}
			return orderItem;
		} catch (SQLException e) {
			e.printStackTrace();
			return orderItem;
		} finally {
			this.closeConnection(c);
		}

	}

	public boolean insertItem(OrderItem orderItem) {
		Connection c =null;
		try {
			c = this.getConnection();
			String sql = "insert into order_item(id,order_num,product_id,price,quantity,user_id) values(?,?,?,?,?,?)";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, orderItem.getId());
			pst.setString(2, orderItem.getOrderNumber());
			pst.setInt(3, orderItem.getProductId());
			pst.setInt(4, orderItem.getPrice());
			pst.setInt(5, orderItem.getQuantity());
			pst.setInt(6, orderItem.getUserId());
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			this.closeConnection(c);
		}

	}
	
	public boolean insertOrder(OrderInfo orderInfo) {
		Connection c =null;
		try {
			c = this.getConnection();
			String sql = "insert into order_info(order_num,price,payment_flag,user_id,contact_name,contact_mobile,contact_address,message,status,create_time)" +
			             "values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, orderInfo.getOrderNumber());
			pst.setInt(2, orderInfo.getPrice());
			pst.setInt(3, orderInfo.getPaymentFlag());
			pst.setInt(4, orderInfo.getUserId());
			pst.setString(5, orderInfo.getContactName());
			pst.setString(6, orderInfo.getContactMobile());
			pst.setString(7, orderInfo.getContactAddress());
			pst.setString(8, orderInfo.getMessage());
			pst.setInt(9, orderInfo.getStatus());
			pst.setDate(10, orderInfo.getCreateTime());
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			this.closeConnection(c);
		}

	}
	
	public OrderInfo selectOrder(String orderNumber) {
		Connection c =null;
		OrderInfo orderInfo= null;
		try {
			 c = this.getConnection();
			String sql = "select * from order_info where order_num=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, orderNumber);
			
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				orderInfo = new OrderInfo();

				orderInfo.setOrderNumber(rs.getString("order_num"));
				orderInfo.setPrice(rs.getInt("price"));
				orderInfo.setPaymentFlag(rs.getInt("payment_flag"));
				orderInfo.setUserId(rs.getInt("user_id"));
				orderInfo.setContactName(rs.getString("contact_name"));
				orderInfo.setContactMobile(rs.getString("contact_mobile"));
				orderInfo.setContactAddress(rs.getString("contact_address"));
				orderInfo.setMessage(rs.getString("message"));
				orderInfo.setStatus(rs.getInt("status"));
				orderInfo.setCreateTime(rs.getDate("create_time"));
				
			}
			return orderInfo;
		} catch (SQLException e) {
			e.printStackTrace();
			return orderInfo;
		} finally {
			this.closeConnection(c);
		}

	}
	
	
	public boolean updateItem(OrderItem orderItem) {
		Connection c =null;
		try {
			 c = this.getConnection();
			String sql = "update order_item set order_num=?,product_id=?,price=?,quantity=?,user_id=? where id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, orderItem.getOrderNumber());
			pst.setInt(2, orderItem.getProductId());
			pst.setInt(3, orderItem.getPrice());
			pst.setInt(4, orderItem.getQuantity());
			pst.setInt(5, orderItem.getUserId());
			pst.setString(6, orderItem.getId());
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			this.closeConnection(c);
		}

	}
	public void orderDelete(String id){
		try{			
			Connection c=new BaseDAO().getConnection();
			Statement st=c.createStatement();
		st.execute("delete from order_item where id="+id+"");
			c.close();
			System.out.print(id);
	}catch(Exception ex){
		ex.printStackTrace();		
		}
	}
	public void orderDeleteAll(){
		try{			
			Connection c=new BaseDAO().getConnection();
			Statement st=c.createStatement();
		st.execute("delete from order_item");
			c.close();
	}catch(Exception ex){
		ex.printStackTrace();		
		}
	}
	public List<OrderInfo> myOrder(String user_id,String payment_flag){
		try{
			List<OrderInfo> list=new ArrayList();
			Connection c=new BaseDAO().getConnection();
			Statement st=c.createStatement();
			ResultSet rs=st.executeQuery("select *from order_info where user_id='"+user_id+"' and payment_flag='"+payment_flag+"'");
			while(rs.next())
			{
				OrderInfo o=new OrderInfo();
				o.setContactAddress(rs.getString("contact_address"));
				o.setContactMobile(rs.getString("contact_mobile"));
				o.setContactName(rs.getString("contact_name"));				
			
				
			
				o.setCreateTime(rs.getDate("create_time"));

				o.setMessage(rs.getString("message"));
				o.setOrderNumber(rs.getString("order_num"));
				o.setPaymentFlag(rs.getInt("payment_flag"));
				o.setPrice(rs.getInt("price"));
				o.setStatus(rs.getInt("status"));
				o.setUserId(rs.getInt("user_id"));
				list.add(o);
			}
			c.close();
			return list;
	}catch(Exception ex){
		ex.printStackTrace();
		return null;
		}
	}
	public static void main(String args[]) {
		
	}
}
