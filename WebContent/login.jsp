<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String username=null;
String password=null;
Cookie[] cookie= request.getCookies();
for(int i=0;i<cookie.length;i++){
	if("username".equals(cookie[i].getName())){
		username=cookie[i].getValue();
	}
	if("password".equals(cookie[i].getName())){
		password=cookie[i].getValue();
	}	
}
pageContext.setAttribute("username", username);
pageContext.setAttribute("password", password);
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
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
	 <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
	
	  <script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>
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
  
  <body>
  <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                </ul>
                <a class="brand" href="index.html"><span class="first">Your</span> <span class="second">Company</span></a>
        </div>
    </div>
        <div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <p class="block-heading">登录</p>
            <div class="block-body">
                <form action="user/login.do" method="post">
                    <label>用户名</label>
                    <input type="text" name="username" id="username" value="${username}" class="span12">
                    <label>密码</label>
                    <input type="password" name="password" id="password" value="${password}" class="span12">
               			
                    <label class="remember-me"><input type="checkbox" name="cx" value="true">记住密码</label>
                     <input type="submit" class="btn btn-primary pull-right" value="登录">
                    <div class="clearfix"></div>
                   
                </form>
            </div>
        </div>
        <p class="pull-right" style=""><a href="register.jsp" target="blank">立即注册</a></p>
        <p><a href="reset-password.html">忘记密码？</a></p>
    </div>
</div>
    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
	<script type="text/javascript">
		$(function() {
		if (window.history && window.history.pushState) {
			$(window).on('popstate', function () {
			window.history.pushState('forward', null, '#');
			window.history.forward(1);
			});
		}
		window.history.pushState('forward', null, '#'); 
			window.history.forward(1);
		});
	</script>
  </body>
</html>
