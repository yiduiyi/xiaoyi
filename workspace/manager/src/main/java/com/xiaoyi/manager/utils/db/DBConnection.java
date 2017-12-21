package com.xiaoyi.manager.utils.db;

import java.sql.*;

public class DBConnection
{
    private final String DBDRIVER = "com.mysql.jdbc.Driver";
    private final String DB_URL = "jdbc:mysql://localhost:3306/xiaoyidb";
    private final String USER = "root";
    private final String PASSWORD = "123456";
    private static Connection conn=null;
    
    private DBConnection()
    {
        try
        {
            try {
				Class.forName(DBDRIVER);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            conn = DriverManager.getConnection(DB_URL,USER,PASSWORD);
        } catch (SQLException e)
        {
            // TODO Auto-generated catch block
            System.out.println("加载驱动失败");
        }

    }
    
    public static Connection getConnection()
    {
    	synchronized (DBConnection.class) {
    		if(conn==null){
    			new DBConnection();
    		}
		}
        return conn;
    }
    
    public static void close()
    {
        if(conn!=null)
        {
            try
            {
                conn.close();
            } catch (SQLException e)
            {            	
                System.out.println("数据库连接关闭失败");
            }
        }
    }
}
