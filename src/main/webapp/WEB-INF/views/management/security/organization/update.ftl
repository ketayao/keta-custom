<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/security/organization/update" onsubmit="return validateCallback(this, dialogReloadRel);">
	<input type="hidden" name="id" value="${organization.id }"/>
	<input type="hidden" name="parent.id" value="${organization.parent.id }"/>
	<@dwz.layout_form_content layoutH="58">
		<@dwz.label_input content="名称：">
			<input type="text" name="name" class="required" size="32" maxlength="32" value="${organization.name }" alt="请输入组织名称"/>
		</@dwz.label_input>
		<@dwz.label_input content="描述：">
			<textarea name="description" cols="28" rows="3" maxlength="255">${organization.description!'' }</textarea>
		</@dwz.label_input>	
	</@dwz.layout_form_content>
	<@dwz.form_bar submitTitle="确定" closeTitle="关闭"/>	
</@dwz.form>
</@dwz.layout_content>