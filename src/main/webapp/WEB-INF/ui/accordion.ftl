<#macro accordion style="" fillSpace="">
	<div class="accordion" <#if style!="">style="${style}"</#if> <#if fillSpace!="">fillSpace="${fillSpace}"</#if>>
	<#nested/>
	</div>
</#macro>

<#macro accordion_header title>
	<div class="accordionHeader">
		<h2><span>Folder</span>${title}</h2>
	</div>
</#macro>

<#--
ulClass="tree treeFolder treeCheck"
-->
<#macro accordion_content menu target urlPrefix="" ulClass="tree treeFolder expand">
	<div class="accordionContent">
		<ul class="${ulClass}">
		<#list menu as m>
			<li>
				<a href="${urlPrefix}${m.url}" target="${target}" rel="${m.sn}_${m.id}">${m.name}</a>
				<@menus_recursion child=m urlPrefix=urlPrefix target=target/>
			</li>	
		</#list>
		</ul>
	</div>
</#macro>

<#macro menus_recursion child urlPrefix target>
    <#if child.children?exists && child.children?size gt 0>
    	<ul>
        <#list child.children as c>
			<li>
				<a href="${urlPrefix}${c.url}" target="${target}" rel="${c.sn}_${c.id}">${c.name}</a>
		    	<@menus_recursion child=c urlPrefix=urlPrefix target=target/>
            </li>
		</#list>
		</ul>
	</#if>	
</#macro>