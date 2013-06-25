<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/index/updatePwd">
	<@dwz.layout_form_content layoutH="58">
		<#--
		<@dwz.label_input content="当前密码：">
			<input type="password" name="oldPassword" class="required"/>
		</@dwz.label_input>		
		-->
		<@dwz.label_input content="新密码：">
			<input type="password" name="plainPassword" id="newPassword" class="required" maxlength="32"/>
		</@dwz.label_input>
		<@dwz.label_input content="确认新密码：">
			<input type="password" name="rPassword" class="required" equalTo="#newPassword" maxlength="32"/>
		</@dwz.label_input>
	</@dwz.layout_form_content>
	<@dwz.form_bar submitTitle="修改" closeTitle="关闭"/>
</@dwz.form>
</@dwz.layout_content>