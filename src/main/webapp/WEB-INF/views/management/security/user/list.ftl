<@dwz.pagerForm action="${request.contextPath}/management/security/user/list" page=page>
	<input type="hidden" name="keywords" value="${keywords!''}"/>
</@dwz.pagerForm>

<@dwz.search_form action="${request.contextPath}/management/security/user/list">
	<@dwz.label_input2 content="登录名称：">
		<input type="text" name="keywords" value="${keywords!''}"/>
	</@dwz.label_input2>
</@dwz.search_form>

<@dwz.layout_content>
	<@dwz.tool_bar>
		<@shiro.hasPermission name="User:save">
			<@dwz.tool_button content="添加用户" class="user_add" rel="lookup2organization_add" width="530" height="330" href="${request.contextPath}/management/security/user/create"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="User:edit">
			<@dwz.tool_button content="编辑用户" class="user_edit" rel="lookup2organization_edit" width="530" height="330" href="${request.contextPath}/management/security/user/update/{slt_uid}"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="User:delete">
			<@dwz.tool_button content="删除用户" class="user_delete" target="ajaxTodo" href="${request.contextPath}/management/security/user/delete/{slt_uid}" title="确认要删除该用户?"/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="User:reset">
			<@dwz.tool_line/>
			<@dwz.tool_button content="重置密码" class="arrow_refresh" target="ajaxTodo" href="${request.contextPath}/management/security/user/reset/password/{slt_uid}" title="确认重置密码为123456?"/>
			<@dwz.tool_button content="更新状态" class="user_go" target="ajaxTodo" href="${request.contextPath}/management/security/user/reset/status/{slt_uid}" title="确认更新状态"/>
			<@dwz.tool_line/>
		</@shiro.hasPermission>
		<@shiro.hasPermission name="User:assign">
			<@dwz.tool_button content="分配角色" class="shield_add" href="${request.contextPath}/management/security/user/lookup2create/userRole/{slt_uid}" width="400" height="500" title="分配角色"/>
			<@dwz.tool_button content="撤销角色" class="shield_delete" href="${request.contextPath}/management/security/user/lookup2delete/userRole/{slt_uid}" width="400" height="500" title="撤销角色"/>
		</@shiro.hasPermission>
	</@dwz.tool_bar>
	
	<@dwz.table_common layoutH="138">
		<thead>
			<tr>
				<th width="100">登录名称</th>
				<th width="100">真实名字</th>
				<th width="200">邮箱地址</th>
				<th width="100">电话</th>
				<th width="150" orderField=organization.name class="${(page.orderField=='organization.name')?string(page.orderDirection,'')}">所在组织</th>
				<th width="150" >角色</th>
				<th width="100" orderField="status" class="${(page.orderField=='status')?string(page.orderDirection,'')}">账户状态</th>
				<th orderField="createTime" class="${(page.orderField=='createTime')?string(page.orderDirection,'')}">创建时间</th>
			</tr>
		</thead>
		<tbody>
			<#list users as item>
			<tr target="slt_uid" rel="${item.id}">
				<td>${item.username}</td>
				<td>${item.realname}</td>
				<td>${item.email!''}</td>
				<td>${item.phone!''}</td>
				<td>${item.organization.name}</td>
				<td>
					<#list item.userRoles as ur>
						${ur.role.name }&nbsp;&nbsp;
					</#list>
				</td>
				<td>${(item.status == "enabled")?string("可用","不可用")}</td>
				<td>${item.createTime}</td>
			</tr>			
			</#list>
		</tbody>
	</@dwz.table_common>
	<!-- 分页 -->
	<@dwz.pagerBar page=page/>
</@dwz.layout_content>
