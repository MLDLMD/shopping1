package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class BaseDAO {
   
	protected static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";
	protected static final String URL="jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC";
	protected static final String USERNAME="root";
	protected static final String PASSWORD="s19990716";
	
   	
   protected  Connection getConnection(){
	   Connection c=null;
	   try{
	      Class.forName(CLASS_NAME);
	      c=DriverManager.getConnection(URL,USERNAME,PASSWORD);
	      return c;
	   }catch(Exception ex){
		   ex.printStackTrace();
		   return c;
	   }
   }
   
   protected void closeConnection(Connection c){
	   try{
		   if (c!=null){
			   c.close();
		   }
	   }catch(Exception ex){
		   ex.printStackTrace();
	   }
   }
}
