<%@page import="com.ketayao.ketacustom.entity.main.Organization"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
	public String tree(Organization organization, String basePath) {
		if (organization.getChildren().isEmpty()) {
			return "";
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul>" + "\n");
		for(Organization o : organization.getChildren()) {
			buffer.append("<li><a href=\"" + basePath + "/management/security/organization/list/" + o.getId() + "\" target=\"ajax\" rel=\"jbsxBox2organizationList\">" + o.getName() + "</a>" + "\n");
			buffer.append(tree(o, basePath));
			buffer.append("</li>" + "\n");
		}
		buffer.append("</ul>" + "\n");
		return buffer.toString();
	}
%>
<%
	Organization organization2 = (Organization)request.getAttribute("organization");
%>   
<ul class="tree expand">
	<li><a href="${contextPath }/management/security/organization/list/${organization.id}"
		target="ajax" rel="jbsxBox2module">${organization.name }</a> <%=tree(organization2, request.getContextPath())%>
	</li>
</ul>