<#--
<form></form>
-->
<#macro form
	action
	
	id="" class="required-validate pageForm" title="" style="" dir="" lang=""
	
	accept="" acceptCharset="" enctype="" method="post" name="" target="" 
	
	onsubmit="return validateCallback(this, dialogAjaxDone);" onreset="" onclick="" ondblclick="" onmousedown="" onmouseup="" 
	onmouseover="" onmousemove="" onmouseout="" onkeypress="" onkeydown="" onkeyup=""
>
<form<#rt/>
<#if action!=""> action="${action}"</#if><#rt/>
<#t/>
<#if id!=""> id="${id}"</#if><#rt/>
<#if class!=""> class="${class}"</#if><#rt/>
<#if title!=""> title="${title}"</#if><#rt/>
<#if style!=""> style="${style}"</#if><#rt/>
<#if dir!=""> dir="${dir}"</#if><#rt/>
<#if lang!=""> lang="${lang}"</#if><#rt/>
<#t/>
<#if accept!=""> accept="${accept}"</#if><#rt/>
<#if acceptCharset!=""> accept-charset="${acceptCharset}"</#if><#rt/>
<#if enctype!=""> enctype="${enctype}"</#if><#rt/>
<#if method!=""> method="${method}"</#if><#rt/>
<#if name!=""> name="${name}"</#if><#rt/>
<#if target!=""> target="${target}"</#if><#rt/>
<#t/>
<#if onsubmit!=""> onsubmit="${onsubmit}"</#if><#rt/>
<#if onreset!=""> onreset="${onreset}"</#if><#rt/>
<#if onclick!=""> onclick="${onclick}"</#if><#rt/>
<#if ondblclick!=""> ondblclick="${ondblclick}"</#if><#rt/>
<#if onmousedown!=""> onmousedown="${onmousedown}"</#if><#rt/>
<#if onmouseup!=""> onmouseup="${onmouseup}"</#if><#rt/>
<#if onmouseover!=""> onmouseover="${onmouseover}"</#if><#rt/>
<#if onmousemove!=""> onmousemove="${onmousemove}"</#if><#rt/>
<#if onmouseout!=""> onmouseout="${onmouseout}"</#if><#rt/>
<#if onkeypress!=""> onkeypress="${onkeypress}"</#if><#rt/>
<#if onkeydown!=""> onkeydown="${onkeydown}"</#if><#rt/>
<#if onkeyup!=""> onkeyup="${onkeyup}"</#if><#rt/>
>
<#nested/>
</form>
</#macro>


<#--
<form></form>
-->
<#macro search_form
	action
	
	id="" class="" title="" style="" dir="" lang=""
	
	accept="" acceptCharset="" enctype="" method="post" name="" target="" 
	
	onsubmit="return navTabSearch(this);" onreset="" onclick="" ondblclick="" onmousedown="" onmouseup="" 
	onmouseover="" onmousemove="" onmouseout="" onkeypress="" onkeydown="" onkeyup=""
>
<@form 
	action=action
	
	id=id class=class title=title style=style dir=dir lang=lang
	
	accept=accept acceptCharset=acceptCharset enctype=enctype method=method name=name target=target 
	
	onsubmit=onsubmit onreset=onreset onclick=onclick ondblclick=ondblclick onmousedown=onmousedown onmouseup=onmouseup 
	onmouseover=onmouseover onmousemove=onmousemove onmouseout=onmouseout onkeypress=onkeypress onkeydown=onkeydown onkeyup=onkeyup
>
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<#nested/>
			</ul>
			<div class="subBar">
				<ul>						
					<li><#include "button.ftl"/><@button title="搜索"/></li>
				</ul>
			</div>
		</div>
	</div>
</@form>
</#macro>