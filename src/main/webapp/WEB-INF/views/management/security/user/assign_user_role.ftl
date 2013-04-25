<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
     
    $(".assignRole").click(function(){
    	var roleId = $(this).attr("id").split("submit_")[1];
    	var $roleRow = $("#userRoleRow_" + roleId);
    	var priority = $("#priority_" + roleId).val();
    
    	jQuery.ajax({
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
            url: '${request.contextPath}/management/security/user/create/userRole?user.id=${userId}&role.id=' + roleId + '&priority=' + priority,
            error: function() { 
            	 alertMsg.error('分配角色失败！');
            },
            success: function() { 
            	// 删除已分配
				var $remove = $roleRow.remove();
	        	var roleName = $remove.find("td").eq(0).text();
		    	// 添加分配
				$("#hasRoles").append("<tr><td>" + roleName + "</td><td>" + priority + "</td></tr>");
				$('tr[class="selected"]', getCurrentNavtabRel()).find("td").eq(5).find("div").append(roleName + "  ");
    		}		
        });	
    });
    
});
//-->
</script>
<@dwz.layout_content>
	<@dwz.fieldset title="用户已分配角色">
		<@dwz.table_css>
			<thead>
				<tr>
					<th width="40%">角色名称</th>
					<th width="60%">优先级（数值越小，优先级越高）</th>
				</tr>
			</thead>
			<tbody id="hasRoles">
				<#list userRoles as item>
				<tr>
					<td>${item.role.name}</td>
					<td>${item.priority}</td>
				</tr>
				</#list>
			</tbody>
		</@dwz.table_css>
	</@dwz.fieldset>
	<@dwz.fieldset title="用户可分配角色">
		<@dwz.table_css>
			<thead>
				<tr>
					<th width="40%">角色名称</th>
					<th width="60%">优先级（数值越小，优先级越高）</th>
				</tr>
			</thead>
			<tbody>
				<#list roles as item>
				<tr id="userRoleRow_${item.id}">
					<td>${item.name}</td>
					<td>
						<select id="priority_${item.id}" name="priority" class="required combox">
							<#list 1..98 as index>
								<option value="${index}">${index}</option>
							</#list>
							<option value="99" selected>99</option>
						</select>
						<@dwz.button title="分配" id="submit_${item.id}" class="assignRole"/>
					</td>
				</tr>							
				</#list>
			</tbody>
		</@dwz.table_css>
	</@dwz.fieldset>
</@dwz.layout_content>
