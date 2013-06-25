<#macro lookup_parent children>
    <#if children?exists && children?size gt 0>
    	<ul>
        <#list children as child>
        	<#if id==child.id>
				<#break/>
			</#if>
			<li>
				<a href="javascript:" onclick="$.bringBack({id:'${child.id}', name:'${child.name}'})">${child.name}</a>
            	<@lookup_parent children=child.children />
            </li>
		</#list>
		</ul>
	</#if>	
</#macro>

<@dwz.layout_content>
	<@dwz.layout_form_content layoutH="58">
		<ul class="tree expand">
			<li><a href="javascript:">${organization.name}</a>
				<@lookup_parent children=organization.children />
			</li>
		</ul>
	</@dwz.layout_form_content>
	
	<@dwz.form_bar closeTitle="关闭"/>	
</@dwz.layout_content>
