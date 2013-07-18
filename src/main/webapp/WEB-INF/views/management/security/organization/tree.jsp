<%@page import="com.ketayao.ketacustom.entity.main.Organization"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
	public String tree(Organization organization, String basePath) {
		StringBuilder builder = new StringBuilder();
		
		long pid = organization.getParent() == null ? 0:organization.getParent().getId();
		builder.append("{id:" + organization.getId() +  ", pId:" + pid + 
				", name:\"" + organization.getName() + "\", url:\"" + basePath + "/management/security/organization/list/" + organization.getId() + "\", target:\"ajax\"},");
		
		for(Organization o : organization.getChildren()) {
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
<style>
<!--
#orgTree li span {
	text-align:left;
	float: left;
	display: inline;
} 
-->
</style>
<ul id="orgTree" class="ztree" style="display: block;"></ul>