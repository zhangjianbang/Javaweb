<%@ page contentType="text/html;charset=utf-8"%>
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
		<div class="fangke"><span id="fangke_show_id"><%out.print("您是第"+num+"位访客");%></span></div>
		<div class="time"><span id="time_show_id"></span></div>
		<div class="logo"><img  src="images/logo.png" onclick="window.open('index.jsp','_parent')"></div>
		<div class="daohang">
			<div class="daohangtext" onclick="window.open('index.jsp','_parent')">首页</div>
			<div class="daohangtext" onclick="window.open('liuyan.jsp','_parent')">留点建议</div>
			<div class="daohangtext" onclick="window.open('shop.jsp','_parent')">产品中心</div>
		</div>
	</div>