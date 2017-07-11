<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*"%>
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
		setInterval(jishi, 1000);
	}
	function jishi() {
		var t = document.getElementById('jishi').innerHTML;
		t = t-1;
		document.getElementById('jishi').innerHTML = t;
		if(t<=0){
			window.open("liuyan.jsp", "_parent");
		}
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
		<div class="liuyanpane" id="liuyan_id"  style="padding-top: 20px;">
				<span style="color: white;"><%
					request.setCharacterEncoding("UTF-8");
					ArrayList v = (ArrayList) application.getAttribute("mess");
					if (v == null) {
						v = new ArrayList();
					}
					String username = request.getParameter("name");
					String title = request.getParameter("title");
					String message = request.getParameter("message");
					if (username == null)
						out.print("您的姓名为空");
					if (title == null)
					    out.print("您的留言标题为空");
					if (message == null)
					    out.print("您的留言内容为空");
					else {
					    String total = "<tr ><td width='40%'>" + username + "</td><td width='30%'>" + title + "</td><td width='30%'>"
							+ message + "</td></tr>";
						v.add(total);
						application.setAttribute("mess", v);
					out.print("你的留言已经提交");
					}
				%></span>
				<a href="liuyan.jsp"><span id="jishi" style="color: yellow;">5</span>秒后返回</a>
	</div>
		<img alt="" src="images/body.jpg">
	</div>
	
	<div class="divbottom">
		<div class="bottom_inform"><span>ミニマリズムDo桑&nbsp;&nbsp;|&nbsp;&nbsp; jsp.net作业</span></div>
		<div class="weixin" title="微信"  onmouseover="display()"; onmouseout="nodisplay()";></div>
		<div class="erweima" id="wx">
			<img src="images/weixin.png">
		</div>
	</div>

</body>
</html>