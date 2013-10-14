<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"  trimDirectiveWhitespaces="true"%>
<%@ attribute name="page" type="com.ketayao.ketacustom.util.dwz.Page" required="true"%>
<%@ attribute name="action" type="java.lang.String" required="true"%>
<%@ attribute name="onsubmit" type="java.lang.String"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="pagerForm" method="post" action="${action }"<c:if test="${onsubmit!=null}"> onsubmit="${onsubmit }"</c:if>>
	<input type="hidden" name="pageNum" value="${page.pageNum}"/>
	<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
	<input type="hidden" name="orderField" value="${page.orderField}"/>
	<input type="hidden" name="orderDirection" value="${page.orderDirection}"/>
	<jsp:doBody/>
</form>