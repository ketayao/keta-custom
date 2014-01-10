<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
	<p>
		<label>标题：</label>
		<span class="unit">${task.title}</span>
	</p>
	<p>
		<label>内容：</label>
		<span class="unit">${task.content}</span>
	</p>
	<p>
		<label>等级：</label>
		<span class="unit">${task.level}</span>
	</p>
	<p>
		<label>创建人：</label>
		<span class="unit">${task.user.realname}</span>
	</p>
	<p>
		<label>创建时间：</label>
		<span class="unit">${task.createTime}</span>
	</p>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>