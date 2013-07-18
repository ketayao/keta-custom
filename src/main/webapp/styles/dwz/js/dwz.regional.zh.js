/**
 * @author ZhangHuihua@msn.com
 */
(function($){
	// DWZ regional
	$.setRegional("datepicker", {
		dayNames: ['日', '一', '二', '三', '四', '五', '六'],
		monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
	});
	$.setRegional("alertMsg", {
		title:{error:"错误", info:"提示", warn:"警告", correct:"成功", confirm:"确认提示"},
		butMsg:{ok:"确定", yes:"是", no:"否", cancel:"取消"}
	});
})(jQuery);