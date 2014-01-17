<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<style>
<!--
.priority_input {
	border:none;border-bottom:1px solid gray;background:none;width:50px;height:22px;padding: 0px;float: left;margin-right: 10px;
}
-->
</style>
<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
     
	$(".assignRole").click(function(){
		var roleId = $(this).attr("id").split("submit_")[1];	
		var $roleRow = $("#organizationRoleRow_" + roleId);
		var priority = $("#priority_" + roleId, $roleRow).val();
	
		jQuery.ajax({
	        type: 'POST',
	        contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
	        url: '${contextPath}/management/security/organization/create/organizationRole?organization.id=${organizationId}&role.id=' + roleId + '&priority=' + priority,
	        error: function() { 
	        	 alertMsg.error('分配角色失败！');
	        },
	        success: function() { 
				// 删除已分配
				var $remove = $roleRow.remove();
	        	var roleName = $remove.find("td").eq(0).text()
		    	// 添加分配
				$("#hasRoles").append("<tr><td>" + roleName + "</td><td>" + priority + "</td></tr>");
				$('tr[class="selected"]', getCurrentNavtabRel()).find("td").eq(1).find("div").append(roleName + "  ");
			}		
	        		
	    });	
	});
    
});
//-->
</script>
<div class="pageContent" layoutH="0" >

	<fieldset>
		<legend>组织已分配角色</legend>
		<table class="list" width="100%">
			<thead>
				<tr>
					<th width="40%">角色名称</th>
					<th width="60%">优先级（数值越小，优先级越高）</th>
				</tr>
			</thead>
			<tbody id="hasRoles">
				<c:forEach var="item" items="${organizationRoles}">
				<tr>
					<td>${item.role.name}</td>
					<td>${item.priority}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
	<fieldset>
		<legend>组织可分配角色</legend>
		<table class="list" width="100%">
			<thead>
				<tr>
					<th width="40%">角色名称</th>
					<th width="60%">优先级（数值越小，优先级越高）</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${roles}">
				<tr id="organizationRoleRow_${item.id}">
					<td>${item.name}</td>
					<td>
						<input type="text" id="priority_${item.id}" name="priority" value="999" maxlength="3" class="priority_input">						
						<div class="button"><div class="buttonContent"><button id="submit_${item.id}" class="assignRole">分配</button></div></div>
					</td>
				</tr>	
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</div>