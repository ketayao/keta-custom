<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/security/organization/create" onsubmit="return validateCallback(this, dialogReloadRel);">
	<input type="hidden" name="parent.id" value="${parentOrganizationId }"/>
	<@dwz.layout_form_content layoutH="58">
		<@dwz.label_input content="名称：">
			<input type="text" name="name" class="required" size="32" maxlength="64" alt="请输入组织名称"/>
		</@dwz.label_input>
		<@dwz.label_input content="描述：">
			<textarea name="description" cols="28" rows="3" maxlength="255"></textarea>
		</@dwz.label_input>	
	</@dwz.layout_form_content>
	<@dwz.form_bar submitTitle="确定" closeTitle="关闭"/>	
</@dwz.form>
</@dwz.layout_content>