<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<script type="text/javascript">
<!--
function forbidden() {
	dialogAjaxDone('{"statusCode":"403", "message":"用户权限不足。", "navTabId":"", "forwardUrl":"", "callbackType":"closeCurrent"}');
} 
//-->
</script>
<style type="text/css" media="screen">
.my-uploadify-button {
	background:none;
	border: none;
	text-shadow: none;
	border-radius:0;
}

.uploadify:hover .my-uploadify-button {
	background:none;
	border: none;
}

.fileQueue {
	width: 400px;
	height: 150px;
	overflow: auto;
	border: 1px solid #E5E5E5;
	margin-bottom: 10px;
}
</style>

<div class="pageContent" layoutH="0">
<div class="pageFormContent">
<input id="file_upload" type="file"
	uploaderOption="{
        'auto':false,
        'successTimeout':300,
        'swf':'${contextPath}/styles/uploadify/scripts/uploadify.swf',
        'overrideEvents' : ['onDialogClose'],
        'queueID':'fileQueue',
        'fileObjName':'files',
        'uploader':'${contextPath}/management/system/icon/upload;jsessionid=<%=session.getId()%>',
        'buttonImage':'${contextPath}/styles/uploadify/img/add.jpg',
		'buttonClass':'my-uploadify-button',
        'width':'102',
        'height':'28',
        'removeComplete': false,
        'fileTypeDesc':'支持的格式：png',
        'fileTypeExts':'*.png',
        'fileSizeLimit':'1KB',
        'queueSizeLimit' : 10,
        'onSelectError':function(file, errorCode, errorMsg){
            switch(errorCode) {
                case -100:
                    alert('上传的文件数量已经超出系统限制的'+$('#file_upload').uploadify('settings','queueSizeLimit')+'个文件！');
                    break;
                case -110:
                    alert('文件 ['+file.name+'] 大小超出系统限制的'+$('#file_upload').uploadify('settings','fileSizeLimit')+'大小！');
                    break;
                case -120:
                    alert('文件 ['+file.name+'] 大小异常！');
                    break;
                case -130:
                    alert('文件 ['+file.name+'] 类型不正确！');
                    break;
            }
        },
        'onFallback':function(){
            alert('您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。');
        },
        'onUploadError' : function(file, errorCode, errorMsg, errorString) {
        	if (errorCode == 403) {
        		forbidden();
        	}
            alert(file.name + '上传失败: ' + errorMsg + errorString);
        }
	}"
/>

<div id="fileQueue" class="fileQueue"></div>
<input type="image" src="${contextPath}/styles/uploadify/img/upload.jpg" onclick="$('#file_upload').uploadify('upload', '*');"/>
<input type="image" src="${contextPath}/styles/uploadify/img/cancel.jpg" onclick="$('#file_upload').uploadify('cancel', '*');"/>
</div>
</div>
