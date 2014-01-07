<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
	function close2upload() {
		navTab.reload('${contextPath }/management/system/icon/list', {});
		return true;
	}
//-->
</script>
<dwz:paginationForm action="${contextPath }/management/system/icon/list" page="${page }">
</dwz:paginationForm>

<form method="post" action="${contextPath }/management/system/icon/reload" onsubmit="return navTabSearch(this)">
<div class="pageHeader">
	<div class="searchBar">
		<h1 style="line-height: 30px;color: red;">
		用法：在&lt;a&gt;标签中加入iconClass="图标名字（不包含后缀）"。
		示例：&lt;a iconClass="accept" href="#" title="accept"&gt;accept&lt;/a&gt;。
		</h1>
		<div class="subBar">
			<ul>						
				<li><div class="button"><div class="buttonContent"><button type="submit">重新加载图标</button></div></div></li>
			</ul>
		</div>
	</div>
</div>
</form>

<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">	
		<shiro:hasPermission name="Icon:upload">
			<li><a iconClass="image_add" target="dialog" mask="true" width="430" height="300" close="close2upload" href="${contextPath }/management/system/icon/upload"><span>上传图标</span></a></li>
		</shiro:hasPermission>
		</ul>
	</div>
	<table class="table" layoutH="142" width="100%">
		<thead>
			<tr>
				<th width="80">图标</th>
				<th>引用名称</th>
				<th width="30">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${icons}">
			<tr>
				<td><a iconClass="${item }" href="#" title="${item }">${item}</a></td>
				<td>${item}</td>
				<td>
					<shiro:hasPermission name="Icon:delete">
					<a iconClass="image_delete" target="ajaxTodo" href="${contextPath }/management/system/icon/delete?name=${item}" title="确认要删除该图标?">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>	
	<!-- 分页 -->
	<dwz:pagination page="${page }"/>
</div>