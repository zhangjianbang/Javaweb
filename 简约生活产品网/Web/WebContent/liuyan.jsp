<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*,java.util.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>极简主义</title>
<link rel="stylesheet" href="css.css" type="text/css">
<script type="text/javascript">
	function display(){
		document.getElementById('wx').style.display="block";
	}
	function nodisplay(){
		document.getElementById('wx').style.display="none";
	}
	/*当前时间*/
		
	function time(){
		var week = new  Array("日","一","二","三","四","五","六");
		var d = new Date();
		var y = d.getFullYear();
		var m = d.getMonth()+1;
		var date = d.getDate();
		var day = d.getDay();
		var h = d.getHours();
		var mm = d.getMinutes();
		var ss = d.getSeconds();
		
		document.getElementById('time_show_id').innerHTML = y+"年"+m+"月"+date+"日 星期"+week[day]+" "+h+":"+mm;
	}
	function show(){
		setInterval(time, 0);
	}
</script>
</head>
<body onload="show()">
	<div class="divtop">
	<%!
		int num = 1;
	%>
	<%
		if(session.isNew()){
		    num++;
		}
	%>
		<div class="name"><span>
		<%
			if(session.getAttribute("showname")==null){
			    out.print("");
			}else{
			    %>您好,<% 
			    out.print(session.getAttribute("showname"));
			}%>
		</span></div>
		<div class="fangke"><span id="fangke_show_id"><%out.print("您是第"+session.getAttribute("fk")+"位访客");%></span></div>
		<div class="time"><span id="time_show_id"></span></div>
		<div class="logo"><img  src="images/logo.png" onclick="window.open('index.jsp','_parent')"></div>
		<div class="daohang">
			<div class="daohangtext" onclick="window.open('index.jsp','_parent')">首页</div>
			<div class="daohangtext" onclick="window.open('liuyan.jsp','_parent')">留点建议</div>
			<div class="daohangtext" onclick="window.open('shop.jsp','_parent')">产品中心</div>
		</div>
	</div>
	<div class="divbody">
	<%
       
         if(session.getAttribute("showname")==null){
        	 request.setAttribute("message","您还未登录,请先登录！");
         %>
        	out.print("<script>alert('您还没有登录，请登录...'); window.location='index.jsp' </script>");
        <%
         }
         %>
		<div class="liuyan" id="liuyan_id" >
			<form action="InsertServlet" method="post" >
				<input type="text" name="name" value="请输入昵称" class="txt" onfocus="javascript:if(this.value=='请输入昵称') this.value=''" onblur="javascript:if(this.value=='') this.value='请输入昵称'" ><br>
				<input type="text" name=title value="请输入标题" class="txt" onfocus="javascript:if(this.value=='请输入标题') this.value=''" onblur="javascript:if(this.value=='') this.value='请输入标题'"><br>
				<textarea name="message" onfocus="javascript:if(this.value=='请输入留言内容') this.value=''" onblur="javascript:if(this.value=='') this.value='请输入留言内容'">请输入留言内容</textarea>
				<input type="submit" value="提交" name="submit" class="button"><br><br>
				<span class="divright_form_span"><a onclick="window.open('QueryBlogServlet','_parent')">查看留言</a></span>
			</form>
	</div>
		<img alt="" src="images/body.jpg">
	</div>
	
	<div class="divbottom">
		<div class="bottom_inform"><span>ミニマリズムDo桑&nbsp;&nbsp;|&nbsp;&nbsp; javaweb作品</span></div>
		<div class="weixin" title="微信"  onmouseover="display()"; onmouseout="nodisplay()";></div>
		<div class="erweima" id="wx">
			<img src="images/weixin.png">
		</div>
	</div>

</body>
</html>