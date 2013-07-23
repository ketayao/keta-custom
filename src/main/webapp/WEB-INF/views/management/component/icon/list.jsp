<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<form method="post" action="${contextPath }/management/component/icon/reload" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<h1 style="line-height: 30px;color: red;">有${fn:length(iconNames) }个可用的icon图标。用法：在&lt;a&gt;标签中加入iconClass="图标名字（不包含后缀）"。</h1>
			<div class="subBar">
				<ul>						
					<li><div class="button"><div class="buttonContent"><button type="submit">重新加载图标</button></div></div></li>
				</ul>
			</div>
		</div>
	</div>
</form>

<div class="pageContent">	
	<c:forEach var="item" items="${iconNames }" varStatus="st">
		<a iconClass="${item }" href="#" title="${item }">${item }</a>
	</c:forEach>
</div>