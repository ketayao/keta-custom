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

<div class="pageContent">
<div class="pageFormContent" layoutH="0">
<input id="file_upload" type="file"
	uploaderOption="{
		//开启调试
        'debug' : false,
        //是否自动上传
        'auto':false,
        //超时时间（秒）
        'successTimeout':300,
        //附带值
        'formData':{
            'requestFrom':'fromUploadify',
        },
        //flash
        'swf':'${contextPath}/styles/uploadify/scripts/uploadify.swf',
        //不执行默认的onSelect事件
        'overrideEvents' : ['onDialogClose'],
        //文件选择后的容器ID
        'queueID':'fileQueue',
        //服务器端脚本使用的文件对象的名称 $_FILES个['upload']
        'fileObjName':'files',
        //上传处理程序
        'uploader':'${contextPath}/management/component/resource/upload;jsessionid=<%=session.getId()%>?storeType=${storeType }',
        //浏览按钮的背景图片路径
        'buttonImage':'${contextPath}/styles/uploadify/img/add.jpg',
		'buttonClass':'my-uploadify-button',
        //浏览按钮的宽度
        'width':'102',
        //浏览按钮的高度
        'height':'28',
        //expressInstall.swf文件的路径。
        //'expressInstall':'expressInstall.swf',
        'removeComplete': false,
        //在浏览窗口底部的文件类型下拉菜单中显示的文本
        'fileTypeDesc':'支持的格式：',
        //允许上传的文件后缀
        //'fileTypeExts':'*.jpg;*.jpge;*.gif;*.png',
        //上传文件的大小限制
        'fileSizeLimit':'1MB',
        //上传数量
        'queueSizeLimit' : 10,
        //每次更新上载的文件的进展
        'onUploadProgress' : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {
             //有时候上传进度什么想自己个性化控制，可以利用这个方法
             //使用方法见官方说明
        },
        //选择上传文件后调用
        'onSelect' : function(file) {
                   
        },
        //返回一个错误，选择文件的时候触发
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
        //检测FLASH失败调用
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