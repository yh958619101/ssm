<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
    <!-- <script type="text/javascript" src="layui/layui.js"></script> -->
    <link  rel="stylesheet" href="layui/css/layui.css" >
    <script type="text/javascript">
    $(document).ready(function (){
        //表格的设置方法 可以将表格的设置内容放在此方法内
        layui.use('table',function (){
               //获取layui中的table
              var table=layui.table;
               //init 初始化到demo位置
             table.init('demo' ,{
                  // 这里写你初始化渲染的参数
                     height: 315, //设置高度
                     limit: 4, //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
                     page: true  // 开启分页
             });
        });
    }); 
    </script>
  <script>
layui.use('table', function(){
  var table = layui.table;
  
  //监听单元格编辑
  table.on('edit(test3)', function(obj){
    var value = obj.value //得到修改后的值
    ,data = obj.data //得到所在行所有键值
    ,field = obj.field; //得到字段
    layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
  });
});
</script>
  </head>
  
  <body>
   <br/>
<!--   <form action="user" target="aa">
<input type="text" placeholder="编号"  name="id" >  
<input type="text" placeholder="用户名"  name="username">   
<input type="text" placeholder="状态" name="status"> 
<input type="button" onclick="tocx_user(this.form)" value="搜索">
 <input type="hidden"  name="m"  value="tocx_user" >
  </form> -->
  <br/>
  <iframe style="display: none" name="aa" ></iframe>
    <button onclick="studentadd()"  class="layui-btn layui-btn-warm">添加</button>
   <button onclick="todel()"  class="layui-btn layui-btn-danger"><i class="layui-icon"></i>删除</button> 
    <table  lay-filter="demo" class="layui-table">
    <thead>
     <tr>
      <th lay-data="{type:'checkbox',field:'id', width:120, sort: true}">ID</th>
       <th  lay-data="{field:'id', width:120, sort: true}">编号</th>
         <th lay-data="{field:'sname', width:120, edit: 'text'}" >姓名</th>
            <th  lay-data="{field:'sage', width:120, edit: 'text'}">年龄</th>
            <th  lay-data="{field:'p', width:220,}">操作</th>
     </tr>
     </thead>
     <tbody>
     <c:forEach items="${requestScope.list}" var="student">
     <tr>
     <td></td>
      <td>${student.id}</td>
      <td>${student.sname}</td>
      <td>${student.sage}</td>
      
<td> <button  onclick="delstudent(${student.id})" class="layui-btn layui-btn-sm layui-btn-normal"><i class="layui-icon"></i> 删除</button>
 <button class="layui-btn "  onclick="updatestudent(${student.id})">编辑</button></td>
     </tr>
     </c:forEach>
     </tbody>
    </table>
  </body>
</html>
