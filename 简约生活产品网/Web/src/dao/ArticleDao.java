package dao;

//import java.sql.Date;
import java.util.Date;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import model.ArticleBean;
import model.InsertBean;

public class ArticleDao {
private DefaultDao ddobject;
	
	public ArticleDao(){
		ddobject=new DefaultDao();
	}
	/*public ResultSet queryBlog(String a){
		
		String sql="select * from liuyan where title like '%"+a+"%'";
		ResultSet rs=ddobject.getResult(sql);
		return rs;
	}*/
public ResultSet queryBlog(){
		
		String sql="select * from liuyan";
		ResultSet rs=ddobject.getResult(sql);
		return rs;
	}
	public boolean insertBlog(InsertBean insertBean){
		boolean mark=false;
		if(insertBean!=null){
			Date date=new Date();
			java.sql.Date newDate=new java.sql.Date(date.getTime());
	        String sql="insert into liuyan(ly_name, ly_title, ly_content, ly_time) values('"+insertBean.getName()+"','"+insertBean.getTitle()+"','"+insertBean.getContent()+"','"+newDate+"')";
			try{
				int i=ddobject.doDML(sql);
			if(i==1) mark=true; 
			}catch(Exception e){
				mark=false;
				e.printStackTrace();
			}
			}
			return mark;
	}
public ResultSet queryBlogById(int newId){
		
		String sql="select * from liuyan where id="+newId;
		ResultSet rs=ddobject.getResult(sql);
		return rs;
	}
public boolean updateBlog(ArticleBean articleBean){
	boolean mark=false;
	if(articleBean!=null){
		String sql="update liuyan set ly_name='"+articleBean.getName()+"',ly_title='"+articleBean.getTitle()+"',ly_content='"+articleBean.getContent()+"',ly_time='"+articleBean.getDate()+"' where id="+articleBean.getId();
		try{
			int i=ddobject.doDML(sql);
		if(i==1) mark=true; 
		}catch(Exception e){
			mark=false;
			e.printStackTrace();
		}
		}
		return mark;
}
public int deleteBlogById(int newId){
	String sql="delete from liuyan where id="+newId;
	int i=ddobject.doDML(sql);
	return i;
}
}
