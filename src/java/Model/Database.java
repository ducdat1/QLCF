/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ducdat
 */
public class Database {
    private Connection conn;
	private Statement stm;
	public Database()
	{
		
	}

	public void connect()
	{
            try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/qlcf?useUnicode=yes&characterEncoding=UTF-8","root","1234");
                    //stm = conn.createStatement();
                    System.out.println("Kết nối thành công");
            } catch (SQLException e) {
            // TODO Auto-generated catch block
                    System.out.println("loi ket noi");
            } catch (ClassNotFoundException e) {
                    System.out.println("Class not find");
            }
	}
	

	public void close()
	{
		try
		{
			if(getConn()!=null)
				getConn().close();
			//setConn(DriverManager.getconnecttion("localhost", "root", ""));
		}catch(SQLException e)
		{
			System.out.print(e.toString());
		}
	}
	

	public Connection getConn() {
		return conn;
	}


	public void setConn(Connection conn) {
		this.conn = conn;
	}


	public Statement getStm() {
		return stm;
	}


	public void setStm(Statement stm) {
		this.stm = stm;
	}
}
