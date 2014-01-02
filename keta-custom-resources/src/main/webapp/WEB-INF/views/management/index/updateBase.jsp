<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageContent">
<form method="post" action="${contextPath }/management/index/updateBase" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<div class="pageFormContent" layoutH="58">
		<p>
			<label>登录账号：</label>
			<input type="text" name="username" class="input-medium readonly" readonly="readonly" value="${login_user.username }"/>
		</p>
		<p>
			<label>真是姓名：</label>
			<input type="text" name="realname" class="input-medium readonly" readonly="readonly" value="${login_user.realname }"/>
		</p>
		<p>
			<label>电话：</label>
			<input type="text" name="phone" class="input-medium validate[custom[phone],maxSize[32]]" maxlength="32" value="${login_user.phone }"/>
		</p>
		<p>
			<label>用户邮箱：</label>
			<input type="text" name="email" class="input-medium validate[custom[email],maxSize[128]]" maxlength="128" value="${login_user.email }"/>
		</p>	
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>