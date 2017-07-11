package dao;
import java.sql.*;
import model.*;

public class UserDao {
private DefaultDao ddobject;
	
	public UserDao(){
		ddobject=new DefaultDao();
	}
	
	public boolean register(RegisterBean register){
		boolean mark=false;
		if(register!=null){
			String sql = "insert into jb_user values('" + register.getUsername() + "','" + register.getPassword() + "')";
		try{
			int i=ddobject.doDML(sql);
		if(i==1) mark=true; 
		}catch(Exception e){
			
			e.printStackTrace();
		}
		}
		return mark;
	}
	
	public boolean login(LoginBean loginer){
		boolean mark=false;
		if(loginer!=null){
			String sql="select * from jb_user where username='"+loginer.getUsername()+"' and password='"+loginer.getPassword()+"'";
			ResultSet rs=ddobject.getResult(sql);
		
			try {
				if(rs!=null&&rs.next()) {
				    mark=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		return mark;
		
	}
	
	}



