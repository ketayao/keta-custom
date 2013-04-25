<@dwz.layout_content>
	<@dwz.layout_form_content layoutH="58" id="permissionFormContent">
	<@dwz.fieldset title="自定义授权">
		<@dwz.label_input content="名称：">
			<input type="text" name="name" class="required" size="32" maxlength="32" value="${module.name }" alt="请输入模块名称" readOnly=readOnly/>
		</@dwz.label_input>	
		<@dwz.label_input content="优先级：">
			<input type="text" name="priority" class="required digits" size="2" maxlength="2" value="${module.priority }" readOnly=readOnly/>
			<@dwz.span_comment content="&nbsp;&nbsp;默认:99"/>
		</@dwz.label_input>					
		<@dwz.label_input content="URL：">
			<input type="text" name="url" class="required" size="32" maxlength="255" alt="请输入访问地址" value="${module.url }" readOnly=readOnly/>
		</@dwz.label_input>			
		<@dwz.label_input content="授权名称：">
			<input type="text" name="sn" class="required" size="32" maxlength="32" alt="授权名称" value="${module.sn }" readOnly=readOnly/>
		</@dwz.label_input>	
		<@dwz.label_input content="描述：">
			<input type="text" name="description" size="32" maxlength="255" alt="描述" value="${module.description!'' }" readOnly=readOnly/>
		</@dwz.label_input>	
	</@dwz.fieldset>			
	<@dwz.fieldset title="自定义授权">
		<#list module.permissions as p>
		<@dwz.fieldset title="${p_index + 1}.${p.name }">
			<@dwz.label_input content="名称：">
				<input type="text" name="name" class="required" size="32" maxlength="32" value="${p.name }" alt="请输入模块名称" readOnly=readOnly/>
			</@dwz.label_input>	
			<@dwz.label_input content="短名：">
				<input type="text" name="priority" class="required digits" size="32" value="${p.shortName }" readOnly=readOnly/>
			</@dwz.label_input>						
			<@dwz.label_input content="描述：">
				<input type="text" name="description" size="32" maxlength="255" alt="描述" value="${p.description!'' }" readOnly=readOnly/>
			</@dwz.label_input>	
		</@dwz.fieldset>			
		</#list>
	</@dwz.fieldset>
	</@dwz.layout_form_content>
	<@dwz.form_bar closeTitle="关闭"/>	
</@dwz.layout_content>