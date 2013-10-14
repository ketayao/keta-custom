<%@page import="com.ketayao.ketacustom.entity.main.RolePermission"%>
<%@page import="com.ketayao.ketacustom.entity.main.Permission"%>
<%@page import="com.ketayao.ketacustom.entity.main.Module"%>
<%@page import="com.ketayao.ketacustom.entity.main.Role"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
public String role_tree(Module module, Role role, Integer[] moduleIndex) {
	StringBuilder explandBuilder = new StringBuilder("<span class='inputValueRole'>");
	explandBuilder.append("<span class='inputValueRole'>");
	for(Permission permission : module.getPermissions()) {
		explandBuilder.append(permission.getName() + "<input type='checkbox' disabled name='rolePermissions[" +  moduleIndex[0] + "].permission.id' value='" + permission.getId() + "' ");
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
	explandBuilder.append("</span>");
	
	StringBuilder builder = new StringBuilder();	
	long pid = module.getParent() == null ? 0:module.getParent().getId();
	builder.append("{id:" + module.getId() +  ", pId:" + pid + 
			", name:\"" + module.getName() + "\", expland:\"" + explandBuilder.toString() + "\"},");
	
	for(Module o : module.getChildren()) {
		builder.append(role_tree(o, role, moduleIndex));				
	}
	
	return builder.toString();
}
%>
<%
	Module module2 = (Module)request.getAttribute("module");
	Role role2 = (Role)request.getAttribute("role");
	String uPermissonTree = role_tree(module2, role2, new Integer[]{0});
	uPermissonTree = uPermissonTree.substring(0, uPermissonTree.length() - 1);
%>
<style>
<!--
.setAll{
vertical-align:top;margin-right:3px;
}
span.inputValueRole input {
vertical-align:middle;margin-right:15px;
}
-->
</style>

<script type="text/javascript">
<!--
// top

var IDMark_Switch = "_switch",
IDMark_Icon = "_ico",
IDMark_Span = "_span",
IDMark_Input = "_input",
IDMark_Check = "_check",
IDMark_Edit = "_edit",
IDMark_Remove = "_remove",
IDMark_Ul = "_ul",
IDMark_A = "_a";

var setting = {
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	view: {
		addDiyDom: addDiyDom,
		showIcon: false
	}
};

var zNodes =[<%=uPermissonTree %>];

function addDiyDom(treeId, treeNode) {
	var cObj = $("#" + treeNode.tId + IDMark_Switch);
	var cEditStr = '<input type="checkbox" disabled class="setAll"/>';
	cObj.after(cEditStr);

	var aObj = $("#" + treeNode.tId + IDMark_A);
	var aEditStr = treeNode.expland;
	aObj.after(aEditStr);
}

$(document).ready(function(){
	var t = $("#uPermissonTree");
	t = $.fn.zTree.init(t, setting, zNodes);
	t.expandAll(true); 
	
	// 初始化全选状态
	$(".setAll").each(function(){
		var $inputSpan = $(this).nextAll(".inputValueRole");
		var allCheckBoxLength = $("input[type=checkbox]", $inputSpan).length;
		var checkedLength = $("input:checked", $inputSpan).length; 
		if (allCheckBoxLength == checkedLength) {
			$(this).attr("checked", "checked");
		}
	});
});

//-->
</script>
<div class="pageContent">
<form action="#">
	<div class="pageFormContent" layoutH="58">
	<dl>
		<dt>名称：</dt>
		<dd>
			<input type="text" name="name" class="required" size="30" value="${role.name }" readonly="readonly"/>
		</dd>
	</dl>
	<dl>
		<dt>名称：</dt>
		<dd>
			<input type="text" name="description" size="30" value="${role.description }" readonly="readonly"/>
		</dd>
	</dl>	
	<div class="divider"></div>
	<ul id="uPermissonTree" class="ztree"></ul>		
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>