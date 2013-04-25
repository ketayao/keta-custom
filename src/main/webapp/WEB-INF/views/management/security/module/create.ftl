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
     	 
    	 return validateCallback(this, dialogReloadRel);
     });
});
//-->
</script>
<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/security/module/create" id="permissionForm" onsubmit="">
	<input type="hidden" name="parent.id" value="${parentModuleId }"/>
	<@dwz.layout_form_content layoutH="58" id="permissionFormContent">
	<@dwz.fieldset title="自定义授权">
		<@dwz.label_input content="名称：">
			<input type="text" name="name" class="required" size="32" maxlength="32" alt="请输入模块名称"/>
		</@dwz.label_input>	
		<@dwz.label_input content="优先级：">
			<input type="text" name="priority" class="required digits" size="2" value="99" maxlength="2"/>
			<@dwz.span_comment content="&nbsp;&nbsp;默认:99"/>
		</@dwz.label_input>					
		<@dwz.label_input content="URL：">
			<input type="text" name="url" class="required" size="32" maxlength="255" alt="请输入访问地址（以/开头）"/>
		</@dwz.label_input>			
		<@dwz.label_input content="授权名称：">
			<input type="text" name="sn" class="required" size="32" maxlength="32" alt="授权名称"/>
		</@dwz.label_input>	
		<@dwz.label_input content="描述：">
			<input type="text" name="description" size="32" maxlength="255" alt="描述"/>
		</@dwz.label_input>
	</@dwz.fieldset>			
	<@dwz.fieldset title="自定义授权">
		<div class="toNewPermission">
		增(save)<input type="checkbox" name="permissions[0].shortName" value="save" checked="checked" rel="0"/>&nbsp;&nbsp;
         <input type="hidden" name="permissions[0].name" value="增" rel="0"/>
		删(delete)<input type="checkbox" name="permissions[1].shortName" value="delete" checked="checked" rel="1"/>&nbsp;&nbsp;
		<input type="hidden" name="permissions[1].name" value="删" rel="1"/>
		查(view)<input type="checkbox" name="permissions[2].shortName" value="view" checked="checked" rel="2"/>&nbsp;&nbsp;
		<input type="hidden" name="permissions[2].name" value="查" rel="2"/>
		改(edit)<input type="checkbox" name="permissions[3].shortName" value="edit" checked="checked" rel="3"/>&nbsp;&nbsp;
		<input type="hidden" name="permissions[3].name" value="改" rel="3"/>
		</div>
	</@dwz.fieldset>
	<@dwz.fieldset title="动态新增" id="newPermissonInput">
		<@dwz.label_input content="名称：">
			<input type="text" name="_name" class="required" size="32" maxlength="32" alt="请输入名称"/>
		</@dwz.label_input>	
		<@dwz.label_input content="短名：">
			<input type="text" name="_shortName" class="required" size="16" maxlength="16" alt="请输入短名"/>
			<@dwz.span_comment content="&nbsp;&nbsp;用作授权验证"/>
		</@dwz.label_input>
		<@dwz.label_input content="描述：">
			<input type="text" name="_description" size="32" maxlength="255" alt="描述"/>
		</@dwz.label_input>		
		<@dwz.button title="新增" status="button" id="newPermission"/>
	</@dwz.fieldset>	
	</@dwz.layout_form_content>
	<@dwz.form_bar submitTitle="确定" closeTitle="关闭"/>	
</@dwz.form>
</@dwz.layout_content>