function jumpClick($this, isChecked) {
	var $thisAllchk = $this.next("span[ref='allChk']");
	if (isChecked) {
		$this.attr("class", "button chk checkbox_true_full");
		$thisAllchk.attr("class", "button chk checkbox_false_full");
		$thisAllchk.click();
		$thisAllchk.attr("class", "button chk checkbox_true_full");
	} else {
		$this.attr("class", "button chk checkbox_false_full");
		$thisAllchk.attr("class", "button chk checkbox_true_full");
		$thisAllchk.click();
		$thisAllchk.attr("class", "button chk checkbox_false_full");
	}
	
	var $tr = $this.parent().parent();
	var id = $tr.attr("id");
	
	var $cTr = $("tr[pid='" + id + "']");
	var $cTreeChk = $("span[ref='treeChk']", $cTr);
	var $cAllChk = $("span[ref='allChk']", $cTr);
	
	$cTreeChk.each(function(){
		if (isChecked) {
			$(this).attr("class", "button chk checkbox_true_full");
		} else {
			$(this).attr("class", "button chk checkbox_false_full");
		}
	});
	
	$cAllChk.each(function(){
		if (isChecked) {
			$(this).attr("class", "button chk checkbox_false_full");
			$(this).click();
			$(this).attr("class", "button chk checkbox_true_full");
		} else {
			$(this).attr("class", "button chk checkbox_true_full");
			$(this).click();
			$(this).attr("class", "button chk checkbox_false_full");
		}
	});
	
	$cTr.each(function(){
		var $ccTr = $("tr[pid='" + $(this).attr("id") + "']");
		if ($ccTr.length > 0) {
			$ccTr.each(function(){
				var $c = $("span[ref='treeChk']", $ccTr);
				jumpClick($c, isChecked);			
			});
		}
	});
}

function initRolePage() {
	// 给全选加入事件
    $(".setAll").click(function(){
    	var isChecked = null;
    	
    	var chkClass = $(this).attr("class").split(" ")[2];
    	if (chkClass.indexOf("true") > -1) {
    		isChecked = false;
    		
    		$(this).attr("class", "button chk checkbox_false_full setAll");
    	} else {
    		isChecked = true;
    		
    		$(this).attr("class", "button chk checkbox_true_full setAll");
    	}
    	 
    	var $td = $(this).parent().nextAll("td");
    	var $inputSpan = $(".inputValueRole", $td);
		$("input[type=checkbox]", $inputSpan).each(function(){
			if (isChecked == true) {
				$(this).attr("checked", "checked");
			} else {
				$(this).removeAttr("checked");
			}
		});
    });
	// 初始化permission
	$(".inputValueRole input[type=checkbox]").click(function(){
		var isChecked = $(this).is(":checked");
		var $td = $(this).parent().parent().prevAll("td");
		var $chk = $(".setAll", $td);
		if (isChecked == false) {
			$chk.attr("class", "button chk checkbox_false_full setAll");
		}
	});
	//初始化treeTable
	var option = {
	        theme:'default',
	        expandLevel : 3
    };
    $('.treeTable').treeTable(option);
    
    //初始化checkbox_
    $("span[class*='checkbox_']").each(function(){  	
    	$(this).mouseover(function(){
    		var chkClass = $(this).attr("class").split(" ")[2];
    		if(chkClass.indexOf("_focus") < 0) {
    			if ($(this).attr("class").indexOf("setAll") > -1) {
    				$(this).attr("class", "button chk " + chkClass + "_focus" + " setAll");    				
    			} else {
    				$(this).attr("class", "button chk " + chkClass + "_focus");
    			}
        	}
		});
    	
    	$(this).mouseout(function(){
    		var chkClass = $(this).attr("class").split(" ")[2];
    		if(chkClass.indexOf("_focus") > -1) {
    			if ($(this).attr("class").indexOf("setAll") > -1) {
    				$(this).attr("class", "button chk " + chkClass.substring(0, chkClass.length-6) + " setAll");    				
    			} else {
    				$(this).attr("class", "button chk " + chkClass.substring(0, chkClass.length-6));
    			}
        	}
		});

    	// 给treeTable的chk添加click事件
    	if ($(this).attr("class").indexOf("setAll") < 0) {
        	$(this).click(function(){
            	var isChecked = null;
            	var chkClass = $(this).attr("class").split(" ")[2];
            	if (chkClass.indexOf("true") > -1) {
            		isChecked = false;
            		$(this).attr("class", "button chk checkbox_false_full");
            	} else {
            		isChecked = true;
            		$(this).attr("class", "button chk checkbox_true_full");
            	}
            	
            	var $thisAllchk = $(this).next("span[ref='allChk']");
    			if (isChecked) {
    				$thisAllchk.attr("class", "button chk checkbox_false_full");
    				$thisAllchk.click();
    				$thisAllchk.attr("class", "button chk checkbox_true_full");
    			} else {
    				$thisAllchk.attr("class", "button chk checkbox_true_full");
    				$thisAllchk.click();
    				$thisAllchk.attr("class", "button chk checkbox_false_full");
    			}
        		
        		jumpClick($(this), isChecked);
    		});
    	}
    });
}