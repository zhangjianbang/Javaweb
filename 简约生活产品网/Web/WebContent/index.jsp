<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
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
	function dengluplay1(){
		document.getElementById('dengluid1').style.display="none";
		document.getElementById('dengluid2').style.display="block";
		document.getElementById('zhuce').style.display="none";
		
	}
	function dengluplay2(){
		document.getElementById('dengluid1').style.display="block";
		document.getElementById('dengluid2').style.display="none";
		document.getElementById('zhuce').style.display="none";
	}
	function zhuce(){
		document.getElementById('zhuce').style.display="block";
		document.getElementById('dengluid2').style.display="none";
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
		int num =1;
	%>
	<%
		if(session.isNew()){
		    num++;    
		}
		session.setAttribute("fk", num);
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
		<img alt="" src="images/2.jpg"> 
	</div>
	<!-- 登录 -->
	<div class="denglu1"  id="dengluid1"onclick="dengluplay1()";>登录</div>
	<div class="divright_form" id="dengluid2" >
			<form action="LoginServlet" method="post" >
				<input type="text" name="username" value="请输入用户名" class="txt" onfocus="javascript:if(this.value=='请输入用户名') this.value=''" onblur="javascript:if(this.value=='') this.value='请输入用户名'"><br>
				<input type="text" name="password" value="请输入密码" class="txt" onfocus="javascript:if(this.value=='请输入密码') this.value=''" onblur="javascript:if(this.value=='') this.value='请输入密码'"><br>
				<input type="submit" value="登录" name="submit" class="button"><br><br>
				<span class="divright_form_span"><a  onclick="dengluplay2()";>关闭窗口</a>&nbsp;&nbsp;<a onclick="zhuce()">注册用户</a></span>
			</form>
	</div>
	<div class="divright_zhuce" id="zhuce" >
			<form action="RegisterServlet" method="post" >
				<input type="text" name="username" value="请输入用户名" class="txt" onfocus="javascript:if(this.value=='请输入用户名') this.value=''" onblur="javascript:if(this.value=='') this.value='请输入用户名'"><br>
				<input type="text" name="password" value="请输入密码" class="txt" onfocus="javascript:if(this.value=='请输入密码') this.value=''" onblur="javascript:if(this.value=='') this.value='请输入密码'"><br>
				<input type="text" name="password" value="请确认密码" class="txt" onfocus="javascript:if(this.value=='请确认密码') this.value=''" onblur="javascript:if(this.value=='') this.value='请确认密码'"><br>
				<input type="submit" value="注册" name="submit" class="button"><br><br>
				<span class="divright_form_span"><a  onclick="dengluplay2()";>关闭窗口</a>&nbsp;&nbsp;<a onclick="dengluplay1()">登录用户</a></span>
			</form>
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