<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
	function close2upload() {
		navTab.reload('${contextPath }/management/component/resource/list', {});
		return true;
	}
//-->
</script>
<keta:paginationForm action="${contextPath }/management/component/resource/list" page="${page }">
	<input type="hidden" name="name" value="${name}"/>
</keta:paginationForm>

<form method="post" action="${contextPath }/management/component/resource/list" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>资源名称：</label>
					<input type="text" name="name" value="${name}"/>
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
			<shiro:hasPermission name="Resource:upload">
				<li><a iconClass="page_white_get" target="dialog" mask="true" width="430" height="300" close="close2upload" href="${contextPath }/management/component/resource/upload?storeType=file"><span>上传资源到文件系统</span></a></li>
				<li><a iconClass="server_database" target="dialog" mask="true" width="430" height="300" close="close2upload" href="${contextPath }/management/component/resource/upload?storeType=db"><span>上传资源到数据库</span></a></li>
			</shiro:hasPermission>		
			<shiro:hasPermission name="Resource:edit">
				<li><a iconClass="page_white_edit" target="dialog" mask="true" width="530" height="250" href="${contextPath }/management/component/resource/update/{slt_uid}"><span>编辑资源</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Resource:delete">
				<li><a iconClass="page_white_delete" target="selectedTodo" rel="ids" href="${contextPath }/management/component/resource/delete" title="确认要删除选定资源?"><span>删除资源</span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	
	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th >名称</th>
				<th width="60">文件类型</th>
				<th width="80">长度</th>
				<th width="270">uuid(下载标识)</th>
				<th width="60">存储类型</th>
				<th width="130">上传时间</th>
				<th width="40">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${resources}">
			<tr target="slt_uid" rel="${item.id}">
				<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.name}</td>
				<td>${item.type}</td>
				<td>${item.size}</td>
				<td>${item.uuid}</td>
				<td>${item.storeType}</td>
				<td><fmt:formatDate value="${item.uploadTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<shiro:hasPermission name="Resource:download">
						<a iconClass="page_white_put" target="_blank" href="${contextPath }/management/component/resource/download/${item.storeType }/${item.uuid}" title="下载">下载</a>
					</shiro:hasPermission>
				</td>				
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<keta:pagination page="${page }"/>
</div>