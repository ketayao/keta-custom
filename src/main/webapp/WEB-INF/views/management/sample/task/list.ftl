<@dwz.pagerForm action="${request.contextPath}/management/sample/task/list" page=page>
	<input type="hidden" name="keywords" value="${keywords!''}"/>
</@dwz.pagerForm>

<@dwz.search_form action="${request.contextPath}/management/sample/task/list">
	<@dwz.label_input2 content="任务名称：">
		<input type="text" name="keywords" value="${keywords!''}"/>
	</@dwz.label_input2>
</@dwz.search_form>

<@dwz.layout_content>
	<@dwz.tool_bar>
		<@shiro.hasPermission name="Task:look">
			<@dwz.tool_button content="查看任务" class="magnifier" width="530" height="250" href="${request.contextPath}/management/sample/task/view/{slt_uid}"/>
		</@shiro.hasPermission>		
		<@shiro.hasPermission name="Task:save">
			<@dwz.tool_button content="添加任务" class="add" width="530" height="250" href="${request.contextPath}/management/sample/task/create"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="Task:edit">
			<@dwz.tool_button content="编辑任务" class="edit" width="530" height="250" href="${request.contextPath}/management/sample/task/update/{slt_uid}"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="Task:delete">
			<@dwz.tool_button content="删除任务" class="delete" target="ajaxTodo" href="${request.contextPath}/management/sample/task/delete/{slt_uid}" title="确认要删除该任务?"/>
		</@shiro.hasPermission>
	</@dwz.tool_bar>
	
	<@dwz.table_common layoutH="138">
		<thead>
			<tr>
				<th width="200">任务名称</th>
				<th>描述</th>
			</tr>
		</thead>
		<tbody>
			<#list tasks as item>
			<tr target="slt_uid" rel="${item.id}">
				<td>${item.title}</td>
				<td>${item.description!''}</td>
			</tr>
			</#list>
		</tbody>
	</@dwz.table_common>
	<!-- 分页 -->
	<@dwz.pagerBar page=page/>
</@dwz.layout_content>