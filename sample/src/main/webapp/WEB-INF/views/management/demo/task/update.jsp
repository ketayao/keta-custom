<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>  
<div class="pageContent">
<form method="post" action="${contextPath }/management/demo/task/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="id" value="${task.id}"/>
	<div class="pageFormContent" layoutH="58">
	<p>
		<label>标题：</label>
		<input type="text" name="title" maxlength="64" value="${task.title}" class="input-medium required validate[required]"/>
	</p>
	<p>
		<label>内容：</label>
		<input type="text" name="content" maxlength="256" value="${task.content}" class="input-medium"/>
	</p>
	<p>
		<label>等级：</label>
		<dwz:dic themeName="等级" paramName="level" className="required validate[required]" selectedValue="${task.level }">
			<option value="">--请选择等级--</option>
		</dwz:dic>		
	</p>
	<p>
		<label>创建时间：</label>
		<input type="text" name="createTime" class="input-medium date" readonly="readonly" style="float:left;" value="<fmt:formatDate value="${task.createTime}" pattern="yyyy-MM-dd"/>"/>
		<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
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