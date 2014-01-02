<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
	var $fieldset = $("#newPermissonInput");
    
    var $name = $("input[name=_name]",$fieldset);
    var $sn = $("input[name=_sn]",$fieldset);
    var $description = $("input[name=_description]",$fieldset);
    
    $("#newPermission").click(function(event){
        var nameValidate = !$name.validationEngine('validate');
        var snValidate = !$sn.validationEngine('validate');
        var descriptionValidate = !$description.validationEngine('validate');
        
     	// 验证
        if (!nameValidate || !snValidate || !descriptionValidate) {
        	return false;
        }
        
        var $toNewPermission = $("div.toNewPermission");
        // 判断是否有定义权限
        var maxId = 0;
        if ($("input:last", $toNewPermission).length > 0) {
        	maxId = parseInt($("input:last", $toNewPermission).attr("rel")) + 1;	
        }
        
        $toNewPermission.append($name.val() + '(' + $sn.val() + ')' + '<input type="checkbox" name="permissions[' + maxId + '].sn" value="' + $sn.val() + '" checked="checked" rel="' + maxId + '"/>&nbsp;&nbsp;'); 
        $toNewPermission.append('<input type="hidden" name="permissions[' + maxId + '].name" value="' + $name.val() + '" rel="' + maxId + '"/>');
        $toNewPermission.append('<input type="hidden" name="permissions[' + maxId + '].description" value="' + $description.val() + '" rel="' + maxId + '"/>');
    
    	$name.val("");
    	$sn.val("");
    	$description.val("");
    	
    	event.preventDefault();
    	event.stopPropagation();
    });
    
     $("#permissionForm").submit(function(event){
         event.preventDefault();
    	 event.stopPropagation();
		
    	 var _nameClass = $name.attr("class");
    	 var _snClass = $sn.attr("class");
    	 var _descriptionClass = $description.attr("class");
    	 
    	 $name.attr("class", "required");
    	 $sn.attr("class", "required");
    	 
     	 var result = validateCallback(this, dialogReloadRel2Module);
     	 if (!result) {
     		$name.attr("class", _nameClass);
     		$sn.attr("class", _snClass);
     		$description.attr("class", _descriptionClass);
     	 }
    	 return result;
     });
});
//-->
</script>
<a id="refreshJbsxBox2moduleTree" rel="jbsxBox2moduleTree" target="ajax" href="${contextPath}/management/security/module/tree" style="display:none;"></a>
<div class="pageContent">
<form id="permissionForm" method="post" action="${contextPath }/management/security/module/create" class="required-validate pageForm" onsubmit="">
	<input type="hidden" name="parent.id" value="${parentModuleId }"/>
	<div id="permissionFormContent" class="pageFormContent" layoutH="58">
		<fieldset>
		<legend>模块信息</legend>	
		<p>
			<label>名称：</label>
			<input type="text" name="name" class="input-medium validate[required,maxSize[64]] required" maxlength="64"/>
		</p>	
		<p>
			<label>优先级：</label>
			<input type="text" name="priority" class="validate[required,custom[integer],min[1],max[999]] required" value="999" maxlength="3" style="width: 80px;"/>
			<span class="info">（越小越靠前）</span>
		</p>		
		<p>
			<label>URL：</label>
			<input type="text" name="url" class="input-medium validate[required,maxSize[256]] required" maxlength="256" alt="以#、/或者http开头"/>
		</p>		
		<p>
			<label>授权名称：</label>
			<input type="text" name="sn" class="input-medium validate[required,maxSize[32]] required" maxlength="32"/>
		</p>
		<p>
			<label>模块类名：</label>
			<input type="text" name="className" class="input-medium" maxlength="256"/>
		</p>				
		<p class="nowrap">
			<label>描述：</label>
			<textarea name="description" cols="29" rows="3" maxlength="256" class="input-medium textarea-scroll"></textarea>
		</p>		
		</fieldset>
		<fieldset>
		<legend>自定义授权</legend>
			<div class="toNewPermission">
			看(show)<input type="checkbox" name="permissions[0].sn" value="show" checked="checked" rel="0"/>&nbsp;&nbsp;
	         <input type="hidden" name="permissions[0].name" value="看" rel="0"/>			
			增(save)<input type="checkbox" name="permissions[1].sn" value="save" checked="checked" rel="1"/>&nbsp;&nbsp;
	         <input type="hidden" name="permissions[1].name" value="增" rel="1"/>
			删(delete)<input type="checkbox" name="permissions[2].sn" value="delete" checked="checked" rel="2"/>&nbsp;&nbsp;
			<input type="hidden" name="permissions[2].name" value="删" rel="2"/>
			查(view)<input type="checkbox" name="permissions[3].sn" value="view" checked="checked" rel="3"/>&nbsp;&nbsp;
			<input type="hidden" name="permissions[3].name" value="查" rel="3"/>
			改(edit)<input type="checkbox" name="permissions[4].sn" value="edit" checked="checked" rel="4"/>&nbsp;&nbsp;
			<input type="hidden" name="permissions[4].name" value="改" rel="4"/>
			</div>		
		</fieldset>
		<fieldset id="newPermissonInput">
		<legend>动态新增</legend>
			<p>
				<label>名称：</label>
				<input type="text" name="_name" class="input-medium validate[required,maxSize[64]] required" maxlength="64"/>
			</p>
			<p>
				<label>操作名称：</label>
				<input type="text" name="_sn" class="input-medium validate[required,maxSize[32]] required" maxlength="32"/>
			</p>
			<p>
				<label>描述：</label>
				<input type="text" name="_description" class="input-medium" maxlength="256"/>
			</p>				
			<div class="button"><div class="buttonContent"><button id="newPermission">新增</button></div></div>		
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