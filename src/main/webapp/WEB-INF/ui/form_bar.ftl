<#macro form_bar submitTitle="" closeTitle="关闭">		
	<div class="formBar">
		<ul>
			<#if submitTitle!="">
			<li><div class="button"><div class="buttonContent"><button type="submit">${submitTitle}</button></div></div></li>
			</#if>
			<#if submitTitle!="关闭">
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">${closeTitle}</button></div></div></li>
			</#if>
		</ul>
	</div>
</#macro>