<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>    
<div class="pageContent">
<form action="#">
	<div class="pageFormContent" layoutH="58">
	<p>
		<label>任务名称：</label>
		<input type="text" name="name" class="required" size="32" maxlength="32" readOnly=readOnly value="${task.title}"/>
	</p>
	<p>
		<label>描述：</label>
		<textarea name="description" cols="28" rows="3" maxlength="255" readOnly=readOnly>${task.description}</textarea>
	</p>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>