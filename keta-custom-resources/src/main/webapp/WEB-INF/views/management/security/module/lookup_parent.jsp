<%@page import="com.ketayao.ketacustom.entity.main.Module"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%> 
<%!
	public String tree(Module module, Long moduleId) {
		if (module.getChildren().isEmpty()) {
			return "";
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul>" + "\n");
		for(Module m : module.getChildren()) {
			// 不显示自己及子元素
			if (moduleId.equals(m.getId())) {
				continue;
			}
			buffer.append("<li><a href=\"javascript:\" onclick=\"$.bringBack({id:'" + m.getId() + "', name:'" + m.getName() + "'})\">" + m.getName() + "</a>" + "\n");
			buffer.append(tree(m, moduleId));
			buffer.append("</li>" + "\n");
		}
		buffer.append("</ul>" + "\n");
		return buffer.toString();
	}
%>
<%
	Module module = (Module)request.getAttribute("module");
	Long moduleId = (Long)request.getAttribute("id");
%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<ul class="tree expand">
			<li><a href="javascript:"><%=module.getName() %></a>
				<%=tree(module, moduleId) %>
			</li>
		</ul>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
		</ul>
	</div>
</div>