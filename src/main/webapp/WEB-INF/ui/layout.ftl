<#macro layout_content layoutH="">
<div class="pageContent"<#if layoutH!=""> layoutH="${layoutH}"</#if>>
<#nested/>
</div>
</#macro>

<#macro layout_form_content layoutH="" id="">
<div class="pageFormContent"<#if layoutH!=""> layoutH="${layoutH}"</#if><#if id!=""> id="${id}"</#if>>
<#nested/>
</div>
</#macro>

<#macro layout_content_title title>
<h2 class="contentTitle">${title}</h2>
</#macro>

<#macro layout_divider>
<div class="divider"></div>
</#macro>