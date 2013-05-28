<#--
	<#nested/> like <li>...</li>
 -->
<#macro tool_bar>
	<div class="panelBar">
		<ul class="toolBar">
			<#nested/>
		</ul>
	</div>
</#macro>

<#macro tool_button content="" title="" status="button" width="" height="" href="" rel="" callback="" target="dialog" class="" mask="true" onclick="">	
	<#include "button.ftl">
	<li><@dwz.button_link content=content title=title status=status width=width height=height href=href rel=rel callback=callback target=target class=class mask=mask onclick=onclick/></li>
</#macro>

<#macro tool_line>
<li class="line">line</li>
</#macro>