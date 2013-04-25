<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/security/user/create" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<@dwz.layout_form_content layoutH="58">
		<@dwz.label_input content="登录名称:">
			<input type="text" name="username" class="required" size="20" maxlength="32"/>
		</@dwz.label_input>	
		<@dwz.label_input content="真实名字:">
			<input type="text" name="realname" class="required" size="20" maxlength="32"/>
		</@dwz.label_input>					
		<@dwz.label_input content="登录密码:">
			<input type="text" name="plainPassword" class="required" size="20" minlength="6" maxlength="32" value="123456" alt="字母、数字、下划线 6-20位"/>
			<@dwz.span_comment content="&nbsp;&nbsp;默认:123456"/>
		</@dwz.label_input>			
		<@dwz.label_input content="电话:">
			<input type="text" name="phone" class="phone" size="20" maxlength="32"/>
		</@dwz.label_input>	
		<@dwz.label_input content="用户邮箱:">
			<input type="text" name="email" class="email" size="20" maxlength="128"/>
		</@dwz.label_input>	
		<@dwz.label_input content="用户状态:">
			<select name="status">
				<option value="enabled">可用</option>
				<option value="disabled">不可用</option>
			</select>
		</@dwz.label_input>							
		<@dwz.label_input content="关联组织:">
			<input name="organization.id" value="" type="hidden"/>
			<input class="required" name="organization.name" type="text" readonly="readonly"/>
			<a class="btnLook" href="${request.contextPath}/management/security/user/lookup2org" lookupGroup="organization" title="关联组织" width="400">查找带回</a>
		</@dwz.label_input>
	</@dwz.layout_form_content>
			
	<@dwz.form_bar submitTitle="确定" closeTitle="关闭"/>	
</@dwz.form>
</@dwz.layout_content>