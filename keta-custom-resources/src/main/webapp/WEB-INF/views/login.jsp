<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KETA定制化平台</title>
<link href="${contextPath}/styles/dwz/themes/default/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/styles/dwz/themes/css/core.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/styles/dwz/themes/css/login.css" rel="stylesheet" type="text/css" />

<!-- form验证 -->
<link rel="stylesheet" href="${contextPath}/styles/validationEngine/css/validationEngine.jquery.css" type="text/css"/>
<script src="${contextPath}/styles/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/styles/validationEngine/js/languages/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/styles/validationEngine/js/jquery.validationEngine-2.6.4.js" type="text/javascript" charset="utf-8"></script>
<script>
    jQuery(document).ready(function(){
        jQuery("#formID").validationEngine();
    });
    jQuery(document).ready(function(){
    	$("#captcha").click(function(){
    		$(this).attr("src", "${contextPath}/Captcha.jpg?time=" + new Date());
    		return false;
    	});
    });

</script>
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<img src="${contextPath}/styles/dwz/themes/default/images/logo.png" />
			</h1>

			<div class="login_headerContent">
				<div class="navList">
					<ul>
						<li><a href="${contextPath}/management/index">后台主页</a></li>
						<li><a href="https://github.com/ketayao/keta-custom" target="_blank">k-custom主页</a></li>
					</ul>
				</div>
				<h2 class="login_title">请登录</h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm">
				<form method="post" action="${contextPath}/login" id="formID" >
					<c:if test="${msg!=null }">
						<p style="color: red; margin-left: 10px;">${msg }</p>
					</c:if>
					<p>
						<label>用户名:</label>
						<input type="text" name="username" style="width: 150px;" class="validate[required] login_input" id="username" value="${username }"/>
					</p>
					<p>
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
						<input type="password" name="password" style="width: 150px;" class="validate[required] login_input" id="password"/>
					</p>
					<p>
						<label>验证码:</label>
						<input type="text" id="captcha_key" style="width: 70px;float:left;" name="captcha_key" class="login_input validate[required,maxSize[4]]" size="6" />
						<span><img src="${contextPath}/Captcha.jpg" alt="点击刷新验证码" width="75" height="24" id="captcha"/></span>
					</p>
					<p>
						<label>记住我:</label>
						<input type="checkbox" id="rememberMe" name="rememberMe"/>
					</p>					
					<div class="login_bar" style="disply:block;float:left;">
						<input class="sub" type="submit" value=""/>
					</div>
				</form>
			</div>
			<div class="login_banner"><img src="${contextPath}/styles/dwz/themes/default/images/login_banner.jpg" /></div>
			<div class="login_main">
				<ul class="helpList">
					<li><a href="javascript:toggleBox('forgotPwd')">忘记密码?</a></li>
				</ul>

				<div class="login_inner">
					<p>测试用户名: admin</p>
					<p>测试密码: 123456</p>
				</div>
			</div>
		</div>
		<div id="login_footer">
			Copyright &copy; 2012-2013, ketayao.com, All Rights Reserve.
		</div>
	</div>
</body>
</html>