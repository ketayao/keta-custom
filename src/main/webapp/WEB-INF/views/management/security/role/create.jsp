<%@page import="com.ketayao.ketacustom.entity.main.Permission"%>
<%@page import="com.ketayao.ketacustom.entity.main.Module"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
     
    $(".setAll").click(function(){
    	var isChecked = $(this).is(":checked");
    
		var $inputSpan = $(this).parent("span");
		$("input[type=checkbox]", $inputSpan).each(function(){
			if (isChecked) {
				$(this).attr("checked", "checked");
			} else {
				$(this).removeAttr("checked");
			}
		});
    });
    
});
//-->
</script>
<%! 
	public String role_tree(List<Module> children, String treeStyle, Integer[] moduleIndex) {
		StringBuilder builder = new StringBuilder("");
		if (!children.isEmpty()) {
			builder.append("<ul>");
			for(int index = 0; index < children.size(); index++) {
				Module child = children.get(index);
				if (index + 1 == children.size()) {
					builder.append("<li class=\"last\">");
				} else {
					builder.append("<li>");
				}
				
				builder.append("<div class=\"\">");
				builder.append(treeStyle);
				
				if (child.getChildren().size() > 0 && index != children.size() - 1) {
					treeStyle = treeStyle + "<div class=\"line\"></div>";
					builder.append("<div class=\"collapsable\"></div>");
				} else {
	        		treeStyle = treeStyle + "<div class=\"indent\"></div>";
	        		builder.append("<div class=\"node\"></div>");
				}
				builder.append("<span style=\"float:left;\">");
				builder.append("<a href=\"javascript:void(0);\" class=\"permissionList\">");
				builder.append(child.getName());
				builder.append("</a>");
				builder.append("</span>");
				builder.append("<span class=\"inputValueRole\">");
				
				for(Permission permission : child.getPermissions()) {
					builder.append(permission.getName() + "<input type=\"checkbox\" name=\"rolePermissions[" +  moduleIndex[0] + "].permission.id\" value=\"" + permission.getId() + "\"/>");
					moduleIndex[0] = moduleIndex[0] + 1;
				}
				builder.append("全选<input type=\"checkbox\" class=\"setAll\"/>");
				builder.append("</span>");
				builder.append("</div>");
				
				builder.append(role_tree(child.getChildren(), treeStyle, moduleIndex));
				treeStyle = treeStyle.substring(0, treeStyle.lastIndexOf("<div"));
				builder.append("</li>");
			}
			builder.append("</ul>");			
		}
	
		return builder.toString();
	}
%>
<%
	Module module = (Module)request.getAttribute("module");
%>
<div class="pageContent">
<form method="post" action="${contextPath }/management/security/role/create" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<div class="pageFormContent" layoutH="58">
	<dl>
		<dt>角色名称：</dt>
		<dd>
			<input type="text" name="name" class="required" size="30" maxlength="32" alt="请输入角色名称"/>
		</dd>
	</dl>
	<dl>
		<dt>描述：</dt>
		<dd>
			<input type="text" name="description" size="30" maxlength="255" alt="请输入描述"/>
		</dd>
	</dl>	
	<div class="divider"></div>
	<ul class="treeCustom">
		<li>
			<div class=""><div class="end_collapsable"></div>
			<a href="javascript:void(0);" class="permissionList">
				${module.name }
			</a>
			</div>
			<%=role_tree(module.getChildren(), "<div class=\"indent\"></div>", new Integer[]{0}) %>
		</li>
	</ul>	
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>