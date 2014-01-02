<%@page import="com.ketayao.ketacustom.entity.main.Permission"%>
<%@page import="com.ketayao.ketacustom.entity.main.Module"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<%!
public String role_tree(Module module, Integer[] moduleIndex) {
	StringBuilder explandBuilder = null;
	
	if (module.getParent() != null) {
		explandBuilder = new StringBuilder("<tr id=\"" + module.getId() + "\" pId=\"" + module.getParent().getId() + "\">\n");
	} else {
		explandBuilder = new StringBuilder("<tr id=\"" + module.getId() + "\">\n");
	}
	
	explandBuilder.append("<td><span ref=\"treeChk\" class=\"button chk checkbox_false_full\"/><span ref=\"allChk\" class=\"button chk checkbox_false_full setAll\"/>" + module.getName() + "</td>\n");
	explandBuilder.append("<td>\n");
	
	explandBuilder.append("<span class='inputValueRole'>");
	for(Permission permission : module.getPermissions()) {
		explandBuilder.append(permission.getName() + "<input type='checkbox' name='rolePermissions[" +  moduleIndex[0] + "].permission.id' value='" + permission.getId() + "'/>");
		moduleIndex[0] = moduleIndex[0] + 1;
	}
	explandBuilder.append("</span>\n");
	
	explandBuilder.append("</td>\n");
	explandBuilder.append("</tr>\n");

	for(Module o : module.getChildren()) {
		explandBuilder.append(role_tree(o, moduleIndex));				
	}
	
	return explandBuilder.toString();
}
%>
<%
	Module module2 = (Module)request.getAttribute("module");
	String cPermissonTree = role_tree(module2, new Integer[]{0});
%>
<script type="text/javascript">
<!--
// top
$(document).ready(function(){
	initRolePage();
});
//-->
</script>

<div class="pageContent">
<form method="post" action="${contextPath }/management/security/role/create" class="required-validate pageForm" onsubmit="return validateCallback(this, navTabReloadParent);">
	<div layouth="56" class="pageFormContent">
	<dl>
		<dt>角色名称：</dt>
		<dd>
			<input type="text" name="name" class="input-medium validate[required,maxSize[64] required" maxlength="64"/>
		</dd>
	</dl>
	<dl>
		<dt>描述：</dt>
		<dd>
			<input type="text" name="description" class="input-medium validate[maxSize[256]" maxlength="256"/>
		</dd>
	</dl>	
	<div class="divider"></div>
	<table class="treeTable list" width="100%">
	    <tr>
	        <td>模块名称</td>
	        <td width="70%">操作权限</td>
	    </tr>
		<%=cPermissonTree %>   
	</table>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>