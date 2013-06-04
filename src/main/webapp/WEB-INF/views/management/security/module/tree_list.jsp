<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>    
<div class="pageContent">
	<div class="tabs">
		<div class="tabsContent">
			<div>
				<div layoutH="0" id="jbsxBox2moduleTree" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
					<c:import url="/management/security/module/tree"/>
				</div>
				
				<div layoutH="0" id="jbsxBox2moduleList" class="unitBox" style="margin-left:246px;">
					<c:import url="/management/security/module/list/1"/>
				</div>
			</div>
		</div>
	</div>
</div>