package Dao;
import java.sql.*;
    // request.setCharacterEncoding("UTF-8");
    // String id=request.getParameter("id");
    // Connection conn=null; 
    // Statement stat=null; 
    // ResultSet rs=null;
    // Class.forName("com.mysql.jdbc.Driver");
    // String url="jdbc:mysql://127.0.0.1:3306/library?useUnicode=true&characterEncoding=UTF-8&useOldAliasMetadataBehavior=true";
    // String user="root";
    // String password="root";
    // conn=DriverManager.getConnection(url,user,password); 
    // stat=conn.createStatement(); 
    // rs=stat.executeQuery("select * from t_bookedito");
public class JDBC {
	static String url="jdbc:mysql://127.0.0.1:3306/library?useUnicode=true&characterEncoding=UTF-8&useOldAliasMetadataBehavior=true";
	static String user="root";
	static String password="root";
	static Connection conn=null; 
	static Statement stat=null; 
	static ResultSet rs=null;
	public static boolean update(String sql){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url,user,password); 
			stat=conn.createStatement(); 
			return(stat.executeUpdate(sql)>0);
		}catch(SQLException e){
			e.printStackTrace();
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		return false;
		
	}
	
	public static ResultSet query(String sql){
		// request.setCharacterEncoding("UTF-8");
		// String id=request.getParameter("id");
		
		
		
		

		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url,user,password); 
			stat=conn.createStatement(); 
			rs=stat.executeQuery(sql);
		}catch(SQLException e){
			e.printStackTrace();
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		
		// if(rs!=null)
		// {
			// rs.close();
		// }
		
			// if(stat!=null)
		// {
			// stat.close();
		// }
			// if(conn!=null)
		// {
			// conn.close();
		// }
			
		return rs;
	}
}