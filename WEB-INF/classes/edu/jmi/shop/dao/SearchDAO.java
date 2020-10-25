package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.jmi.shop.bean.Product;

public class SearchDAO extends BaseDAO {
	public ArrayList<Product> Search(String str) {
		Connection c =null;
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			c = this.getConnection();
			String sql = "select * from product where name like ? ";

			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1,"%"+str+"%");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategoryId(rs.getInt("category_id"));
				product.setDiscount(rs.getInt("discount"));
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
		}
		finally {
			this.closeConnection(c);
		}
	}
}
