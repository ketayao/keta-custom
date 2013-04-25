<@dwz.layout_content>
	<@dwz.tabs>
		<@dwz.tabs_content>
			<div>
				<div layoutH="0" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
				<@dwz.tree object=organization target="ajax" class="tree expand" href="${request.contextPath}/management/security/organization/list" rel="jbsxBox2organization"/>
				</div>
				
				<div layoutH="0" id="jbsxBox2organization" class="unitBox" style="margin-left:246px;">
					<!--#include virtual="list1.html" -->
				</div>
			</div>				
		</@dwz.tabs_content>
	</@dwz.tabs>	
</@dwz.layout_content>
