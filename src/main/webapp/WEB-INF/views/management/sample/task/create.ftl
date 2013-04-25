<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/sample/task/create" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<@dwz.layout_form_content layoutH="58">
		<@dwz.label_input content="任务名称:">
			<input type="text" name="title" class="required" size="20" maxlength="32"/>
		</@dwz.label_input>	
		<@dwz.label_input content="描述：">
			<textarea name="description" cols="28" rows="3" maxlength="255"></textarea>
		</@dwz.label_input>
	</@dwz.layout_form_content>
			
	<@dwz.form_bar submitTitle="确定" closeTitle="关闭"/>	
</@dwz.form>
</@dwz.layout_content>