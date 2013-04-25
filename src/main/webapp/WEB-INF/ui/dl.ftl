<#--
	<dl>
		<dt>登录名称：</dt>
		<dd><span class="unit">${user.username }</span></dd>
	</dl>																														
-->
<#macro dl_fieldset title="" content="" style="">
	<dl<#if style!=""> style="${style}"</#if>>
		<dt>${title}</dt>
		<dd><span class="unit">${content}</span></dd>
	</dl>
</#macro>