<#macro lookup_org children>
    <#if children?exists && children?size gt 0>
    	<ul>
        <#list children as child>
			<li>
				<a href="javascript:" onclick="$.bringBack({id:'${child.id}', name:'${child.name}'})">${child.name}</a>
			<#assign depth = depth + 1 />
            <@lookup_org children=child.children />
            </li>
            <#assign depth = depth - 1 />
		</#list>
		</ul>
	</#if>	
</#macro>

<@dwz.layout_content>
	<@dwz.layout_form_content layoutH="58">
		<ul class="tree expand">
			<li><a href="javascript:">${org.name}</a>
				<#assign depth = 1 />
				<@lookup_org children=org.children />
			</li>
		</ul>
	</@dwz.layout_form_content>
	
	<@dwz.form_bar closeTitle="关闭"/>	
</@dwz.layout_content>
