<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>   
<div class="pageContent">
<form method="post" action="${contextPath }/management/system/dictionary/create" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<c:choose>
		<c:when test="${param.pid != null}">
			<input type="hidden" name="type" value="ITEM"/>
			<input type="hidden" name="parent.id" value="${param.pid }"/>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="type" value="THEME"/>
		</c:otherwise>
	</c:choose>	
	
	<div class="pageFormContent" layoutH="58">
	<p>
		<label>名称：</label>
		<input type="text" name="name" maxlength="64" class="input-medium required validate[required]"/>
	</p>	
	<p>
		<label>序号：</label>
		<input type="text" name="priority" maxlength="3" class="input-medium required validate[required]" value="999"/>
	</p>
	<c:choose>
		<c:when test="${param.pid != null }">
	<p class="nowrap">
		<label>内容：</label>
		<textarea name="value" rows="3" maxlength="256" class="input-medium textarea-scroll required validate[required]"></textarea>
	</p>
		</c:when>
		<c:otherwise>
	<p class="nowrap">
		<label>描述：</label>
		<textarea name="value" rows="3" maxlength="256" class="input-medium textarea-scroll"></textarea>
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