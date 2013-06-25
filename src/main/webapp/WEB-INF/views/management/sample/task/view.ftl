<@dwz.layout_content>
<@dwz.form action="#">
	<input type="hidden" name="id" value="${task.id}"/>
	<@dwz.layout_form_content layoutH="58">
		<@dwz.label_input content="任务名称:">
			<input type="text" name="name" class="required" size="20" maxlength="32" readOnly=readOnly value="${task.title}"/>
		</@dwz.label_input>	
		<@dwz.label_input content="描述：">
			<textarea name="description" cols="28" rows="3" maxlength="255" readOnly=readOnly>${task.desciption!''}</textarea>
		</@dwz.label_input>
	</@dwz.layout_form_content>
			
	<@dwz.form_bar closeTitle="关闭"/>	
</@dwz.form>
</@dwz.layout_content>