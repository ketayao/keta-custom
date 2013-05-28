<@dwz.pagerForm action="${request.contextPath}/management/security/logEntity/list" page=page>
	<input type="hidden" name="username" value="${logEntity.username!'' }"/>
	<input type="hidden" name="ipAddress" value="${logEntity.ipAddress!'' }"/>
	<input type="hidden" name="logLevel" value="${logEntity.logLevel!'' }"/>
	<input type="hidden" name="startDate" value="<#if startDate?exists>${startDate?string('yyyy-MM-dd')}</#if>"/>
	<input type="hidden" name="endDate" value="<#if endDate?exists>${endDate?string('yyyy-MM-dd')}</#if>"/>
</@dwz.pagerForm>

<form method="post" action="${request.contextPath}/management/security/logEntity/list" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label style="width: 100px;">登录名称：</label>
					<input type="text" name="username" value="${logEntity.username!'' }"/>
				</li>	
				<li>
					<label style="width: 100px;">登录IP：</label>
					<input type="text" name="ipAddress" value="${logEntity.ipAddress!'' }"/>
				</li>
				<li>
					<label style="width: 100px;">日志等级：</label>
					<select name="logLevel">
						<option value="">所有</option>
						<#list logLevels as logLevel>
							<option value="${logLevel}"<#if (logEntity.logLevel?exists) && (logEntity.logLevel == logLevel)> selected="selected"</#if>>${logLevel}</option>	
						</#list>
					</select>
				</li>																
			</ul>
			<ul class="searchContent">	
				<li>
					<label style="width: 100px;">日志开始时间：</label>
					<input type="text" name="startDate" class="date" readonly="readonly" style="float:left;" value="<#if startDate?exists>${startDate?string('yyyy-MM-dd')}</#if>"/>
					<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
				</li>			
				<li>
					<label style="width: 100px;">日志结束时间：</label>
					<input type="text" name="endDate" class="date" readonly="readonly" style="float:left;" value="<#if endDate?exists>${endDate?string('yyyy-MM-dd')}</#if>"/>
					<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
				</li>							
			</ul>			
			<div class="subBar">
				<ul>						
					<li><div class="button"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
				</ul>
			</div>
		</div>
	</div>
</form>

<@dwz.layout_content>
	<@dwz.tool_bar>
		<@shiro.hasPermission name="LogEntity:delete">
			<@dwz.tool_button content="删除日志" class="delete" target="selectedTodo" rel="ids" href="${request.contextPath}/management/security/logEntity/delete" title="确认要删除?"/>
		</@shiro.hasPermission>
	</@dwz.tool_bar>
		
	<@dwz.table_common layoutH="163">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="100">登录名称</th>
				<th width="100">登录IP</th>
				<th width="100" orderField="logLevel" class="${(page.orderField=='logLevel')?string(page.orderDirection,'')}">日志等级</th>
				<th >日志内容</th>
				<th width="130" orderField="createTime" class="${(page.orderField=='createTime')?string(page.orderDirection,'')}">创建时间</th>
			</tr>
		</thead>
		<tbody>
			<#list logEntities as item>
			<tr target="slt_uid" rel="${item.id}">
				<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.username!''}</td>
				<td>${item.ipAddress!''}</td>
				<td>${item.logLevel!''}</td>
				<td>${item.message!''}</td>
				<td>${item.createTime}</td>
			</tr>			
			</#list>
		</tbody>
	</@dwz.table_common>
	<!-- 分页 -->
	<@dwz.pagerBar page=page/>
</@dwz.layout_content>
