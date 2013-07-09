<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" body-content="empty" %>
<%@ attribute name="child" type="com.ketayao.ketacustom.entity.main.Module" required="true"%>
<%@ attribute name="urlPrefix" type="java.lang.String"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="keta" tagdir="/WEB-INF/tags" %>

<c:if test="${urlPrefix == null}" >
	<c:set var="urlPrefix" value="${request.contextPath}"/>
</c:if>

<c:if test="${not empty child.children }">
	<ul>
   		<c:forEach var="c" items="${child.children }">
			<li>
			<keta:navTabLink module="${c }"/>
			<keta:menuAccordion child="${c }" urlPrefix="${urlPrefix }"/>
           </li>   		
   		</c:forEach>
	</ul>
</c:if>
