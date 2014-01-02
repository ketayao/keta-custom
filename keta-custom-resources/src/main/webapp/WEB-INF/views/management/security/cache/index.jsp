<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="Cache:edit">
				<li><a class="delete" target="ajaxTodo" href="${contextPath }/management/security/cache/clear" title="确认要清空缓存?"><span>清空缓存</span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	<table class="list" layoutH="0" width="100%">
		<thead>
			<tr>
				<th>清除系统所有缓存。</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>	
</div>
