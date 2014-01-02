<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageContent">
<form method="post" action="${contextPath }/management/index/updatePwd" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<div class="pageFormContent" layouth="58">
		<p>
			<label>当前密码：</label>
			<input type="password" name="plainPassword" class="input-small validate[required, maxSize[32]] required" maxlength="32"/>
		</p>	
		<p>
			<label>新密码：</label>
			<input type="password" name="newPassword" id="newPassword" class="input-small validate[required, maxSize[32]] required" maxlength="32"/>
		</p>
		<p>
			<label>确认新密码：</label>
			<input type="password" name="rPassword" class="input-small validate[required,equals[newPassword], maxSize[32]] required" maxlength="32"/>
		</p>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close" >关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>