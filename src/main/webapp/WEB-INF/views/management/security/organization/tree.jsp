<%@page import="com.ketayao.ketacustom.entity.main.Organization"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
	public String tree(Organization organization, String basePath) {
		if (organization.getChildren().isEmpty()) {
			return "";
		}
		StringBuilder builder = new StringBuilder();
		for(Organization o : organization.getChildren()) {
			
			builder.append("{id:" + o.getId() +  ", pId:" + o.getParent().getId() + 
				", name:\"" + o.getName() + "\", url:\"" + basePath + "/management/security/organization/list/" + o.getId() + "\", target:\"ajax\"},");
			
			builder.append(tree(o, basePath));
		}
		return builder.toString();
	}
%>
<%
	Organization organization2 = (Organization)request.getAttribute("organization");
	String orgTree = tree(organization2, request.getContextPath());
	orgTree = orgTree.substring(0, orgTree.length() - 1);
%>   

<script type="text/javascript">
<!--
var setting = {
	view: {
		//showIcon: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		onClick: function(event, treeId, treeNode) {
			var $rel = $("#jbsxBox2organizationList");
			$rel.loadUrl(treeNode.url, {}, function(){
				$rel.find("[layoutH]").layoutH();
			});

			event.preventDefault();
		}
	}	
};

var zNodes =[<%=orgTree%>];
     	
$(document).ready(function(){
	var t = $("#orgTree");
	t = $.fn.zTree.init(t, setting, zNodes);
	t.expandAll(true); 
});
//-->
</script>
<ul id="orgTree" class="ztree"></ul>