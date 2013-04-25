<#-- button,buttonActive,buttonDisabled -->
<#macro button title="" status="button" id="" class="">
	<div class="${status}"><div class="buttonContent"><button
<#if class!=""> class="${class}"</#if><#rt/>
<#if id!=""> id="${id}"</#if><#rt/>	
>${title}</button></div></div>
</#macro>

<#macro button_link content="" title="" status="button" width="" height="" href="" rel="" callback="" target="dialog" class="" mask="true" onclick="">
<a<#rt/>
<#if class!=""> class="${class}"</#if><#rt/>
<#if target!=""> target="${target}"</#if><#rt/>
<#if rel!=""> rel="${rel}"</#if><#rt/>
<#if mask!=""> mask="${mask}"</#if><#rt/>
<#if width!=""> width="${width}"</#if><#rt/>
<#if height!=""> height="${height}"</#if><#rt/>
<#if href!=""> href="${href}"<#else> href="javascript:;"</#if><#rt/>
<#if onclick!=""> onclick="${onclick}"</#if><#rt/>
<#if title!=""> title="${title}"</#if><#rt/>
<#if callback!=""> callback="${callback}"</#if><#rt/>
><span>${content}</span></a>
</#macro>