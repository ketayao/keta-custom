<@dwz.layout_content>
<@dwz.form action="${request.contextPath}/management/index/updateBase">
	<@dwz.layout_form_content layoutH="58">
		<@dwz.label_input content="登录账号：">
			<input type="text" name="username" size="30" class="readonly" readonly="readonly" value="${login_user.username }"/>
		</@dwz.label_input>
		<@dwz.label_input content="真是姓名：">
			<input type="text" name="realname" size="30" class="readonly" readonly="readonly" value="${login_user.realname }"/>
		</@dwz.label_input>
		<@dwz.label_input content="电话：">
			<input type="text" name="phone" class="phone" size="30" value="${login_user.phone }" maxlength="32"/>
		</@dwz.label_input>
		<@dwz.label_input content="email：">
			<input type="text" name="email" class="email" maxlength="128" size="30" value="${login_user.email }"/>
		</@dwz.label_input>	
	</@dwz.layout_form_content>
			
	<@dwz.form_bar submitTitle="修改" closeTitle="关闭"/>
</@dwz.form> 
</@dwz.layout_content>