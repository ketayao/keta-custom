<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<div class="pageContent">
<form action="#">
	<div class="pageFormContent" layoutH="58">
	<p>
		<label>名称：</label>
		<input type="text" name="name" size="32" maxlength="32" alt="请输入名称" class="required validate[required]" value="${dataControl.name }" readonly="readonly"/>
	</p>	
	<p class="nowrap">
		<label>条件：</label>
		<textarea name="control" cols="29" rows="3" maxlength="255" class="required validate[required]" readonly="readonly">${dataControl.control }</textarea>
	</p>	
	<p class="nowrap">
		<label>描述：</label>
		<textarea name="description" cols="29" rows="3" maxlength="255" readonly="readonly">${dataControl.description }</textarea>
	</p>	
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>