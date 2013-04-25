<#macro fieldset title="" id="">
<fieldset<#if id!=""> id=${id}</#if>>
<legend>${title}</legend>
<#nested/>
</fieldset>
</#macro>