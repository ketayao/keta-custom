<#macro pagerForm page
	action
	
	id="pagerForm" class="" title="" style="" dir="" lang=""
	
	accept="" acceptCharset="" enctype="" method="post" name="" target="" 
	
	onsubmit="" onreset="" onclick="" ondblclick="" onmousedown="" onmouseup="" 
	onmouseover="" onmousemove="" onmouseout="" onkeypress="" onkeydown="" onkeyup=""

>
<#include "form.ftl"/>
<@form 
	action=action
	
	id=id class=class title=title style=style dir=dir lang=lang
	
	accept=accept acceptCharset=acceptCharset enctype=enctype method=method name=name target=target 
	
	onsubmit=onsubmit onreset=onreset onclick=onclick ondblclick=ondblclick onmousedown=onmousedown onmouseup=onmouseup 
	onmouseover=onmouseover onmousemove=onmousemove onmouseout=onmouseout onkeypress=onkeypress onkeydown=onkeydown onkeyup=onkeyup
>
	<input type="hidden" name="pageNum" value="${page.pageNum}"/>
	<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
	<input type="hidden" name="orderField" value="${page.orderField}"/>
	<input type="hidden" name="orderDirection" value="${page.orderDirection}"/>
	<#--其他隐藏域字段-->
	<#nested>
</@form>
</#macro>

<#macro pagerBar page pageNumShown=10 begin=1 end=10 step=1 target="navTab" onchange="navTabPageBreak({numPerPage:this.value})" rel="">
<div class="panelBar">
	<div class="pages">
		<span>每页显示</span>
		<select name="numPerPage" onchange="${onchange}">
  			<#list begin..end as index>
  				<#if page.numPerPage==index>
  					<option value="${index}" selected="selected">${index}</option>
  				<#elseif index%step==0>
  					<option value="${index}">${index}</option>
  				</#if>
			</#list>						
		</select>
		<span>总条数: ${page.totalCount}</span>
	</div>
	<div <#if rel!="">rel="${rel}"</#if>class="pagination" targetType="${target}" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="${pageNumShown}" currentPage="${page.pageNum}"></div>
</div>
</#macro>