<@dwz.pagerForm action="${request.contextPath}/management/security/module/list/${parentModuleId}" page=page onsubmit="return divSearch(this, 'jbsxBox2module');">
	<input type="hidden" name="keywords" value="${keywords!''}"/>
</@dwz.pagerForm>

<@dwz.search_form action="${request.contextPath}/management/security/module/list/${parentModuleId}" onsubmit="return divSearch(this, 'jbsxBox2module');">
	<@dwz.label_input2 content="模块名称：">
		<input type="text" name="keywords" value="${keywords!''}"/>
	</@dwz.label_input2>
</@dwz.search_form>

<@dwz.layout_content>
	<@dwz.tool_bar>
		<@shiro.hasPermission name="Module:view">
			<@dwz.tool_button content="查看模块" class="magnifier" width="530" height="500" href="${request.contextPath}/management/security/module/view/{slt_uid}"/>
		</@shiro.hasPermission>	
		<@shiro.hasPermission name="Module:save">
			<@dwz.tool_button content="添加模块" class="application_add" width="530" height="500" href="${request.contextPath}/management/security/module/create/${parentModuleId}"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="Module:edit">
			<@dwz.tool_button content="编辑模块" class="application_edit" width="530" height="500" href="${request.contextPath}/management/security/module/update/{slt_uid}"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="Module:delete">
			<@dwz.tool_button content="删除模块" class="application_delete" target="ajaxTodo" callback="reloadRel" href="${request.contextPath}/management/security/module/delete/{slt_uid}" title="确认要删除该模块?"/>
		</@shiro.hasPermission>
	</@dwz.tool_bar>
	
	<@dwz.table_common layoutH="142" rel="jbsxBox2module">
		<thead>
			<tr>
				<th width="150">名称</th>
				<th width="60" orderField="priority" class="${(page.orderField=='priority')?string(page.orderDirection,'')}">优先级</th>
				<th width="150">授权名称</th>
				<th width="150">父模块</th>
				<th>模块地址</th>
			</tr>
		</thead>
		<tbody>
			<#list modules as item>
			<tr target="slt_uid" rel="${item.id}">
				<td><a href="${request.contextPath}/management/security/module/list/${item.id}" target="ajax" rel="jbsxBox2module">${item.name}</a></td>
				<td>${item.priority}</td>
				<td>${item.sn}</td>
				<td>${item.parent.name}</td>
				<td>${item.url}</td>
			</tr>
			</#list>
		</tbody>
	</@dwz.table_common>
	<!-- 分页 -->
	<@dwz.pagerBar page=page rel="jbsxBox2module" onchange="navTabPageBreak({numPerPage:this.value}, 'jbsxBox2module')"/>
</@dwz.layout_content>