package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.jmi.shop.bean.User;
import edu.jmi.shop.bean.VistorLog;

public class VistorLogDAO extends BaseDAO {
	
	public boolean insert(VistorLog log) {
		Connection c =null ;
		try {
			 c = this.getConnection();
			String sql = "insert into vistor_log(vistor_host,vistor_user,vistor_url,vistor_param,vistor_time) values(?,?,?,?,?)" ;
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, log.getVistorHost());
			pst.setString(2, log.getVistorUser());
			pst.setString(3, log.getVistorURL());
			pst.setString(4, log.getVistorParam());
			pst.setTimestamp(5, log.getVistorTime());
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			this.closeConnection(c);
		}
	}
}
