<%@page import="com.ketayao.ketacustom.entity.main.RolePermission"%>
<%@page import="com.ketayao.ketacustom.entity.main.Permission"%>
<%@page import="com.ketayao.ketacustom.entity.main.Module"%>
<%@page import="com.ketayao.ketacustom.entity.main.Role"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
public String role_tree(Module module, Role role, Integer[] moduleIndex) {
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
		explandBuilder.append(permission.getName() + "<input type='checkbox' name='rolePermissions[" +  moduleIndex[0] + "].permission.id' value='" + permission.getId() + "' ");
		boolean isFind = false;
		for(RolePermission rolePermission : role.getRolePermissions()) {
			if (rolePermission.getPermission().getId().equals(permission.getId())) {
				explandBuilder.append("checked='checked'/>");
				explandBuilder.append("<input type='hidden' name='rolePermissions[" + moduleIndex[0] + "].id' value='" + rolePermission.getId() + "'/>");
				isFind = true;
				break;
			}
		}
		
		if (isFind == false) {
			explandBuilder.append("/>");
		}
		moduleIndex[0] = moduleIndex[0] + 1;
	}
	explandBuilder.append("</span>\n");
	
	explandBuilder.append("</td>\n");
	explandBuilder.append("</tr>\n");

	for(Module o : module.getChildren()) {
		explandBuilder.append(role_tree(o, role, moduleIndex));				
	}
	
	return explandBuilder.toString();
}
%>
<%
	Module module2 = (Module)request.getAttribute("module");
	Role role2 = (Role)request.getAttribute("role");
	String uPermissonTree = role_tree(module2, role2, new Integer[]{0});
%>
<script type="text/javascript">
<!--
// top
$(document).ready(function(){
	initRolePage();
	
	// 初始化全选状态
	$(".setAll").each(function(){
    	var $td = $(this).parent().nextAll("td");
		var $inputSpan = $(".inputValueRole", $td);
		var allCheckBoxLength = $("input[type=checkbox]", $inputSpan).length;
		var checkedLength = $("input:checked", $inputSpan).length; 
		if (allCheckBoxLength == checkedLength) {
			$(this).attr("class", "button chk checkbox_true_full setAll");
		}
	});
});
//-->
</script>
<div class="pageContent">
<form method="post" action="${contextPath }/management/security/role/update" class="required-validate pageForm" onsubmit="return validateCallback(this, navTabReloadParent);">
	<input type="hidden" name="id" value="${role.id }">
	<div class="pageFormContent" layoutH="56">
	<dl>
		<dt>角色名称：</dt>
		<dd>
			<input type="text" name="name" class="input-medium validate[required,maxSize[64] required" maxlength="64" value="${role.name }"/>
		</dd>
	</dl>
	<dl>
		<dt>描述：</dt>
		<dd>
			<input type="text" name="description" class="input-medium validate[maxSize[256]" maxlength="256" value="${role.description }"/>
		</dd>
	</dl>	
	<div class="divider"></div>
		<table class="treeTable list" width="100%">
		    <tr>
		        <td>模块名称</td>
		        <td width="70%">操作权限</td>
		    </tr>
			<%=uPermissonTree %>
		</table>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>