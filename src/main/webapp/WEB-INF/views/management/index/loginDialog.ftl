<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	$("#captcha").click(function(){
		$(this).attr("src", "${request.contextPath}/Captcha.jpg?time=" + new Date());
		return false;
	});
});
//-->
</script>
<@dwz.layout_content>
	<@dwz.form action="${request.contextPath}/login">
		<#-- 指定为ajax请求 -->
		<input type="hidden" name="ajax" value="true"/>
		<@dwz.layout_form_content layoutH="58">
			<@dwz.label_input content="用户名：">
				<input type="text" name="username" id="username" maxlength="20" class="required"/>
			</@dwz.label_input>
			<@dwz.label_input content="密&nbsp;&nbsp;&nbsp;&nbsp;码:">
				<input type="password" name="password" id="password" maxlength="20" class="required"/>
			</@dwz.label_input>
			<@dwz.label_input content="验证码:">
				<input type="text" id="captcha_key" name="captcha_key" class="code validate[required,maxSize[6]]" size="6" />&nbsp;&nbsp;
				<span><img src="${request.contextPath}/Captcha.jpg" alt="点击刷新验证码" width="75" height="24" id="captcha"/></span>
			</@dwz.label_input>						
		</@dwz.layout_form_content>
		<@dwz.form_bar submitTitle="登录" closeTitle="关闭"/>		
	</@dwz.form>
</@dwz.layout_content>