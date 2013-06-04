<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
     
    $("#newPermission").click(function(event){
    	var $fieldset = $("#newPermissonInput");
        
        var $name = $("input[name=_name]",$fieldset);
        var $shortName = $("input[name=_shortName]",$fieldset);
        var $description = $("input[name=_description]",$fieldset);
        
        // 验证
        if (!$name.valid() && !$shortName.valid()) {
        	return false;
        } 
        
        if (!$description.valid()) {
        	return false;
        }
        
        var $toNewPermission = $("div.toNewPermission");
        // 判断是否有定义权限
        var maxId = 0;
        if ($("input:last", $toNewPermission).length > 0) {
        	maxId = parseInt($("input:last", $toNewPermission).attr("rel")) + 1;	
        }
        
        $toNewPermission.append($name.val() + '(' + $shortName.val() + ')' + '<input type="checkbox" name="permissions[' + maxId + '].shortName" value="' + $shortName.val() + '" checked="checked" rel="' + maxId + '"/>&nbsp;&nbsp;'); 
        $toNewPermission.append('<input type="hidden" name="permissions[' + maxId + '].name" value="' + $name.val() + '" rel="' + maxId + '"/>');
        $toNewPermission.append('<input type="hidden" name="permissions[' + maxId + '].description" value="' + $description.val() + '" rel="' + maxId + '"/>');
    
    	$name.val("");
    	$shortName.val("");
    	$description.val("");
    	
    	event.preventDefault();
    	event.stopPropagation();
    });
    
     $("#permissionForm").submit(function(event){
         event.preventDefault();
    	 event.stopPropagation();
    	 
     	 var $newPermissonInput = $("#newPermissonInput");
     	 $newPermissonInput.remove();
     	 if (!$(this).valid()) {
     	 	$("#permissionFormContent").append($newPermissonInput);
     	 	return false;	
     	 } 
     	 
    	 validateCallback(this, dialogReloadRel2Module);
     });
});
//-->
</script>
<a id="refreshJbsxBox2moduleTree" rel="jbsxBox2moduleTree" target="ajax" href="${contextPath}/management/security/module/tree" style="display:none;"></a>
<div class="pageContent">
<form id="permissionForm" method="post" action="${contextPath }/management/security/module/update" class="required-validate pageForm" onsubmit="">
	<input type="hidden" name="id" value="${module.id }"/>
	<input type="hidden" name="parent.id" value="${module.parent.id }"/>
	<div id="permissionFormContent" class="pageFormContent" layoutH="58">
		<fieldset>
		<legend>模块信息</legend>	
		<p>
			<label>名称：</label>
			<input type="text" name="name" class="required" size="32" maxlength="32" value="${module.name }" alt="请输入模块名称"/>
		</p>	
		<p>
			<label>优先级：</label>
			<input type="text" name="priority" class="required digits" size="2" maxlength="2" value="${module.priority }"/>
			<span class="info">&nbsp;&nbsp;默认:99</span>
		</p>		
		<p>
			<label>URL：</label>
			<input type="text" name="url" class="required" size="32" maxlength="255" alt="请输入访问地址（以/开头）" value="${module.url }"/>
		</p>		
		<p>
			<label>授权名称：</label>
			<input type="text" name="sn" class="required" size="32" maxlength="32" alt="授权名称" value="${module.sn }" readOnly=readOnly/>
		</p>		
		<p>
			<label>描述：</label>
			<input type="text" name="description" size="32" maxlength="255" alt="描述" value="${module.description }"/>
		</p>
		<p>
			<label>父模块：</label>
			<input name="parent.id" value="${module.parent.id }" type="hidden"/>
			<input class="required" name="parent.name" type="text" readonly="readonly" value="${module.parent.name }"/>
			<a class="btnLook" href="${contextPath}/management/security/module/lookupParent/${module.id}" lookupGroup="parent" mask="true" title="更改父模块" width="400">查找带回</a>			
		</p>
		</fieldset>
		<fieldset>
		<legend>自定义授权</legend>
			<div class="toNewPermission">
			<c:forEach var="p" items="${module.permissions }" varStatus="s">
			${p.name}(${p.shortName})<input type="checkbox" name="permissions[${s.index}].shortName" value="${p.shortName}" checked="checked" rel="${s.index}"/>&nbsp;&nbsp;
				     <input type="hidden" name="permissions[${s.index}].id" value="${p.id}" rel="${s.index}"/>
				     <input type="hidden" name="permissions[${s.index}].module.id" value="${p.module.id}" rel="${s.index}"/>
					 <input type="hidden" name="permissions[${s.index}].name" value="${p.name}" rel="${s.index}"/>
					 <input type="hidden" name="permissions[${s.index}].description" value="${p.description}" rel="${s.index}"/>			
			</c:forEach>
			</div>		
		</fieldset>
		<fieldset id="newPermissonInput">
		<legend>动态新增</legend>
			<p>
				<label>名称：</label>
				<input type="text" name="_name" class="required" size="32" maxlength="32" alt="请输入名称"/>
			</p>
			<p>
				<label>短名：</label>
				<input type="text" name="_shortName" class="required" size="16" maxlength="16" alt="请输入短名"/>
				<span class="info">&nbsp;&nbsp;用作授权验证</span>
			</p>
			<p>
				<label>描述：</label>
				<input type="text" name="_description" size="32" maxlength="255" alt="描述"/>
			</p>
			<div class="button" id="newPermission"><div class="buttonContent"><button type="submit">新增</button></div></div>		
		</fieldset>
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>