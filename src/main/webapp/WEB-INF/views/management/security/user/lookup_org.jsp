<%@page import="com.ketayao.ketacustom.entity.main.Organization"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
	public String tree(Organization org) {
		if (org.getChildren().isEmpty()) {
			return "";
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul>" + "\n");
		for(Organization o : org.getChildren()) {
			buffer.append("<li><a href=\"javascript:\" onclick=\"$.bringBack({id:'" + o.getId() + "', name:'" + o.getName() + "'})\">" + o.getName() + "</a>" + "\n");
			buffer.append(tree(o));
			buffer.append("</li>" + "\n");
		}
		buffer.append("</ul>" + "\n");
		return buffer.toString();
	}
%>
<%
	Organization org = (Organization)request.getAttribute("org");
%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<ul class="tree expand">
			<li><a href="javascript:"><%=org.getName() %></a>
				<%=tree(org) %>
			</li>
		</ul>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
		</ul>
	</div>
</div>