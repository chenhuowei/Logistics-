<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="user_password_form" method="post">
	    	<table cellpadding="5">
	    		
	    		<tr>
	    			<input id="user_id" hidden=true name="userId" value="${USER.id }"/>
	    			<td>姓名:${USER.name }</td>
	    		</tr>
	    		<tr>
	    			<td>工号:${USER.employeeNumber }</td>
	    		</tr>
	    		<tr>
	    			<td class="red">修改密码成功后，自动退出系统，请重新登录</td>
	    		</tr>
	    		<tr>
	    			<td>输入原密码:<input  class="easyui-passwordbox" type="text" name="oldPassword" 
	    			style="width: 280px;height: 30px" 
	    			data-options="minLength:6,required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>输入新密码:<input  class="easyui-passwordbox" type="text" name="newPassword" id="newPassword" 
	    			style="width: 280px;height: 30px" data-options="minLength:6,required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>重复新密码:<input  class="easyui-passwordbox" type="text" name="newPassword2" 
	    			style="width: 280px;height: 30px"  validType="equalTo['#newPassword']"
	    			data-options="value:'',required:true"></input></td>
	    		</tr>
	    		
	    		
	    		
	    	</table>
	    <div style="text-align:left;padding:5px;margin-left: 200px;margin-top: 30px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton red" id="user_submit" onclick="submit_password_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="CloseTab()">关闭</a>
	    </div>
	    </form>
<script type="text/javascript">

function submit_password_form(){
	$('#user_password_form').form('submit', {
	    url:basePath+"user/updatePassword.do",
	    onSubmit: function(){
			var isValid = $(this).form('validate');
			if (!isValid){
				$.messager.progress('close');	//
			}
			return isValid;	
	    },
	    success:function(data){
	    	var o = jQuery.parseJSON(data);
	    	if (o.success){
	    	bottomRightMsg(o.message);
	    		window.location.href=basePath+"base/logout.do";
	    	}else{
	    		$("input[name='oldPassword']").val('');
	    		$("input[name='newPassword']").val('');
	    		$("input[name='newPassword2']").val('');
	    		centerMsg(o.message);
	    	}
	    }
	});
}

</script>