<#-- type=warn,correct,info,error -->
<#macro alert_button type title content>
	<a class="button" href="javascript:;" onclick="alertMsg.${type}('${content}')"><span>${title}</span></a>
</#macro>

<#macro alert_button2 onclick>
	<a class="button" href="javascript:;" onclick="${onclick}"><span>${title}</span></a>
</#macro>