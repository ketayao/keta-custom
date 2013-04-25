<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
     
    $(".deleteOrganizationRole").click(function(){
    	var organizationRoleId = $(this).attr("id").split("submit_")[1];
    	jQuery.ajax({
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
            url: '${request.contextPath}/management/security/organization/delete/organizationRole/' + organizationRoleId,
            error: function() { 
    	 		alertMsg.error('删除角色关联失败！');
    		},
    		success: function() { 
    	    	// 删除已分配
    	    	var $remove = $("#organizationRoleRow_" + organizationRoleId).remove();
	        	var roleName = $remove.find("td").eq(0).text()
		    	// 添加分配
				var	$div = $('tr[class="selected"]', getCurrentNavtabRel()).find("td").eq(1).find("div");
				var text = $div.text();
				$div.text(text.replace(roleName, ""));
    		}
        });	
    	
    });
    
});
//-->
</script>
<@dwz.layout_content>
	<@dwz.fieldset title="已分配角色">
		<@dwz.table_css>
			<thead>
				<tr>
					<th width="40%">角色名称</th>
					<th width="60%">优先级（数值越小，优先级越高）</th>
				</tr>
			</thead>
			<tbody id="hasRoles">
				<#list organizationRoles as item>
				<tr id="organizationRoleRow_${item.id}">
					<td>${item.role.name}</td>
					<td>
						<div style="float: left;line-height: 21px;margin: 0px 10px;width: 30px;">${item.priority}</div>
						<@dwz.button title="删除关联" id="submit_${item.id}" class="deleteOrganizationRole"/>
					</td>
				</tr>					
				</#list>
			</tbody>
		</@dwz.table_css>
	</@dwz.fieldset>
</@dwz.layout_content>