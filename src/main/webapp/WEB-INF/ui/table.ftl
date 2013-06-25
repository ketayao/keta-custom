<#-- 
class="list" class="table"
-->
<#macro table width="100%" layoutH="" rel=""

align="" bgcolor="" border="" cellpadding="" cellspacing="" frame="" rules="" summary=""

id="" class="" title="" style="" dir="" lang=""

onclick="" ondblclick="" onmousedown="" onmouseup="" onmouseover="" 
onmousemove="" onmouseout="" onkeypress="" onkeydown="" onkeyup=""
>
<table<#rt/>
<#if rel!=""> rel="${rel}"</#if><#rt/>
<#if width!=""> width="${width}"</#if><#rt/>
<#if layoutH!=""> layoutH="${layoutH}"</#if><#rt/>
<#t/>
<#if align!=""> align="${align}"</#if><#rt/>
<#if bgcolor!=""> bgcolor="${bgcolor}"</#if><#rt/>
<#if border!=""> border="${border}"</#if><#rt/>
<#if cellpadding!=""> cellpadding="${cellpadding}"</#if><#rt/>
<#if cellspacing!=""> cellspacing="${cellspacing}"</#if><#rt/>
<#if frame!=""> frame="${frame}"</#if><#rt/>
<#if rules!=""> rules="${rules}"</#if><#rt/>
<#if summary!=""> summary="${summary}"</#if><#rt/>
<#t/>
<#if id!=""> id="${id}"</#if><#rt/>
<#if class!=""> class="${class}"</#if><#rt/>
<#if title!=""> title="${title}"</#if><#rt/>
<#if style!=""> style="${style}"</#if><#rt/>
<#if dir!=""> dir="${dir}"</#if><#rt/>
<#if lang!=""> lang="${lang}"</#if><#rt/>
<#t/>
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
</table>
</#macro>


<#macro table_css width="100%" layoutH="" rel=""
		align="" bgcolor="" border="" cellpadding="" cellspacing="" frame="" rules="" summary=""
		id="" class="list" title="" style="" dir="" lang=""
		onclick="" ondblclick="" onmousedown="" onmouseup="" onmouseover="" 
		onmousemove="" onmouseout="" onkeypress="" onkeydown="" onkeyup=""
>
<@table width=width layoutH=layoutH rel=rel align=align bgcolor=bgcolor border=border 
        cellpadding=cellpadding cellspacing=cellspacing frame=frame rules=rules summary=summary
        id=id class=class title=title style=style dir=dir lang=lang
		onclick=onclick ondblclick=ondblclick onmousedown=onmousedown onmouseup=onmouseup onmouseover=onmouseover 
		onmousemove=onmousemove onmouseout=onmouseout onkeypress=onkeypress onkeydown=onkeydown onkeyup=onkeyup>
<#nested/>
</@table>		
</#macro>

<#macro table_common width="100%" layoutH="" rel=""
		align="" bgcolor="" border="" cellpadding="" cellspacing="" frame="" rules="" summary=""
		id="" class="table" title="" style="" dir="" lang=""
		onclick="" ondblclick="" onmousedown="" onmouseup="" onmouseover="" 
		onmousemove="" onmouseout="" onkeypress="" onkeydown="" onkeyup=""
>
<@table width=width layoutH=layoutH rel=rel align=align bgcolor=bgcolor border=border 
        cellpadding=cellpadding cellspacing=cellspacing frame=frame rules=rules summary=summary
        id=id class=class title=title style=style dir=dir lang=lang
		onclick=onclick ondblclick=ondblclick onmousedown=onmousedown onmouseup=onmouseup onmouseover=onmouseover 
		onmousemove=onmousemove onmouseout=onmouseout onkeypress=onkeypress onkeydown=onkeydown onkeyup=onkeyup>
<#nested/>
</@table>
</#macro>
