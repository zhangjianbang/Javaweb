<%@page import="model.ArticleBean"%>
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
	<div class="liuyanshow" id="liuyan_id" >
		<!-- 从application对象中把ArrayList取出来，遍历ArrayList的元素 -->
			<table style="width: 100%; color: white;">
			 <tr>
			   <th>编号</th>
			   <th>留言者姓名</th>
			   <th>留言标题</th>
			   <th>留言内容</th>
			   <th>留言日期</th>
			   <th>删除</th>
			   <th>修改</th>
			 </tr>
			<%
				    String deleteError = (String) request.getAttribute("deleteError");
				    if(deleteError==null){
				    	out.print("");
				    }else{
				    	out.print(deleteError);
				    }
					ArrayList arrayList = (ArrayList) request.getAttribute("article");
					if (arrayList == null) {
						out.print("查询留言列表失败！");
					} else {
						ArticleBean articleBean = new ArticleBean();
						for (int i = 0; i < arrayList.size(); i++) {
							articleBean = (ArticleBean) arrayList.get(i);
				%>
				<tr>
				    <td><%=articleBean.getId()%></td>
					<td><%=articleBean.getName()%></td>
					<td><%=articleBean.getTitle()%></td>
					<td><%=articleBean.getContent()%></td>
					<td><%=articleBean.getDate()%></td>
					<td><a href="UpdateServlet?updateId=<%=articleBean.getId()%>">修改</a><!-- 把要修改的记录的ID字段的值传给UpdateServlet -->
					</td>
					<td><a href="DeleteServlet?deleteId=<%=articleBean.getId()%>">删除</a></td>
				</tr>
				<%
				} } %>
			</table>
			<br /><br />
			<a href="liuyan.jsp" style="display: inline-block;border: 1px solid white; border-bottom:0; width: 20%;height: 30px; line-height: 30px;">继续留言</a>
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