<<<<<<< HEAD
<a id="refreshJbsxBox2organizationTree" rel="jbsxBox2organizationTree" target="ajax" href="${request.contextPath}/management/security/organization/tree" style="display:none;"></a>
=======
<a id="refreshJbsxBox2organizationTree" rel="jbsxBox2organizationTree" target="ajax" href="${request.contextPath}/management/security/organization/tree" style="display:none;"/>
>>>>>>> refs/heads/master
<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/security/organization/update" onsubmit="return validateCallback(this, dialogReloadRel2Org);">
	<input type="hidden" name="id" value="${organization.id }"/>
	<input type="hidden" name="parent.id" value="${organization.parent.id }"/>
	<@dwz.layout_form_content layoutH="58">
		<@dwz.label_input content="名称：">
			<input type="text" name="name" class="required" size="32" maxlength="32" value="${organization.name }" alt="请输入组织名称"/>
		</@dwz.label_input>
		<@dwz.label_input content="父组织：">
			<input name="parent.id" value="${organization.parent.id }" type="hidden"/>
			<input class="required" name="parent.name" type="text" readonly="readonly" value="${organization.parent.name }"/>
			<a class="btnLook" href="${request.contextPath}/management/security/organization/lookupParent/${organization.id}" lookupGroup="parent" mask="true" title="更改父组织" width="400">查找带回</a>	
		</@dwz.label_input>		
		<@dwz.label_input content="描述：">
			<textarea name="description" cols="28" rows="3" maxlength="255">${organization.description!'' }</textarea>
		</@dwz.label_input>
	</@dwz.layout_form_content>
	<@dwz.form_bar submitTitle="确定" closeTitle="关闭"/>	
</@dwz.form>
</@dwz.layout_content>
