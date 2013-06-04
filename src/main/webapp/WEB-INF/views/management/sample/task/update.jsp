<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>    
<div class="pageContent">
<form method="post" action="${contextPath }/management/sample/task/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="id" value="${task.id}"/>
	<div class="pageFormContent" layoutH="58">
	<p>
		<label>任务名称：</label>
		<input type="text" name="title" class="required" size="32" maxlength="32" value="${task.title}"/>
	</p>
	<p>
		<label>描述：</label>
		<textarea name="description" cols="28" rows="3" maxlength="255">${task.description}</textarea>
	</p>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>