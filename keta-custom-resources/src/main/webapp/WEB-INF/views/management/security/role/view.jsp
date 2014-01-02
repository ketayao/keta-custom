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
	
	explandBuilder.append("<td><span class=\"button chk checkbox_false_full setAll\"/>" + module.getName() + "</td>\n");
	explandBuilder.append("<td>\n");
	
	for(Permission permission : module.getPermissions()) {
		boolean isFind = false;
		for(RolePermission rolePermission : role.getRolePermissions()) {
			if (rolePermission.getPermission().getId().equals(permission.getId())) {
				explandBuilder.append("<span class=\"pmn\">" + permission.getName() + "</span><span class=\"button chk checkbox_true_full pmnc\"/>");
				isFind = true;
				break;
			}
		}
		
		if (isFind == false) {
			explandBuilder.append("<span class=\"pmn\">" + permission.getName() + "</span><span class=\"button chk checkbox_false_full pmnc\"/>");
		}
		moduleIndex[0] = moduleIndex[0] + 1;
	}
	
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
	//初始化treeTable
	var option = {
	        theme:'default',
	        expandLevel : 3
    };
    $('.treeTable').treeTable(option);
	
	// 初始化全选状态
	$(".setAll").each(function(){
    	var $td = $(this).parent().nextAll("td");
		var notPickLength = $("span[class*=checkbox_false_full]", $td).length;
		if (notPickLength == 0) {
			$(this).attr("class", "button chk checkbox_true_full setAll");
		}
	});
});

//-->
</script>
<div class="pageContent">
<form action="#">
	<div class="pageFormContent" layoutH="56">
	<dl>
		<dt>名称：</dt>
		<dd>
			<input type="text" name="name" class="input-medium required" value="${role.name }" readonly="readonly"/>
		</dd>
	</dl>
	<dl>
		<dt>名称：</dt>
		<dd>
			<input type="text" name="description" class="input-medium" value="${role.description }" readonly="readonly"/>
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
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>