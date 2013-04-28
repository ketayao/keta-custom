<@dwz.pagerForm action="${request.contextPath}/management/security/organization/list/${parentOrganizationId}" page=page onsubmit="return divSearch(this, 'jbsxBox2organization');">
	<input type="hidden" name="keywords" value="${keywords!''}"/>
</@dwz.pagerForm>

<@dwz.search_form action="${request.contextPath}/management/security/organization/list/${parentOrganizationId}" onsubmit="return divSearch(this, 'jbsxBox2organization');">
	<@dwz.label_input2 content="模块名称：">
		<input type="text" name="keywords" value="${keywords!''}"/>
	</@dwz.label_input2>
</@dwz.search_form>

<@dwz.layout_content>
	<@dwz.tool_bar>
		<@shiro.hasPermission name="Organization:save">
			<@dwz.tool_button content="添加组织" class="group_add" width="530" height="250" href="${request.contextPath}/management/security/organization/create/${parentOrganizationId}"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="Organization:edit">
			<@dwz.tool_button content="编辑组织" class="group_edit" width="530" height="250" href="${request.contextPath}/management/security/organization/update/{slt_uid}"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="Organization:delete">
			<@dwz.tool_button content="删除组织" class="group_delete" target="ajaxTodo" callback="reloadRel" href="${request.contextPath}/management/security/organization/delete/{slt_uid}" title="确认要删除该模块?"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="Organization:assign">
			<@dwz.tool_line/>
			<@dwz.tool_button content="分配角色" class="shield_add" href="${request.contextPath}/management/security/organization/lookup2create/organizationRole/{slt_uid}" width="400" height="500" title="分配角色"/>
			<@dwz.tool_button content="撤销角色" class="shield_delete" href="${request.contextPath}/management/security/organization/lookup2delete/organizationRole/{slt_uid}" width="400" height="500" title="删除已分配角色"/>
		</@shiro.hasPermission>		
	</@dwz.tool_bar>
	
	<@dwz.table_common layoutH="142" rel="jbsxBox2organization">
		<thead>
			<tr>
				<th width="150">名称</th>
				<th width="200">拥有角色</th>
				<th>描述</th>
				<th width="150">父组织</th>
			</tr>
		</thead>
		<tbody>
			<#list organizations as item>
			<tr target="slt_uid" rel="${item.id}">
				<td><a href="${request.contextPath}/management/security/organization/list/${item.id}" target="ajax" rel="jbsxBox2organization">${item.name}</a></td>
				<td>
					<#list item.organizationRoles as or>
						${or.role.name}&nbsp;&nbsp;
					</#list>
				</td>
				<td>${item.description!''}</td>
				<td>${item.parent.name}</td>
			</tr>			
			</#list>
		</tbody>
	</@dwz.table_common>
	<!-- 分页 -->
	<@dwz.pagerBar page=page rel="jbsxBox2organization" onchange="navTabPageBreak({numPerPage:this.value}, 'jbsxBox2organization')"/>
</@dwz.layout_content>