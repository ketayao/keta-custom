<%@ page import="com.ketayao.ketacustom.entity.main.Module"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
	public String tree(Module module, String basePath) {
		StringBuilder builder = new StringBuilder();
		
		long pid = module.getParent() == null ? 0:module.getParent().getId();
		builder.append("{id:" + module.getId() +  ", pId:" + pid + 
				", name:\"" + module.getName() + "\", url:\"" + basePath + "/management/security/module/list/" + module.getId() + "\", target:\"ajax\"},");
		
		for(Module o : module.getChildren()) {
			builder.append(tree(o, basePath));				
		}
		return builder.toString();
	}
%>
<%
	Module module2 = (Module)request.getAttribute("module");
	String moduleTree = tree(module2, request.getContextPath());
	moduleTree = moduleTree.substring(0, moduleTree.length() - 1);
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
			var $rel = $("#jbsxBox2moduleList");
			$rel.loadUrl(treeNode.url, {}, function(){
				$rel.find("[layoutH]").layoutH();
			});

			event.preventDefault();
		}
	}	
};

var zNodes =[<%=moduleTree%>];
     	
$(document).ready(function(){
	var t = $("#moduleTree");
	t = $.fn.zTree.init(t, setting, zNodes);
	t.expandAll(true); 
});
//-->
</script>
<ul id="moduleTree" class="ztree"></ul>