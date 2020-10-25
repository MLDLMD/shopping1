package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.jmi.shop.bean.Contact;
import edu.jmi.shop.bean.User;

public class UserDAO extends BaseDAO {
	
	public boolean insert(User user) {		//添加用户信息
		Connection c =null;
		try {
			c = this.getConnection();
			String sql = "insert into user(user_name,pwd,register_time,role) values(?,?,?,?)" ;
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, user.getUserName());
			pst.setString(2, user.getPwd());
			pst.setDate(3, user.getRegisterTime());
			pst.setString(4, user.getRole());
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			this.closeConnection(c);
		}


	}
	
	public User selectByName(String userName) {			//根据用户名称查找用户信息
		Connection c =null;
		User user=null;
		try {
			c = this.getConnection();
			String sql = "select * from user where user_name=?" ;
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, userName);
			ResultSet rs=pst.executeQuery();
			if (rs.next()) {
				user=new User();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("user_name"));
				user.setPwd(rs.getString("pwd"));
				user.setRole(rs.getString("role"));
				user.setRegisterTime(rs.getDate("register_time"));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			return user;
		}finally {
			this.closeConnection(c);
		}
	}
	public boolean update_pc(User u) {			//跟新用户信息
		try {
			Connection c = this.getConnection();
			String sql = "update user set nickName=?,email=? where id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, u.getNickName());
			pst.setString(2, u.getEmail());
			pst.setInt(3, u.getId());
			pst.execute();
			this.closeConnection(c);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	public List<Contact> selectById_ca(int user_id) {		//根据用户id查找常用联系人信息
		List<Contact> list = new ArrayList<Contact>();
		try {
			Connection c = this.getConnection();
			String sql = "select  * from contect "+
                     " where user_id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, user_id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Contact ca = new Contact();
				ca.setName(rs.getString("name"));
				ca.setId(rs.getInt("id"));
				ca.setContactflag(rs.getInt("contact_flag"));
				ca.setMobile(rs.getString("mobile"));
				ca.setAddress(rs.getString("address"));
				list.add(ca);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return list;
		}

	}
	public Contact Getby(int user_id) {
		Contact list=new Contact();
		try {
			Connection c = this.getConnection();
			String sql = "select  * from contect "+
                     " where user_id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, user_id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Contact ca = new Contact();
				ca.setName(rs.getString("name"));
				ca.setId(rs.getInt("id"));
				ca.setContactflag(rs.getInt("contact_flag"));
				ca.setMobile(rs.getString("mobile"));
				ca.setAddress(rs.getString("address"));
				list=ca;
			}
			return list;
	} catch (Exception e) {
		e.printStackTrace();
		return list;
	}
	}
	public boolean insert(Contact ca) {			//添加常用联系人
		try {
			Connection c = this.getConnection();
			String sql = "insert into contect(name,mobile,address,user_id) values(?,?,?,?)";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, ca.getName());
			pst.setString(2, ca.getMobile());
			pst.setString(3, ca.getAddress());
			pst.setInt(4, ca.getUserid());
			pst.execute();
			this.closeConnection(c);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	public boolean delete(Contact ca) {			//删除常用联系人
		try {
			Connection c = this.getConnection();
			String sql = "delete from contect where id=?";
			PreparedStatement pst = c.prepareStatement(sql);

			pst.setInt(1, ca.getId());
			pst.execute();
			this.closeConnection(c);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	public int user_id(int id) {			//根据用户id查找常用联系人信息
		Contact ca = new Contact();
		try {
			Connection c = this.getConnection();
			String sql = "select user_id from contect "+
                     " where id=?";
				
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				ca.setUserid(rs.getInt("user_id"));
			}
			return ca.getUserid();
		} catch (Exception e) {
			e.printStackTrace();
			return ca.getUserid();
		}

	}
	public Contact selectById(int id) {		//根据id查找常用联系人信息
		Contact ca = new Contact();
		try {
			Connection c = this.getConnection();
			String sql = "select  * from contect "+
                     " where id=?";
				
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
			
				ca.setName(rs.getString("name"));
				ca.setMobile(rs.getString("mobile"));
				ca.setAddress(rs.getString("address"));
				
			}
			return ca;
		} catch (Exception e) {
			e.printStackTrace();
			return ca;
		}

	}
	public boolean update(Contact ca) {		//跟新常用联系人信息
		try {
			Connection c = this.getConnection();
			String sql = "update contect set name=?,mobile=?,address=? where user_id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, ca.getName());
			pst.setString(2, ca.getMobile());
			pst.setString(3, ca.getAddress());
			pst.setInt(4, ca.getId());
			pst.execute();
			this.closeConnection(c);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	public int recordCount()		//记录页码
	{
		int x=0;
		try
		{
			Connection c = this.getConnection();
			String sql="select count(*) as recordCount  from user";
			PreparedStatement pst = c.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			rs.next();
			x=rs.getInt("recordCount");
			return x;
			
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return x;
		}
	}
	public List<User> selectAll(int start,int recCountInPage)//有分页功能的查全部信息
	{
		List<User> list = new ArrayList<User>();
		try
		{
			Connection c = this.getConnection();
			String sql = "select * from user "
					+ "order by id desc limit "+(start-1)+" , "+ recCountInPage;
			PreparedStatement pst = c.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				User u=new User();
				u.setUserName(rs.getString("user_name"));
				u.setPwd(rs.getString("pwd"));
				u.setId(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setNickName(rs.getString("nickname"));
				list.add(u);
					
					
			}
			return list;                
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return list;
		}
	}
	public User selectById_u(int id)
	{
		User u=new User();
		try
		{
			Connection c = this.getConnection();
			String sql = "select * from user where id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			if (rs.next())
			{
				u.setId(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setUserName(rs.getString("user_name"));
				u.setPwd(rs.getString("pwd"));
				u.setNickName(rs.getString("nickname"));
				u.setRole(rs.getString("role"));
			}
			return u;                
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return u;
		}
	}
	public boolean update(User u) {		//跟新用户
		try {
			Connection c = this.getConnection();
			String sql = "update user set user_name=?,pwd=?,email=?,nickname=? where id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, u.getUserName());
			pst.setString(2, u.getPwd());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getNickName());
			pst.setInt(5, u.getId());
			pst.execute();
			this.closeConnection(c);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	public boolean delete(User u) {		//删除用户
		try {
			Connection c = this.getConnection();
			String sql = "delete from user where id=?";
			PreparedStatement pst = c.prepareStatement(sql);

			pst.setInt(1, u.getId());
			pst.execute();
			this.closeConnection(c);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
