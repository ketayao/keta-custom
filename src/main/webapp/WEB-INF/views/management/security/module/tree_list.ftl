<#assign  c =JspTaglibs["/WEB-INF/tld/c.tld"]>
<@dwz.layout_content>
	<@dwz.tabs>
		<@dwz.tabs_content>
			<div>
				<div layoutH="0" id="jbsxBox2moduleTree" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
					<@c.import url="/management/security/module/tree"/>
				</div>
				
				<div layoutH="0" id="jbsxBox2moduleList" class="unitBox" style="margin-left:246px;">
					<@c.import url="/management/security/module/list/1"/>
				</div>
			</div>				
		</@dwz.tabs_content>
	</@dwz.tabs>	
</@dwz.layout_content>