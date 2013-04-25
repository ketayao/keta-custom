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
	<li><@dwz.button_link content=content class=class target=target rel=rel mask=mask width=width height=height href=href callback=callback/></li>
</#macro>

<#macro tool_line>
<li class="line">line</li>
</#macro>