<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" body-content="empty" %>
<%@ attribute name="module" type="com.ketayao.ketacustom.entity.main.Module" required="true"%>
<%@ attribute name="urlPrefix" type="java.lang.String" required="true"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="keta" tagdir="/WEB-INF/tags" %>

<c:choose>
	<%-- 打开外部链接 --%>
	<c:when test="${fn:startsWith(module.url, 'http:') }">
		<a href="${module.url}" target="navTab" external="true" rel="${module.sn}_${module.id}">${module.name}</a>
	</c:when>
	<%-- 打开内部链接 --%>
	<c:when test="${fn:startsWith(module.url, '/') || fn:startsWith(module.url, '\')}">
		<a href="${urlPrefix}${module.url}" target="navTab" rel="${module.sn}_${module.id}">${module.name}</a>		
	</c:when>
	<%-- 打开内部链接，自动补齐'/' --%>
	<c:otherwise>
		<a href="${urlPrefix}/${module.url}" target="navTab" rel="${module.sn}_${module.id}">${module.name}</a>
	</c:otherwise>
</c:choose>
