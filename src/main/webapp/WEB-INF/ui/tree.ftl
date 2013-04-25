<#-- 
class="tree treeFolder treeCheck expand"
-->
<#macro tree object class="tree expand" href="" rel="" target="">
	<ul class="${class}">
	<#assign depth = 1 />
	<li><a 
		   <#if href!=""> href="${href}/${object.id}"<#else>href="javascript:void(0);"</#if><#rt>
		   <#if target!=""> target="${target}"</#if><#rt>
		   <#if rel!=""> rel="${rel}"</#if><#rt>
		>${object.name}</a>
		<#if object.children?exists && object.children?size gt 0>
		<ul>
		<#list object.children as m>
			<li><a href="${href}/${m.id}" target="${target}"<#if rel!=""> rel="${rel}"</#if>>${m.name}</a>
			<@tree_recursion children=m.children target=target href=href rel=rel/>
			</li>
		</#list>
		</ul>
		</#if>
	</li>
	</ul>
</#macro>

<#macro tree_recursion children target="" href="" rel="">
    <#if children?exists && children?size gt 0>
    	<ul>
        <#list children as child>
			<li><a 
				   <#if href!=""> href="${href}/${child.id}"<#else>href="javascript:void(0);"</#if><#rt>
				   <#if target!=""> target="${target}"</#if><#rt>
				   <#if rel!=""> rel="${rel}"</#if><#rt>
				>${child.name}</a>			
			<#assign depth = depth + 1 />
            <@tree_recursion children=child.children target=target href=href rel=rel/>
            <#assign depth = depth - 1 />
            </li>
		</#list>
		</ul>
	</#if>	
</#macro>