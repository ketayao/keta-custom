<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/security/user/update" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="id" value="${user.id}"/>
	<@dwz.layout_form_content layoutH="58">
		<@dwz.label_input content="登录名称:">
			<input type="text" name="username" class="required" size="20" maxlength="32" readonly="readonly" value="${user.username }"/>
		</@dwz.label_input>	
		<@dwz.label_input content="真实名字:">
			<input type="text" name="realname" class="required" size="20" maxlength="32" readonly="readonly" value="${user.realname }"/>
		</@dwz.label_input>							
		<@dwz.label_input content="电话:">
			<input type="text" name="phone" class="phone" size="20" maxlength="32" value="${user.phone }"/>
		</@dwz.label_input>	
		<@dwz.label_input content="用户邮箱:">
			<input type="text" name="email" class="email" size="20" maxlength="128" value="${user.email }"/>
		</@dwz.label_input>	
		<@dwz.label_input content="用户状态:">
			<select name="status">
				<option value="enabled" ${(user.status == "enabled")?string('selected="selected"','')}>可用</option>
				<option value="disabled" ${(user.status == "disabled")?string('selected="selected"','')}>不可用</option>
			</select>
		</@dwz.label_input>							
		<@dwz.label_input content="关联组织:">
			<input name="organization.id" value="${user.organization.id }" type="hidden"/>
			<input class="required" name="organization.name" type="text" readonly="readonly" value="${user.organization.name }"/>
			<a class="btnLook" href="${request.contextPath}/management/security/user/lookup2org" lookupGroup="organization" title="关联组织" width="400">查找带回</a>	
		</@dwz.label_input>
	</@dwz.layout_form_content>
			
	<@dwz.form_bar submitTitle="确定" closeTitle="关闭"/>	
</@dwz.form>
</@dwz.layout_content>