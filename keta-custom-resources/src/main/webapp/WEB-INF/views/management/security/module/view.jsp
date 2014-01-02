<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<fieldset>
		<legend>模块信息</legend>	
		<p>
			<label>名称：</label>
			<input type="text" name="name" class="input-medium required" value="${module.name }" readOnly=readOnly/>
		</p>	
		<p>
			<label>优先级：</label>
			<input type="text" name="priority" class="required" value="${module.priority }" readOnly=readOnly  style="width: 80px;"/>
			<span class="info">（越小越靠前）</span>
		</p>		
		<p>
			<label>URL：</label>
			<input type="text" name="url" class="input-medium required" value="${module.url }" readOnly=readOnly/>
		</p>		
		<p>
			<label>授权名称：</label>
			<input type="text" name="sn" class="input-medium required" value="${module.sn }" readOnly=readOnly/>
		</p>
		<p class="nowrap">
			<label>描述：</label>
			<textarea name="description" cols="29" rows="3" maxlength="256" class="input-medium textarea-scroll" readOnly=readOnly>${module.description }</textarea>
		</p>				
		</fieldset>
		<fieldset>
		<legend>自定义授权</legend>
			<c:forEach var="p" items="${module.permissions }" varStatus="s">
				<fieldset>
				<legend>${s.count }.${p.name }</legend>
					<p>
						<label>名称：</label>
						<input type="text" name="_name" class="input-medium required" value="${p.name }" readOnly=readOnly/>
					</p>
					<p>
						<label>操作名称：</label>
						<input type="text" name="_sn" class="input-medium required" value="${p.sn }" readOnly=readOnly/>
					</p>
					<p>
						<label>描述：</label>
						<input type="text" name="_description" class="input-medium" value="${p.description }" readOnly=readOnly/>
					</p>
				</fieldset>			
			</c:forEach>		
		</fieldset>
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>