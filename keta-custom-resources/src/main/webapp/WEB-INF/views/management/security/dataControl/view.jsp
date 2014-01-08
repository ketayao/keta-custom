<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
	<p>
		<label>名称：</label>
		<input type="text" name="name" class="input-large" value="${dataControl.name }" readonly="readonly"/>
	</p>
	<p class="nowrap">
		<label>条件：</label>
		<textarea name="control" rows="3" maxlength="256" readonly="readonly" class="input-large textarea-scroll">${dataControl.control }</textarea>
	</p>	
	<p class="nowrap">
		<label>描述：</label>
		<textarea name="description" rows="3" maxlength="256" readonly="readonly" class="input-large textarea-scroll">${dataControl.description }</textarea>
	</p>		
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>