<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
     
    $(".setAll").click(function(){
    	var isChecked = $(this).is(":checked");
    
		var $inputSpan = $(this).parent("span");
		$("input[type=checkbox]", $inputSpan).each(function(){
			if (isChecked) {
				$(this).attr("checked", "checked");
			} else {
				$(this).removeAttr("checked");
			}
		});
    });
    
});
//-->
</script>
<#macro role_tree children>
    <#if children?exists && children?size gt 0>
    	<ul>
        <#list children as child>
        	<li<#if (child_index+1)==children?size> class="last"</#if>>
        	
        	<div class="">
        	${treeStyle}
        	<#if (child.children?size) gt 0 && child!=children?last>
        		<#-- 使用treeStyle来递归tree的样式
        			下一层时，样式叠加
        			上一层时，样式递减
        			<#assign treeStyle = treeStyle?substring(0, treeStyle?last_index_of("<div"))/>
        		 -->
        		<#assign treeStyle=treeStyle + "<div class=\"line\"></div>">
        		<div class="collapsable"></div>
        	<#else>
        		<#assign treeStyle=treeStyle + "<div class=\"indent\"></div>">
        		<div class="node"></div>
        	</#if>
			<a href="javascript:void(0);" class="permissionList">
			${child.name}
			</a>
			<span class="inputValueRole">
				<#list child.permissions as permission>
			 		${permission.name}<input type="checkbox" name="rolePermissions[${moduleIndex}].permission.id" value="${permission.id}"/>
			 		<#assign moduleIndex=moduleIndex+1>
			 	</#list>
				全选<input type="checkbox" class="setAll"/>
			</span>
			</div>
            <@role_tree children=child.children/>
            <#assign treeStyle = treeStyle?substring(0, treeStyle?last_index_of("<div"))/>
            </li>
		</#list>
		</ul>
	</#if>	
</#macro>

<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/security/role/create" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<@dwz.layout_form_content layoutH="58">
	<@dwz.label_input content="角色名称：">
		<input type="text" name="name" class="required" size="30" maxlength="32" alt="请输入角色名称"/>
	</@dwz.label_input>	
	<@dwz.label_input content="描述：">
		<input type="text" name="description" size="30" maxlength="255" alt="请输入描述"/>
	</@dwz.label_input>		
	<@dwz.layout_divider/>
	<ul class="treeCustom">
		<li>
			<div class=""><div class="end_collapsable"></div>
			<a href="javascript:void(0);" class="permissionList">
				${module.name }
			</a>
			</div>
			<#assign treeStyle="<div class=\"indent\"></div>">
			<#assign moduleIndex=0>
			<@role_tree children=module.children/>
		</li>
	</ul>
	</@dwz.layout_form_content>	
	<@dwz.form_bar submitTitle="确定" closeTitle="关闭"/>	
</@dwz.form>
</@dwz.layout_content>