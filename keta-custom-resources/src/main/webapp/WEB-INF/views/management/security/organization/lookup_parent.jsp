<%@page import="com.ketayao.ketacustom.entity.main.Organization"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%> 
<%!
	public String tree(Organization organization, Long organizationId) {
		if (organization.getChildren().isEmpty()) {
			return "";
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul>" + "\n");
		for(Organization m : organization.getChildren()) {
			// 不显示自己及子元素
			if (organizationId.equals(m.getId())) {
				continue;
			}
			buffer.append("<li><a href=\"javascript:\" onclick=\"$.bringBack({id:'" + m.getId() + "', name:'" + m.getName() + "'})\">" + m.getName() + "</a>" + "\n");
			buffer.append(tree(m, organizationId));
			buffer.append("</li>" + "\n");
		}
		buffer.append("</ul>" + "\n");
		return buffer.toString();
	}
%>
<%
	Organization organization = (Organization)request.getAttribute("organization");
	Long organizationId = (Long)request.getAttribute("id");
%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<ul class="tree expand">
			<li><a href="javascript:"><%=organization.getName() %></a>
				<%=tree(organization, organizationId) %>
			</li>
		</ul>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
		</ul>
	</div>
</div>