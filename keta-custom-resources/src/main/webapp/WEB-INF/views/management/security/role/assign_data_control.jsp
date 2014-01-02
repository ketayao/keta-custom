<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<style>
<!--
.treeTable input[type=text] {
	border:0;background:transparent;width: 100%;
}
-->
</style>
<script type="text/javascript">
<!--
$(function(){
	//初始化treeTable
	var option = {
	        theme:'default',
	        expandLevel : 2
	};
	$('.treeTable').treeTable(option);
});

function clear(id) {
	var $td = $("#td_" + id);
	
	$("input[name$='rolePermission.id']", $td).val("");
	$("input[name$='dataControl.id']", $td).val("");
	$("input[name$='dataControl.name']", $td).val("");
}

function assignDC() {
	var data = "id=${role.id }&";
	var rpIndex = 0;	
	$(".rpdcs").each(function(){
		var ri = $("input[name$='rolePermission.id']", $(this)).val();
		var di = $("input[name$='dataControl.id']", $(this)).val();
		
		var rpdcIndex = 0;		
		if (ri != "" && di != "") {
			var arrRi = ri.split(",");
			var arrDi = di.split(",");

			for ( var i = 0; i < arrRi.length; i++) {
				data += "rolePermissions[" + rpIndex + "].rolePermissionDataControls[" + rpdcIndex + "].rolePermission.id=" + arrRi[i] + "&"; 
				data += "rolePermissions[" + rpIndex + "].rolePermissionDataControls[" + rpdcIndex + "].dataControl.id=" + arrDi[i] + "&";	
				rpdcIndex++;				
			}
			rpIndex++;
		}
	});
	data = data.substring(0, data.length - 1);
	$.post(
		"${contextPath }/management/security/role/assign", 
		data, 
		function(data, status) {
			var json;
			try {
				json = jQuery.parseJSON(data);
			}
			catch(err) {
			  	json = {"statusCode":"300","message":"分配数据权限失败！","navTabId":"","rel":"","callbackType":"closeCurrent","forwardUrl":""};
			}
			navTabAjaxDone(json);
		}
	);
}
//-->
</script>

<div class="pageContent">
<form>
	<input type="hidden" name="id" value="${role.id }">
	<div class="pageFormContent" layoutH="56">
	<dl>
		<dt>角色名称：</dt>
		<dd>
			<input type="text" name="name" class="input-medium validate[required,maxSize[64] required" maxlength="64" value="${role.name }" readonly="readonly"/>
		</dd>
	</dl>
	<dl>
		<dt>描述：</dt>
		<dd>
			<input type="text" name="description" class="input-medium validate[maxSize[256]" maxlength="256" value="${role.description }" readonly="readonly"/>
		</dd>
	</dl>	
	<div class="divider"></div>
		<table class="treeTable list" width="100%">
		    <tr>
		        <td width="150">模块名称/权限</td>
		        <td width="50">操作</td>
		        <td>数据权限</td>
		    </tr>
			<c:if test="${fn:length(mpMap) < 1 }">
			<tr>
				<td colspan="3" style="color: red;text-align: center;">还未给角色授权！</td>
			</tr>
			</c:if>		    
		    <c:set var="index" value="0"></c:set>
			<c:forEach var="item" items="${mpMap }">
			<tr id="${item.key.id }">
				<td>${item.key.name }</td>	
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="rp" items="${item.value }">
			<tr id="tr_${item.key.id}" pid="${item.key.id }">
				<td>${rp.permission.name }</td>	
				<td><a iconClass="database_add" class="btnLook" href="${contextPath }/management/security/role/lookup?rp.id=${rp.id }&prefix=rolePermissions[${index }]." 
					lookupGroup="rolePermissions[${index }].rolePermissionDataControls[]" title="添加数据权限"></a>
					<a iconClass="database_delete" title="清空数据权限" href="javascript:clear('${index }');"></a></td>
				<td id="td_${index }" class="rpdcs">
					<c:set var="ri" value=""></c:set>
					<c:set var="di" value=""></c:set>
					<c:set var="dn" value=""></c:set>
					<c:forEach var="rpdc" items="${rp.rolePermissionDataControls }">
						<c:set var="ri" value="${ri }${rpdc.rolePermission.id },"></c:set>
						<c:set var="di" value="${di }${rpdc.dataControl.id },"></c:set>
						<c:set var="dn" value="${dn }${rpdc.dataControl.name },"></c:set>
					</c:forEach>
					<input name="rolePermissions[${index }].rolePermissionDataControls[].rolePermission.id" type="hidden" value="${fn:length(ri) > 0 ? fn:substring(ri,0,fn:length(ri)-1):'' }"/>
					<input name="rolePermissions[${index }].rolePermissionDataControls[].dataControl.id" type="hidden" value="${fn:length(di) > 0 ? fn:substring(di,0,fn:length(di)-1):'' }"/>			
					<input name="rolePermissions[${index }].rolePermissionDataControls[].dataControl.name" type="text" readonly="readonly" value="${fn:length(dn) > 0 ? fn:substring(dn,0,fn:length(dn)-1):'' }"/>				
				</td>
			</tr>
			<c:set var="index" value="${index + 1 }"></c:set>			
			</c:forEach>
			</c:forEach>
		</table>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" onclick="assignDC()">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>