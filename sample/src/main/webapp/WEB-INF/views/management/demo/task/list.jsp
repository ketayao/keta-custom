<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>  

<dwz:paginationForm action="${contextPath }/management/demo/task/list" page="${page }">
	<input type="hidden" name="search_LIKE_title" value="${param.search_LIKE_title}"/>
</dwz:paginationForm>

<form method="post" action="${contextPath }/management/demo/task/list" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>标题：</label>
					<input type="text" name="search_LIKE_title" value="${param.search_LIKE_title}"/>			
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
			<shiro:hasRole name="管理员">
				<li><a iconClass="tag_blue" target="dialog" mask="true" width="530" height="250" rel="Task_view" href="${contextPath }/management/demo/task/view/{slt_uid}"><span>查看任务</span></a></li>
			</shiro:hasRole>
			<shiro:hasPermission name="Task:save">
				<li><a iconClass="tag_blue_add" target="dialog" mask="true" width="530" height="250" rel="Task_save" href="${contextPath }/management/demo/task/create"><span>添加任务</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Task:edit:User关联的资源">
				<li><a iconClass="tag_blue_edit" target="dialog" mask="true" width="530" height="250" rel="Task_edit" href="${contextPath }/management/demo/task/update/{slt_uid}"><span>编辑任务</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Task:delete:User关联的资源">
				<li><a iconClass="tag_blue_delete" target="selectedTodo" rel="ids" href="${contextPath }/management/demo/task/delete" title="确认要删除选定任务?"><span>删除任务</span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	
	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>标题</th>
				<th>内容</th>
				<th>等级</th>
				<th>创建人</th>
				<th>创建时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${tasks}">
			<tr target="slt_uid" rel="${item.id}">
				<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.title}</td>
				<td>${item.content}</td>
				<td>${item.level}</td>
				<td>${item.user.realname}</td>
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }"/>
</div>