<%@page import="java.io.StringWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%response.setStatus(200);%>

<%
	String errorMsg = null;
	Throwable ex = null;
	if (request.getAttribute("javax.servlet.error.exception") != null) {
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");
	} else {
		ex = exception;
	}

	//记录日志
	if (ex != null) {
		Logger logger = LoggerFactory.getLogger("500.jsp");
		
		StringWriter stringWriter = new StringWriter();
		ex.printStackTrace(new PrintWriter(stringWriter));
		errorMsg = stringWriter.toString();
		
		logger.error(errorMsg);
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>500 - 系统内部错误</title>
</head>

<body>
<div><h1>系统发生内部错误.</h1></div>
<div><a href="<c:url value="/management/index"/>" target="_top">返回首页</a></div>
</body>
</html>
