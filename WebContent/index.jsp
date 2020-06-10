<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
	 <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
	<link rel="stylesheet" href="layer/theme/default/layer.css">
	  <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
    <!-- Demo page code -->
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>
  </head>
  <script type="text/javascript">
  function userlist(){ 
	  
     /*  $.get("user/test.do",function (date){
                   $("#div1").html(date);
                
          });
       } */
       $.get("user/user-list-news.do",function (date){
           $("#div1").html(date);
  	});
       }
       function usershow(){ 
    	       $.get("user/usershow.do",function (date){
    	           $("#div1").html(date);
    	  	});
    	       }
       
   	function findsome() {
    	//var su_id = $("#su_id").val();
    	var su_name = $("#su_name").val();
    	//var su_password = $("#su_password").val();
    	/* $.get("http://localhost:8080/SSMTest/user-findsome.do?id="+su_id+"&su_name="+su_name+"&su_password="+su_password,function (date){
    		$("#mylist").html(date);
    	}); */
    	$.get("user/user-findsome.do?su_name="+su_name,function (date){
    		$("#div1").html(date);
    	});
    }
  </script>
  <body>
 <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    <li id="fat-menu" class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i> ${sessionScope.username}
                            <img style="height:50px"  src="${basePath}/SSM01/user/picshow.do?username=${sessionScope.username}">
                        </a>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#"></a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" class="visible-phone" href="#">0000</a></li>
                            <li class="divider visible-phone"></li>
                            <li><a tabindex="-1" href="user/loginout.do" onclick="ck()">退出账号</a></li>                           
                        </ul>
                    </li>                  
                </ul>
                <a class="brand" href="index.html"><span class="first">Your</span> <span class="second">Company</span></a>
        </div>
    </div>
    <div class="sidebar-nav">
        
        <ul id="dashboard-menu" class="nav nav-list collapse in">
          
         <li><a href="javascript:userlist()">测试</a></li>
           <li><a href="javascript:usershow()">查询User表</a></li>
            <li ><a href="javascript:areashow()">查询地址表</a></li>
            <li ><a href="javascript:student()">注解查学生表</a></li>
            <li ><a href="javascript:sectionshow()">部门表</a></li>
        </ul>
        <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>Account</a>
        <ul id="accounts-menu" class="nav nav-list collapse">
            <li ><a href="sign-in.html">Sign In</a></li>           
        </ul>
        <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>Error Pages <i class="icon-chevron-up"></i></a>
                <ul id="error-menu" class="nav nav-list collapse">
            <li ><a href="403.html">403 page</a></li>
            <li ><a href="404.html">404 page</a></li>
        </ul>
        <ul id="legal-menu" class="nav nav-list collapse">
            <li ><a href="privacy-policy.html">Privacy Policy</a></li>
            <li ><a href="terms-and-conditions.html">Terms and Conditions</a></li>
        </ul>
    </div>
    <div class="content">
      <div id="div1"></div>
       </table>
</div>
    <div>
 <footer>
                        <hr>
                        <p>&copy; 2012 <a href="#" target="_blank">Portnine</a></p>
                    </footer>
           
    </div>
    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  </body>
</html>