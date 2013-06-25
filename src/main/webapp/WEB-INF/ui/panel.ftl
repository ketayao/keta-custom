<#--
顶层div 以class=”panel”标识即可, 其中的<h1>为panel的标题,  <h1>后的<div>则是放置内容的容器. 
Class 中的close 与collapse为可选项, close表示panel默认为关闭状态, 没有则默认为打开状态. 
collapse 再表示此panel是否为可折叠的panel, 没有则此panel不可折叠. 
扩展属性defH则表示panel 内容部分的固定高度, 没有则panel内容部分的高度为实际内容的高度, minH可以指定panel内容部分的最小高度.
-->
<#macro panel title="" close=false collapse=true defH="" minH="">
	<div class="panel<#if close==true> close</#if><#if collapse==true> collapse</#if>" minH="<#if minH!="">${minH}</#if>" defH="<#if defH!="">${defH}</#if>">
		<h1>${title}</h1>
		<div>
			<#nested>
		</div>
	</div>
</#macro>