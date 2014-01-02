<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<a id="refreshJbsxBox2organizationTree" rel="jbsxBox2organizationTree" target="ajax" href="${contextPath}/management/security/organization/tree" style="display:none;"></a>
<dwz:paginationForm action="${contextPath}/management/security/organization/list/${parentOrganizationId}" page="${page }" onsubmit="return divSearch(this, 'jbsxBox2organizationList');">
	<input type="hidden" name=search_LIKE_name value="${param.search_LIKE_name }"/>
</dwz:paginationForm>

<form method="post" action="${contextPath }/management/security/organization/list/${parentOrganizationId}" onsubmit="return divSearch(this, 'jbsxBox2organizationList');">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>组织名称：</label>
					<input type="text" name=search_LIKE_name value="${param.search_LIKE_name }"/>
				</li>
			</ul>
			<div class="subBar">
				<ul>						
					<li><div class="button"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
				</ul>
			</div>
		</div>
	</div>
</form>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		<shiro:hasPermission name="Organization:save">
			<li><a iconClass="group_add" target="dialog" mask="true" width="530" height="260" href="${contextPath}/management/security/organization/create/${parentOrganizationId}"><span>添加组织</span></a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="Organization:edit">
			<li><a iconClass="group_edit" target="dialog" mask="true" rel="lookupParent2org_edit" width="530" height="260" href="${contextPath}/management/security/organization/update/{slt_uid}"><span>编辑组织</span></a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="Organization:delete">
			<li><a iconClass="group_delete" target="ajaxTodo" callback="dialogReloadRel2Org" href="${contextPath}/management/security/organization/delete/{slt_uid}" title="确认要删除该组织?"><span>删除组织</span></a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="Organization:assign">
			<li class="line">line</li>
			<li><a iconClass="shield_add" target="dialog" mask="true" width="400" height="500" href="${contextPath}/management/security/organization/lookup2create/organizationRole/{slt_uid}"><span>分配角色</span></a></li>
			<li><a iconClass="shield_delete" target="dialog" mask="true" width="400" height="500" href="${contextPath}/management/security/organization/lookup2delete/organizationRole/{slt_uid}"><span>撤销角色</span></a></li>
		</shiro:hasPermission>		
		</ul>
	</div>
	<table class="table" layoutH="142" width="100%" rel="jbsxBox2organizationList" >
		<thead>
			<tr>
				<th width="150">名称</th>
				<th width="200">拥有角色</th>
				<th width="60">优先级</th>
				<th>描述</th>
				<th width="150">父组织</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${organizations}">
			<tr target="slt_uid" rel="${item.id}">
				<td><a href="${contextPath}/management/security/organization/list/${item.id}" target="ajax" rel="jbsxBox2organizationList">${item.name}</a></td>
				<td>
					<c:forEach var="oRole" items="${item.organizationRoles }">
						${oRole.role.name}&nbsp;&nbsp;
					</c:forEach>
				</td>
				<td>${item.priority}</td>
				<td>${item.description}</td>
				<td>${item.parent.name}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 分页 -->
	<dwz:pagination page="${page }" rel="jbsxBox2organizationList" onchange="navTabPageBreak({numPerPage:this.value}, 'jbsxBox2organizationList')"/>
</div>