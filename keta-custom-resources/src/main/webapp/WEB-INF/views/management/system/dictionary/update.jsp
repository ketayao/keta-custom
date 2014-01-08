<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageContent">
<form method="post" action="${contextPath }/management/system/dictionary/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="id" value="${dictionary.id}"/>
	<input type="hidden" name="type" value="${dictionary.type}"/>
	<c:if test="${dictionary.type == 'ITEM' }">
	<input type="hidden" name="parent.id" value="${dictionary.parent.id}"/>
	</c:if>
	<div class="pageFormContent" layoutH="58">
	<p>
		<label>名称：</label>
		<input type="text" name="name" maxlength="64" value="${dictionary.name}" class="input-medium required validate[required]"/>
	</p>
	<p>
		<label>序号：</label>
		<input type="text" name="priority" maxlength="10" value="${dictionary.priority}" class="input-medium required validate[required]"/>
	</p>
	<c:choose>
		<c:when test="${dictionary.type == 'ITEM' }">
	<p class="nowrap">
		<label>内容：</label>
		<textarea name="value" rows="3" maxlength="256" class="input-medium textarea-scroll required validate[required]">${dictionary.value}</textarea>
	</p>
		</c:when>
		<c:otherwise>
	<p class="nowrap">
		<label>描述：</label>
		<textarea name="value" rows="3" maxlength="256" class="input-medium textarea-scroll">${dictionary.value}</textarea>
	</p>
		</c:otherwise>
	</c:choose>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>