<#macro input 
	id="" class="" title="" style="" dir="" lang=""
	
	accept="" align="" alt="" checked="" disabled="" maxlength="" name="" readonly="" size="" src="" type="" value=""
	
	tabindex="" accesskey="" onfocus="" onblur="" onselect="" onchange="" 
    onclick="" ondblclick="" onmousedown="" onmouseup="" onmouseover="" 
	onmousemove="" onmouseout="" onkeypress="" onkeydown="" onkeyup=""
	
	equalTo=""
>
<input<#rt/>
<#if id!=""> id="${id}"</#if><#rt/>
<#if class!=""> class="${class}"</#if><#rt/>
<#if title!=""> title="${title}"</#if><#rt/>
<#if style!=""> style="${style}"</#if><#rt/>
<#if dir!=""> dir="${dir}"</#if><#rt/>
<#if lang!=""> lang="${lang}"</#if><#rt/>
<#t/>
<#if accept!=""> accept="${accept}"</#if><#rt/>
<#if align!=""> align="${align}"</#if><#rt/>
<#if alt!=""> alt="${alt}"</#if><#rt/>
<#if checked!=""> checked="${checked}"</#if><#rt/>
<#if disabled!=""> disabled="${disabled}"</#if><#rt/>
<#if maxlength!=""> maxlength="${maxlength}"</#if><#rt/>
<#if name!=""> name="${name}"</#if><#rt/>
<#if readonly!=""> readonly="${readonly}"</#if><#rt/>
<#if size!=""> size="${size}"</#if><#rt/>
<#if src!=""> src="${src}"</#if><#rt/>
<#if type!=""> type="${type}"</#if><#rt/>
<#if value!=""> value="${value}"</#if><#rt/>
<#t/>
<#if tabindex!=""> tabindex="${tabindex}"</#if><#rt/>
<#if accesskey!=""> accesskey="${accesskey}"</#if><#rt/>
<#if onfocus!=""> onfocus="${onfocus}"</#if><#rt/>
<#if onblur!=""> onblur="${onblur}"</#if><#rt/>
<#if onselect!=""> onselect="${onselect}"</#if><#rt/>
<#if onchange!=""> onchange="${onchange}"</#if><#rt/>
<#if onclick!=""> onclick="${onclick}"</#if><#rt/>
<#if ondblclick!=""> ondblclick="${ondblclick}"</#if><#rt/>
<#if onmousedown!=""> onmousedown="${onmousedown}"</#if><#rt/>
<#if onmouseup!=""> onmouseup="${onmouseup}"</#if><#rt/>
<#if onmouseover!=""> onmouseover="${onmouseover}"</#if><#rt/>
<#if onmousemove!=""> onmousemove="${onmousemove}"</#if><#rt/>
<#if onmouseout!=""> onmouseout="${onmouseout}"</#if><#rt/>
<#if onkeypress!=""> onkeypress="${onkeypress}"</#if><#rt/>
<#if onkeypress!=""> onkeypress="${onkeypress}"</#if><#rt/>
<#if onkeydown!=""> onkeydown="${onkeydown}"</#if><#rt/>
<#if onkeyup!=""> onkeyup="${onkeyup}"</#if><#rt/>
<#t/>
<#if equalTo!=""> equalTo="${equalTo}"</#if><#rt/>
/><#rt/>
</#macro>