<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'show.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<!-- <script type="text/javascript" src="layui/layui.js"></script> -->
<script type="text/javascript" src="layui/layui.all.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<style type="text/css">
	.layui-table-cell {height: auto;line-height: 40px;text-align: center;}
	.top{
		margin-top: 7px;
		padding-left: 50px;
		height: 120px;
		width: 150px;
	}
</style>
<script type="text/javascript">
	
	function deletemore(){
		$.get("http://localhost:8080/SSM2/user/user-truedeletemore.do",function (date){
			if(date=="yes"){
			  userlist();
			}else{
				alert("no");
			}
		});
	}
	function get(list){
		$.get("http://localhost:8080/SSM2/user/user-deletemore.do?list="+list,function (date){});
	}
    $(document).ready(function (){
        //表格的设置方法 可以将表格的设置内容放在此方法内
        layui.use('table',function (){
               //获取layui中的table
              var table=layui.table;
               //init 初始化到demo位置
             table.init('demo' ,{
                  // 这里写你初始化渲染的参数
                     height: 685, //设置高度
                     limit: 10, //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
                     page: true  //开启分页
             });
             var list = [];
             table.on('checkbox(demo)', function(obj){
   	          console.log(obj.data.id);
   	          if(obj.checked==true){
   	        	   list.push(obj.data.id);
   	          }else{
   	       	   var s = $.inArray(obj.data.id,list)
   	       	   if(s!=-1){
   	       		   list.splice(s,1);
   	       	   }
   	          }
   	       		get(list);
   	        });
	           //监听单元格编辑
	       	  table.on('edit(demo)', function(obj){
	       	    var value = obj.value //得到修改后的值
	       	    ,data = obj.data //得到所在行所有键值
	       	    ,field = obj.field; //得到字段
	       	    layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
	       	  });
        });
    }); 
    </script>

</head>
<body>
	<input type="submit" value="提交查询" onclick="findsome();" class="layui-btn layui-btn-normal"/>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" placeholder="请输入模型名称搜索" name="name" id="su_name" class="top"><!-- &nbsp;&nbsp;<input type="text" placeholder="密码" name="password" id="su_password" class="top"> -->

	<table lay-filter="demo" class="layui-table layui-hide" lay-data="{id:'test3'}" lay-filter="test3">
		<thead>
		<tr>
			<th lay-data="{field:'name', edit: 'text'}">模型名称</th>
			<th lay-data="{field:'time', width:500,edit: 'text'}">出现次数</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${requestScope.list}" var="user">
			<tr id="id">
				<td>${user.name}</td>
				<td>${user.time}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>
