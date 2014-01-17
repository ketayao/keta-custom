<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<div class="pageContent">
<form method="post" action="${contextPath }/management/security/dataControl/create" class="required-validate pageForm" onsubmit="return validateCallback(this, navTabReloadParent);">
	<div class="pageFormContent" layoutH="56">
	<p>
		<label>名称：</label>
		<input type="text" name="name" maxlength="32" class="input-large required validate[required]"/>
	</p>	
	<p class="nowrap">
		<label>条件：</label>
		<textarea name="control" rows="20" maxlength="10240" class="textarea-scroll required validate[required]" style="width: 800px;"></textarea>
	</p>	
	<p class="nowrap">
		<label>描述：</label>
		<textarea name="description" rows="3" maxlength="256" class="textarea-scroll" style="width: 800px;"></textarea>
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