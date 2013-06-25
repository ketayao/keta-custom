<%@ page import="com.ketayao.ketacustom.entity.main.Module"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
	public String tree(Module module, String basePath) {
		if (module.getChildren().isEmpty()) {
			return "";
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul>" + "\n");
		for(Module o : module.getChildren()) {
			buffer.append("<li><a href=\"" + basePath + "/management/security/module/list/" + o.getId() + "\" target=\"ajax\" rel=\"jbsxBox2moduleList\">" + o.getName() + "</a>" + "\n");
			buffer.append(tree(o, basePath));
			buffer.append("</li>" + "\n");
		}
		buffer.append("</ul>" + "\n");
		return buffer.toString();
	}
%>
<%
	Module module2 = (Module)request.getAttribute("module");
%>    
<ul class="tree expand">
	<li><a href="${contextPath }/management/security/module/list/${module.id}"
		target="ajax" rel="jbsxBox2moduleList">${module.name }</a> <%=tree(module2, request.getContextPath())%>
	</li>
</ul>