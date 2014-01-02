<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<a id="refreshJbsxBox2organizationTree" rel="jbsxBox2organizationTree" target="ajax" href="${request.contextPath}/management/security/organization/tree" style="display:none;"></a>
<div class="pageContent">
<form method="post" action="${contextPath }/management/security/organization/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadRel2Org);">
	<input type="hidden" name="id" value="${organization.id }"/>
	<input type="hidden" name="parent.id" value="${organization.parent.id }"/>
	<div class="pageFormContent" layoutH="58">
		<p>
			<label>父组织：</label>
			<input name="parent.id" value="${organization.parent.id }" type="hidden"/>
			<input class="validate[required] required" name="parent.name" type="text" readonly="readonly" value="${organization.parent.name }" style="width: 140px;"/>
			<a class="btnLook" href="${contextPath}/management/security/organization/lookupParent/${organization.id}" lookupGroup="parent" mask="true" title="更改父组织" width="400">查找带回</a>
		</p>
		<p>
			<label>名称：</label>
			<input type="text" name="name" class="input-medium validate[required,maxSize[64]] required" maxlength="64" value="${organization.name }"/>
		</p>	
		<p>
			<label>优先级：</label>
			<input type="text" name="priority" class="validate[required,custom[integer],min[1],max[999]] required" value="${organization.priority }" maxlength="3" style="width: 80px;"/>
			<span class="info">（越小越靠前）</span>
		</p>				
		<p class="nowrap">
			<label>描述：</label>
			<textarea name="description" cols="29" rows="3" maxlength="256" class="input-medium textarea-scroll">${organization.description }</textarea>
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