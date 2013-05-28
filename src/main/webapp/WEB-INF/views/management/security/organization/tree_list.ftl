<#assign  c =JspTaglibs["/WEB-INF/tld/c.tld"]>
<@dwz.layout_content>
	<@dwz.tabs>
		<@dwz.tabs_content>
			<div>
				<div layoutH="0" id="jbsxBox2organizationTree" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
					<@c.import url="/management/security/organization/tree"/>
				</div>
				
				<div layoutH="0" id="jbsxBox2organizationList" class="unitBox" style="margin-left:246px;">
					<!--#include virtual="list1.html" -->
				</div>
			</div>				
		</@dwz.tabs_content>
	</@dwz.tabs>	
</@dwz.layout_content>