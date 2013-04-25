<#macro tabs>
<div class="tabs">
	<#nested>
</div>
</#macro>

<#macro tabs_header title=[] current=0>
	<div class="tabsHeader">
		<div class="tabsHeaderContent">
			<ul>
	      	<#list nodeList as node>
				<li<#if node_index==current> class="selected"</#if>><a href="#"><span>${node}</span></a></li>
			</#list>				
			</ul>
		</div>
	</div>
</#macro>

<#macro tabs_content style="">
	<div class="tabsContent"<#if style!=""> style="${style}"</#if>>
		<#nested>
	</div>
</#macro>

<#macro tabs_footer>
	<div class="tabsFooter">
		<div class="tabsFooterContent"></div>
	</div>
</#macro>