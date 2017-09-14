<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="user_personnal_form" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>工号:</td>
	    			<input id="user_id" hidden=true name="id"/>
	    			<td><i id="codeState" class=""></i>&nbsp;<input  id="employee_number" class="easyui-textbox" 
	    			name="employeeNumber" style="width: 250px;height: 25px" data-options="editable:false,required:true"></input></td>
	    			<td>姓名:</td>
	    			<td><input class="easyui-textbox" type="text" name="name" style="width: 280px;height: 30px" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td>
	    				<input type="radio" name="sex" value="true" required style="padding-right:50px"><i class="fa fa-male fa-2x gray"/></input>
	    				<input type="radio" name="sex" value="false" required><i class="fa fa-female fa-2x gray"/></input>
	    			</td>
	    			<td>年龄:</td>
	    			<td><input class="easyui-textbox" type="text" name="age" style="width: 280px;height: 30px" data-options="validType:'number',disabled:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>出生日期:</td>
	    			<td><input  class="easyui-datebox" type="text" name="birth" style="width: 280px;height: 30px" data-options="editable:false,validType:'md[\'2016-11-14\']',required:true"></input></td>
	    			<td>身份证:</td>
	    			<td><input  class="easyui-textbox" type="text" name="idCard" style="width: 280px;height: 30px" data-options="validType:'idCard',required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>住址</td>
	    			<td><input  class="easyui-textbox" type="text" name="address" style="width: 280px;height: 30px" data-options="value:'',required:true"></input></td>
	    			<td>手机:</td>
	    			<td><input  class="easyui-textbox" type="text" name="mobile" style="width: 280px;height: 30px" data-options="validType:'mobile',required:true"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>入职时间:</td>
	    			<td><input  class="easyui-textbox" type="text" name="joinDate" style="width: 280px;height: 30px" 
	    				data-options="editable:false"></input></td>
	    			<td>职位</td>
	    			<td><input class="easyui-textbox" type="text" value="${JOB.name }" style="width: 280px;height: 30px" 
	    				data-options="disabled:true">
	    				</input></td>
	    		</tr>
	    		<tr>
	    			<td>电子邮箱</td>
	    			<td><input class="easyui-textbox" type="text" name="email" style="width: 280px;height: 30px" data-options="validType:'email',required:true"></input></td>
	    			<td>电话:</td>
	    			<td><input  class="easyui-textbox" type="text" name="tel" style="width: 280px;height: 30px" data-options="validType:'tel',required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>任职公司</td>
	    			<td><input  class="easyui-textbox" type="text" value="${COMPANY.name }" style="width: 280px;height: 30px"
	    			 data-options="disabled:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>备注：</td>
	    			<td colspan="3"><textarea name="remark" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton red" id="user_submit" onclick="submit_personnal_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="CloseTab()">关闭</a>
	    </div>
	    </form>
<script type="text/javascript">
$(function(){
	
	$('#user_personnal_form').form('load',basePath+'user/findById.do?id=${USER.id}');
});	

function submit_personnal_form(){
	$('#user_personnal_form').form('submit', {
	    url:basePath+"user/update.do",
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
		    	$('#user_personnal_form').form('load',basePath+'user/findById.do?id=${USER.id}');
	    	}
	    	bottomRightMsg(o.message);
	    }
	});
}

</script>