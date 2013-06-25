<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<a id="refreshJbsxBox2moduleTree" rel="jbsxBox2moduleTree" target="ajax" href="${contextPath}/management/security/module/tree" style="display:none;"></a>
<keta:paginationForm action="${contextPath}/management/security/module/list/${parentModuleId}" page="${page }" onsubmit="return divSearch(this, 'jbsxBox2moduleList');">
	<input type="hidden" name="keywords" value="${keywords}"/>
</keta:paginationForm>

<form method="post" action="${contextPath }/management/security/module/list/${parentModuleId}" onsubmit="return divSearch(this, 'jbsxBox2moduleList');">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>模块名称：</label>
					<input type="text" name="keywords" value="${keywords}"/>
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
		<shiro:hasPermission name="Module:view">
			<li><a class="magnifier" target="dialog" width="530" height="500" mask="true" href="${contextPath }/management/security/module/view/{slt_uid}" title="查看模块"><span>查看模块</span></a></li>
		</shiro:hasPermission>		
		<shiro:hasPermission name="Module:save">
			<li><a class="application_add" target="dialog" width="530" height="500" mask="true" href="${contextPath }/management/security/module/create/${parentModuleId}" title="添加模块"><span>添加模块</span></a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="Module:edit">
			<li><a class="application_edit" target="dialog" rel="lookupParent2module_edit" width="530" height="500" mask="true" href="${contextPath }/management/security/module/update/{slt_uid}" title="编辑模块"><span>编辑模块</span></a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="Module:delete">
			<li><a class="application_delete" target="ajaxTodo" callback="dialogReloadRel2Module" href="${contextPath }/management/security/module/delete/{slt_uid}" title="确认要删除该模块?"><span>删除模块</span></a></li>
		</shiro:hasPermission>
		</ul>
	</div>
	<table class="table" layoutH="142" width="100%" rel="jbsxBox2moduleList" >
		<thead>
			<tr>
				<th width="150">名称</th>
				<th width="60" orderField="priority" class="${page.orderField eq 'priority' ? page.orderDirection : ''}">优先级</th>
				<th width="150">授权名称</th>
				<th width="150">父模块</th>
				<th>模块地址</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${modules}">
			<tr target="slt_uid" rel="${item.id}">
				<td><a href="${contextPath}/management/security/module/list/${item.id}" target="ajax" rel="jbsxBox2moduleList">${item.name}</a></td>
				<td>${item.priority}</td>
				<td>${item.sn}</td>
				<td>${item.parent.name}</td>
				<td>${item.url}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 分页 -->
	<keta:pagination page="${page }" rel="jbsxBox2moduleList" onchange="navTabPageBreak({numPerPage:this.value}, 'jbsxBox2moduleList')"/>
</div>