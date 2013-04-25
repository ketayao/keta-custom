<#--
<p>
	<label>${label}</label><input type="password" name="oldPassword" class="required"/>
</p>
-->
<#macro label_input content="" style="">
<p>
	<label<#if style!=""> style="${style}"</#if>>${content}</label><#rt/>
	<#nested/>
</p>
</#macro>

<#--
<li>
	<label>登录名称：</label>
	<input type="text" name="keywords" value="${keywords!''}"/>
</li>
-->
<#macro label_input2 content="" style="">
<li>
	<label<#if style!=""> style="${style}"</#if>>${content}</label><#rt/>
	<#nested/>
</li>
</#macro>