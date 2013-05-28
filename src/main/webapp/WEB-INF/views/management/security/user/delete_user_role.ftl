<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
     
    $(".deleteUserRole").click(function(){
    	var userRoleId = $(this).attr("id").split("submit_")[1];
    	jQuery.ajax({
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
            url: '${request.contextPath}/management/security/user/delete/userRole/' + userRoleId,
            error: function() { 
    	 		alertMsg.error('撤销角色失败！');
    		},
    		success: function() { 
    	    	// 删除已分配
    	    	var $remove = $("#userRoleRow_" + userRoleId).remove();
	        	var roleName = $remove.find("td").eq(0).text()
		    	// 添加分配
				var	$div = $('tr[class="selected"]', getCurrentNavtabRel()).find("td").eq(6).find("div");
				var text = $div.text();
				$div.text(text.replace(roleName, ""));
    		}
        });	
    	
    });
});
//-->
</script>
<@dwz.layout_content>
	<@dwz.table_css>
		<thead>
			<tr>
				<th width="40%">角色名称</th>
				<th width="60%">优先级（数值越小，优先级越高）</th>
			</tr>
		</thead>
		<tbody id="hasRoles">
			<#if userRoles?size <= 0>
				<tr>
					<td colspan="2" align="center" style="color:red;">该用户还没有分配角色。</td>
				</tr>
			</#if>
			<#list userRoles as item>
			<tr id="userRoleRow_${item.id}">
				<td>${item.role.name}</td>
				<td>
					<div style="float: left;line-height: 21px;margin: 0px 10px;width: 30px;">${item.priority}</div>
					<@dwz.button title="撤销角色" id="submit_${item.id}" class="deleteUserRole"/>
				</td>
			</tr>					
			</#list>
		</tbody>
	</@dwz.table_css>
</@dwz.layout_content>