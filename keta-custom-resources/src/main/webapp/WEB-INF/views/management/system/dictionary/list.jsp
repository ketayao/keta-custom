<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
function jumpDictionary() {
	var tabid = navTab.getCurrentNavTab().attr("tabid");
	navTab.reloadFlag(tabid);
}

function back() {
	var url = "${contextPath }/management/system/dictionary/list";
	navTab.getCurrentNavTab().attr("url", url);
	navTab.reload(url);
}
//-->
</script>
<dwz:paginationForm action="${contextPath }/management/system/dictionary/list?id=${pDictionary.id }" page="${page }">
	<input type="hidden" name="search_LIKE_name" value="${param['search_LIKE_name']}"/>
</dwz:paginationForm>

<form method="post" action="${contextPath }/management/system/dictionary/list?id=${pDictionary.id}" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
				<c:choose>
					<c:when test="${dictionaryType == 'THEME' }">
						<label>主题名称：</label>
					</c:when>
					<c:otherwise>
						<label>词条名称：</label>
					</c:otherwise>
				</c:choose>			
				<input type="text" name="search_LIKE_name" value="${param['search_LIKE_name']}"/>	
				</li>
			</ul>
			<div class="subBar">
				<ul>						
					<li><div class="button"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
					<c:if test="${dictionaryType == 'ITEM' }">
					<li><div class="button"><div class="buttonContent"><button type="button" onclick="back();">返回</button></div></div></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</form>

<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<c:choose>
				<c:when test="${dictionaryType == 'THEME' }">
			<shiro:hasPermission name="Dictionary:save">
				<li><a iconClass="book_add" target="dialog" mask="true" width="530" height="250" rel="Dictionary_save" href="${contextPath }/management/system/dictionary/create"><span>添加字典主题</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Dictionary:edit">
				<li><a iconClass="book_edit" target="dialog" mask="true" width="530" height="250" rel="Dictionary_edit" href="${contextPath }/management/system/dictionary/update/{slt_uid}"><span>编辑字典主题</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Dictionary:delete">
				<li><a iconClass="book_delete" target="selectedTodo" rel="ids" href="${contextPath }/management/system/dictionary/delete" title="确认要删除选定数据字典主题?"><span>删除数据字典主题</span></a></li>
			</shiro:hasPermission>
				</c:when>
				<c:otherwise>
			<shiro:hasPermission name="Dictionary:save">
				<li><a iconClass="page_add" target="dialog" mask="true" width="530" height="250" rel="Dictionary_save" href="${contextPath }/management/system/dictionary/create?pid=${pDictionary.id}"><span>添加字典词条</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Dictionary:edit">
				<li><a iconClass="page_edit" target="dialog" mask="true" width="530" height="250" rel="Dictionary_edit" href="${contextPath }/management/system/dictionary/update/{slt_uid}"><span>编辑字典词条</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Dictionary:delete">
				<li><a iconClass="page_delete" target="selectedTodo" rel="ids" href="${contextPath }/management/system/dictionary/delete" title="确认要删除选定数据字典词条?"><span>删除数据字典词条</span></a></li>
			</shiro:hasPermission>
				</c:otherwise>
			</c:choose>		
		</ul>
	</div>
	
	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="200">名称</th>
				<th width="50" orderField="priority" class="${page.orderField eq 'priority' ? page.orderDirection : ''}">序号</th>
				<c:choose>
					<c:when test="${dictionaryType == 'THEME' }">
				<th>描述</th>
				<th width="30">操作</th>
					</c:when>
					<c:otherwise>
				<th>内容</th>
				<th width="200">字典主题</th>
					</c:otherwise>
				</c:choose>	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${dictionarys}">
			<tr target="slt_uid" rel="${item.id}">
				<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.name}</td>
				<td>${item.priority}</td>
				<td>${item.value}</td>
				<c:choose>
					<c:when test="${dictionaryType == 'THEME' }">
				<td><a iconClass="book_open" href="${contextPath}/management/system/dictionary/list?id=${item.id}" target="navTab" onclick="jumpDictionary();" title="进入词条">进入词条</a></td>
					</c:when>
					<c:otherwise>
				<td>${pDictionary.name }</td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }"/>
</div>