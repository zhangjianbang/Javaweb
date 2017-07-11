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
			<div class="daohangtext">产品中心</div>
		</div>
	</div>
	<div class="divbody">
		<div class="liuyan" id="liuyan_id"  style="border: 0; color: white; height: 350px; text-align: center;">
			<!-- 用户通过shop.jsp页面提交过来的多值参数goods=1,2,3,4,5，6 -->
				<!-- 
    1. 创建一个HashMap的对象buycar，当作购物车，把购物车存到session中;
    2. 用户每选中一次商品，从session中把购物车buycar取出来，
               若没有得到购物车（说明是第一次购买，此页面第一次被请求），那么创建buycar；
               判断用户购买的是哪种商品，把buycar中相应商品的数量取出来加1再放进去
    3. 把购物车buycar再放入session。
-->


				<!-- goods=book,computer,car -->
				<%
					String goods[] = { "极简主义-LED台灯", "极简主义-草木盆栽", "极简主义-cos手办", "极简主义-便携提箱", "极简主义-智能窗帘", "极简主义-创意手绘" };
				//String goods[] = { "Java Web", "Java", "HTML5", "11", "66", "55" };	
				HashMap<String, Integer> buycar = (HashMap<String, Integer>) session.getAttribute("goods");
					if (buycar == null) {//用户第一次购买
						buycar = new HashMap<String, Integer>();//<String,Integer>
						for (String good : goods) {
							buycar.put(good, new Integer(0));
							//buycar.put("jsp",new Integer(0));
							//buycar.put("java",new Integer(0));
						}
					}

					String values[] = request.getParameterValues("goods");
					if (values == null) {
						out.print("<h3>您没有选择任何商品，请继续购物。</h3>");
					} else {
						for (String value : values) {
							int id = Integer.parseInt(value);//id保存复选框的value值，即数组元素的下标+1；
							int num1 = ((Integer) buycar.get(goods[id - 1])).intValue();//num1保存对应图书的数量
							buycar.put(goods[id - 1], new Integer(num1 + 1));
						}
						session.setAttribute("goods", buycar);
					}
			%>
				<table  width="100%" height="200" style="border-top: 1px solid white;">
					<caption style="font-size: 1.5em;">购物车</caption>
					<tr>
						<th>商品 </th>
						<th>数量</th>
					</tr>
					<%
						for (String good : goods) {
					%>
					<tr>
						<td><%=good%></td>
						<td><%=buycar.get(good)%></td>
					</tr>
					<%
						}
						
					
					%>

					<%-- 
						<%
						for (String good : goods) {
							out.print("<h3> 你购买了" + buycar.get(good) + "本" + good + "</h3>");
						}
						%> 
					--%>

				</table>
				<br /> <a href="shop.jsp" style="display: inline-block;border: 1px solid white; width: 20%;height: 30px; line-height: 30px;">继续购买</a>
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