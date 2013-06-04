<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<fieldset>
		<legend>模块信息</legend>	
		<p>
			<label>名称：</label>
			<input type="text" name="name" class="required" size="32" maxlength="32" value="${module.name }" alt="请输入模块名称" readOnly=readOnly/>
		</p>	
		<p>
			<label>优先级：</label>
			<input type="text" name="priority" class="required digits" size="2" maxlength="2" value="${module.priority }" readOnly=readOnly/>
			<span class="info">&nbsp;&nbsp;默认:99</span>
		</p>		
		<p>
			<label>URL：</label>
			<input type="text" name="url" class="required" size="32" maxlength="255" alt="请输入访问地址" value="${module.url }" readOnly=readOnly/>
		</p>		
		<p>
			<label>授权名称：</label>
			<input type="text" name="sn" class="required" size="32" maxlength="32" alt="授权名称" value="${module.sn }" readOnly=readOnly/>
		</p>		
		<p>
			<label>描述：</label>
			<input type="text" name="description" size="32" maxlength="255" alt="描述" value="${module.description }" readOnly=readOnly/>
		</p>		
		</fieldset>
		<fieldset>
		<legend>自定义授权</legend>
			<c:forEach var="p" items="${module.permissions }" varStatus="s">
				<fieldset>
				<legend>${s.count }.${p.name }</legend>
					<p>
						<label>名称：</label>
						<input type="text" name="_name" class="required" size="32" maxlength="32" alt="请输入模块名称" value="${p.name }" readOnly=readOnly/>
					</p>
					<p>
						<label>短名：</label>
						<input type="text" name="_shortName" class="required" size="16" maxlength="16" alt="请输入短名" value="${p.shortName }" readOnly=readOnly/>
						<span class="info">&nbsp;&nbsp;用作授权验证</span>
					</p>
					<p>
						<label>描述：</label>
						<input type="text" name="_description" size="32" maxlength="255" alt="描述" value="${p.description }" readOnly=readOnly/>
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