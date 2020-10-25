package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import edu.jmi.shop.bean.Product;
import edu.jmi.shop.util.DBPage;

public class ProductDAO extends BaseDAO {

	public List<Product> selectByCategoryId(int categoryId, int pageSize) {
		Connection c =null;
		List<Product> list = new ArrayList<Product>();
		try {
			c = this.getConnection();
			String sql = "select  * from product " + " where category_id=? order by product.id desc limit 0,?";

			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, categoryId);
			pst.setInt(2, pageSize);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategoryId(rs.getInt("category_id"));

				product.setGeneralExplain(rs.getString("general_explain"));
				product.setExplain(rs.getString("explain"));
				product.setPrice(rs.getInt("price"));
				product.setShopPrice(rs.getInt("shop_price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setHot(rs.getInt("hot"));
				product.setProductStatus(rs.getInt("product_status"));
				product.setDefaultImg(rs.getString("default_img"));
				product.setUpdateTime(rs.getTimestamp("update_time"));
				product.setUpdateUserId(rs.getInt("update_user_id"));

				list.add(product);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}finally {
			this.closeConnection(c);
		}

	}

	public Product selectById(int id) {
		Connection c =null;
		Product product = new Product();
		try {
			c = this.getConnection();
			String sql = "select  * from product " + " where id=?";

			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {

				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategoryId(rs.getInt("category_id"));

				product.setGeneralExplain(rs.getString("general_explain"));
				product.setExplain(rs.getString("explain"));
				product.setPrice(rs.getInt("price"));
				product.setShopPrice(rs.getInt("shop_price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setHot(rs.getInt("hot"));
				product.setProductStatus(rs.getInt("product_status"));
				product.setDefaultImg(rs.getString("default_img"));
				product.setUpdateTime(rs.getTimestamp("update_time"));
				product.setUpdateUserId(rs.getInt("update_user_id"));

			}
			return product;
		} catch (SQLException e) {
			e.printStackTrace();
			return product;
		}finally {
			this.closeConnection(c);
		}

	}

	// 获取分页信息，通过count获得记录数，再通过记录数获得页数
	public DBPage getPage(int pageIndex) {
	
		DBPage dbPage = new DBPage();
		dbPage.setCurruentPage(pageIndex);
		Connection c = null;
		try {
			c = this.getConnection();
			String sql = "select count(*) as recordcount from product";
			PreparedStatement pst = c.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				dbPage.setRecordCount(rs.getInt("recordcount"));
			}
			int pageCount = (int) Math.ceil(dbPage.getRecordCount() / (dbPage.getEveryCount() * 1.0));
			dbPage.setPageCount(pageCount);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			this.closeConnection(c);
		}
		return dbPage;
	}

	// 根据分页信息获取对应页数据
	public List<Product> select(DBPage page) {
		Connection c =null;
		List<Product> list = new ArrayList<Product>();
		try {
			c = this.getConnection();
			String sql = "select product.*,product_category.name as category_name,user.user_name from product "
					+ "left join product_category on product.category_id =product_category.id "
					+ "left join user ON  product.update_user_id = user.id  " + "order by product.id desc limit ?,?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, (page.getCurruentPage() - 1) * page.getEveryCount());
			pst.setInt(2, page.getEveryCount());
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategoryId(rs.getInt("category_id"));
				product.setCategoryName(rs.getString("category_name"));
				product.setGeneralExplain(rs.getString("general_explain"));
				product.setExplain(rs.getString("explain"));
				product.setPrice(rs.getInt("price"));
				product.setShopPrice(rs.getInt("shop_price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setHot(rs.getInt("hot"));
				product.setProductStatus(rs.getInt("product_status"));
				product.setDefaultImg(rs.getString("default_img"));
				product.setUpdateTime(rs.getTimestamp("update_time"));
				product.setUpdateUserId(rs.getInt("update_user_id"));
				product.setUpdateUserName(rs.getString("user_name"));
				list.add(product);
			}
			this.closeConnection(c);
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			this.closeConnection(c);
		}
		return list;
	}

	// 将prouduct对象存储到数据表中
	public boolean insert(Product product) {
		Connection c =null;
		try {
			c = this.getConnection();
			String sql = "";
			if (product.getDefaultImg() != null) {
				sql = "insert into product(name,category_id,price,shop_price,quantity,"
						+ " product_status,hot,general_explain,update_time,update_user_id,default_img)"
						+ " values(?,?,?,?,?,?,?,?,?,?,?)";
			} else {
				sql = "insert into product(name,category_id,price,shop_price,quantity,"
						+ " product_status,hot,general_explain,update_time,update_user_id)"
						+ " values(?,?,?,?,?,?,?,?,?,?)";
			}
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, product.getName());
			pst.setInt(2, product.getCategoryId());
			pst.setInt(3, product.getPrice());
			pst.setInt(4, product.getShopPrice());
			pst.setInt(5, product.getQuantity());
			pst.setInt(6, product.getProductStatus());
			pst.setInt(7, product.getHot());
			pst.setString(8, product.getGeneralExplain());
			pst.setTimestamp(9, product.getUpdateTime());
			pst.setInt(10, product.getUpdateUserId());
			if (product.getDefaultImg() != null) {
				pst.setString(11, product.getDefaultImg());
			}
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			this.closeConnection(c);
		}

	}

	// 将prouduct对象更新到数据表中
	public boolean update(Product product) {
		Connection c =null;
		try {
			c = this.getConnection();
			String sql = "update product set name=?,category_id=?,price=?,shop_price=?,"
					+ "quantity=?,product_status=?,hot=?,general_explain=?,update_time=?" + ",update_user_id=?";
			if (product.getDefaultImg() != null) {
				sql += ",default_img=? ";
			}
			sql += "where id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, product.getName());
			pst.setInt(2, product.getCategoryId());
			pst.setInt(3, product.getPrice());
			pst.setInt(4, product.getShopPrice());
			pst.setInt(5, product.getQuantity());
			pst.setInt(6, product.getProductStatus());
			pst.setInt(7, product.getHot());
			pst.setString(8, product.getGeneralExplain());
			pst.setTimestamp(9, product.getUpdateTime());
			pst.setInt(10, product.getUpdateUserId());
			if (product.getDefaultImg() != null) {
				pst.setString(11, product.getDefaultImg());
				pst.setInt(12, product.getId());
			} else {
				pst.setInt(11, product.getId());
			}
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			this.closeConnection(c);
		}

	}

	// 根据ID删除记录
	public boolean delete(int id) {
		Connection c =null;
		try {
			c = this.getConnection();
			String sql = "delete from product where id=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, id);
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			this.closeConnection(c);
		}

	}

	public static void main(String args[]) {
		ProductDAO productDao = new ProductDAO();
		Timestamp date=new Timestamp(new java.util.Date().getTime());
		
		System.out.println(date);
		DBPage page = productDao.getPage(1);
		productDao.select(page);

	}

}
