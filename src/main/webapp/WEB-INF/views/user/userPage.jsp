<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User</title>
</head>
<body>
<script type="text/javascript">
$('#company_tree').tree({
	onClick: function(node){
		if ($('#company_tree').tree('isLeaf',node.target)){
			load_user(node.text, node.id);
		}else{
			if (node.state == "open"){
				$('#company_tree').tree('collapse',node.target);
			}else{
				$('#company_tree').tree('expand',node.target);
			}
		}
			
	}
});

function load_user(text,id){
	 $('#company_id').val(id);
	 $('#user_datagrid').datagrid({
		 	title:text,
		 	url:'${pageContext.request.contextPath }/user/findByPage.do?companyId='+id,
		});
}
function unload_user(){
	 $('#company_id').val();
	 $('#user_datagrid').datagrid({
		 	title:'',
		 	url:'${pageContext.request.contextPath }/user/findByPage.do'
		});
}
</script>
<input id="company_id" hidden=true/>
<div class="easyui-layout" data-options="fit:true">
	<div  class="easyui-panel" data-options="region:'west',split:false,title:'公司列表',tools:'#companyTool'" 
		style="width:180px;">
			<ul class="easyui-tree" id="company_tree"
			data-options="url:'${pageContext.request.contextPath }/company/findAsMenu.do',method:'get',
			
			animate:true">
			
			</ul>
	</div>
	
	<div id="companyTool">
        <a class="icon-undo" onclick="unload_user()"></a>
    </div>
	
	<div data-options="region:'center',split:false" >
	<table id="user_datagrid" class="easyui-datagrid" title="" 
			data-options="rownumbers:true,checkOnSelect:false,selectOnCheck:true,singleSelect:true,
			url:'${pageContext.request.contextPath }/user/findByPage.do',
			remoteSort:false,multiSort:false,
			method:'get',pagination:true,toolbar:'#user_toolbar'">
		<thead data-options="frozen:true"> 
	        <tr> 
	            <th data-options="field:'id',checkbox:true"></th>
	            <th data-options="field:'employeeNumber',width:80,sortable:true,">工号</th>
				<th data-options="field:'name',width:100,sortable:true,">姓名</th>
	        </tr> 
	    </thead>  
		<thead>
			<tr>
				<th data-options="field:'sex',width:60,align:'center',formatter:formatSex,sortable:true">性别</th>
				<th data-options="field:'age',width:60,align:'center',sortable:true">年龄</th>
				<th data-options="field:'mobile',width:120,sortable:true">手机</th>
				<th data-options="field:'idCard',width:200,sortable:true">身份证</th>
				<th data-options="field:'email',width:180,sortable:true">电子邮箱</th>
				<th data-options="field:'jobId',width:80,sortable:true,formatter:formatJob">工作职位</th>
				<th data-options="field:'state',width:60,align:'center',formatter:formatState,sortable:true">状态</th>
				<th data-options="field:'view',width:60,align:'center',formatter:formatView">更多</th>
				<th data-options="field:'edit',width:60,align:'center',formatter:formatEdit">编辑</th>
				<th data-options="field:'remove',width:60,align:'center',formatter:formatRemove">移除</th>
			</tr>
		</thead>
	</table>
	</div>
</div>
	<div id="user_toolbar" style="padding:2px 5px;">
		<a href="#" class="easyui-linkbutton" onclick="user_add()" iconCls="icon-add" plain="true">录入</a>
		<a href="#" class="easyui-linkbutton" onclick="user_remove_checked()" iconCls="icon-remove" plain="true">批量移除</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
		<a href="#" class="easyui-linkbutton" onclick="" iconCls="fa fa-download fa-lg green" plain="true">导出</a>
		<a href="#" class="easyui-linkbutton" onclick="" iconCls="fa fa-upload fa-lg green" plain="true">导入</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
       <input id="user_search" class="easyui-textbox" data-options="
                    prompt: '请输入关键字',
                    iconWidth: 30,
                    icons: [{
                        iconCls:'icon-search',
                        handler: function(e){
                        	 var param = $('#user_search').val();
                        if (param != ''){
	                        if ( param.length > 0){
	                        	 $('#user_datagrid').datagrid({
									queryParams: {
										keyWord: param,
									}
								});
	                        }
                        }
                       
                          
                        }
                    },{
                        iconCls:'icon-clear',
                        handler: function(e){
                        $('#user_search').textbox('setValue','');
                             $('#user_datagrid').datagrid({
								  queryParams:{
									  
								  }
							  });
                        }
                    
                    }]
                    " style="width: 350px;height: 35px">
        <a href="#" class="easyui-linkbutton" onclick="user_advanced_button()" iconCls="fa fa-chevron-circle-down fa-lg green" plain="true">高级查询</a>
        <div id="user_advanced_search" hidden=true>
         <form id="user_advanced_search_form" method="post">
        	<input class="easyui-textbox" type="text" name="name" style="width: 150px;height: 30px" data-options="label:'姓名:',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="employeeNumber" style="width: 130px;height: 30px" data-options="label:'工号',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="idCard" style="width: 190px;height: 30px" data-options="label:'身份证',labelWidth:45"></input>
        	<input class="easyui-textbox" type="text" name="email" style="width: 180px;height: 30px" data-options="label:'邮箱',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="mobile" style="width: 130px;height: 30px" data-options="label:'手机',labelWidth:25"></input></br>
        	<input class="easyui-datebox" type="text" name="startBirth" style="width: 150px;height: 30px" data-options="label:'出生日期',labelWidth:56,editable:false"></input>
        	<input class="easyui-datebox" type="text" name="endBirth" style="width: 105px;height: 30px" data-options="label:'~',labelWidth:10,editable:false"></input>
        	<a href="#" onclick="user_advanced_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        	<a href="#" onclick="user_advanced_search_form_clear()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" style="width:20px"></a>
        	<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
        	<a onclick="user_advanced_button()" class="fa fa-chevron-circle-up fa-lg green" style="cursor: pointer;"></a>
        	</form>
        </div>
	</div>
	
	
	<script type="text/javascript">
		function user_advanced_search(){
			var param = $('#user_advanced_search_form').serializeObject();// to json
			if (param.name != '' || param.employeeNumber != '' ||
					param.idCard != '' || param.email != ''||
					param.mobile != '' || param.startBirth != '' ||
					param.endBirth != ''){
				$('#user_datagrid').datagrid({
					queryParams: {
						name: param.name,
						employeeNumber:param.employeeNumber,
						idCard:param.idCard,
						email : param.email,
						mobile: param.mobile,
						startBirth : param.startBirth,
						endBirth : param.endBirth,
					}
				});
			}
			
		}
		
		function user_advanced_search_form_clear(){
			  $('#user_datagrid').datagrid({
				  queryParams:{
					  
				  }
			  });
			$('#user_advanced_search_form').form('clear');
		}
		
	
		function user_advanced_button(){
			$div1 = $('#user_advanced_search');
			if($div1.is(':hidden')){
				$div1.show();
			}else if($div1.is(':visible')){
				$div1.hide();
			}
		}
	
		function formatJob(val){
			var select = '<select style="width:75px">';
			$.ajax({
				url:basePath+'job/findAsCombobox.do',
				method:'get',
				async:false,
				success:function(data){
					for(var i=0;i<data.length;i++){
						if (val == data[i].id){
							select += '<option selected="selected" value="'+"'"+data[i].id+"'"+'">'+data[i].name+'</option>';
						}else{
							select += '<option value="'+"'"+data[i].id+"'"+'">'+data[i].name+'</option>';
						}
					}
					select += '</select>';
				}
			});
			
			return select;
		}
	
		function formatSex(val){
			if (val){
				return '<i class="fa fa-male fa-2x gray"></i>';
			} else {
				return '<i class="fa fa-female fa-2x gray"></i>';
			}
		}
		
		function formatState(val){
			if (val){
				return '<i class="fa fa-check-circle fa-2x green"></i>';
			} else {
				return '<i class="fa fa-times-circle fa-2x red"></i>';
			}
		}
		
		function formatView(value,row,index){
			return '<i onclick="user_edit(false,'+"'"+row.id+"'"+')" class="fa fa-ellipsis-h fa-2x blue"></i>';
		}
		
		function formatEdit(value,row,index){
				return '<i onclick="user_edit(true,'+"'"+row.id+"'"+')" class="fa fa-edit fa-2x yellow"></i>';
		}
		function formatRemove(value,row,index){
				return '<i onclick="user_remove('+"'"+row.id+"'"+')" class="fa fa-remove fa-2x red"></i>';
		}
	
		function user_add(){
			$('#user_submit').show();
			 $('#user_form').form('clear');
			 $('#companyId').combobox('setValue',$('#company_id').val());
			 $('#user_win').window('open');
		}
		
		function user_edit(edit,id){
			if (!edit){
				$('#user_submit').hide();
			}else{
				$('#user_submit').show();
			}
			$('#user_form').form('clear');
			$('#employee_number').validatebox('disable',true);
			load_user_form(id);
			 $('#user_win').window('open');
		}
		
		function user_remove_checked(){
			var ids = [];
			var objs = $('#user_datagrid').datagrid('getChecked');
			if (null != objs && objs.length > 0){
				for(var i=0;i<objs.length;i++){
					ids.push(objs[i].id);
				}
				
				user_remove(ids.join(','));
			}else{
				centerMsg('请至少选择一个项目');
			}
		}
		
		function user_remove(ids){
			$.messager.confirm('提示', '确定删除此项目?', function(r){
				if (r){
					$.ajax({
						url:basePath+'user/delete.do',
						method:'get',
						data:{'ids':ids},
						success:function(data){
							bottomRightMsg(data.message);
							$('#user_datagrid').datagrid('reload');
						},
						error:function(data){
							centerMsg('请求有误，请稍后再试...');
						}
						
					});
				}
			
			});
		}
		
		
	</script>
	<div id="user_win" class="easyui-window" title="用户管理" data-options="border:true,modal:true,closed:true,
	iconCls:'icon-save',collapsible:false,minimizable:false,draggable:true"
	style="width:720px;margin: 5px">
		<form id="user_form" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>工号:</td>
	    			<input id="user_id" hidden=true name="id"/>
	    			<td><i id="codeState" class=""></i>&nbsp;<input  id="employee_number" class="easyui-validatebox" name="employeeNumber" style="width: 250px;height: 25px" data-options="validType:'employeeNumber',required:true"></input></td>
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
	    			<td>状态:</td>
	    			<td>
		    			<input type="radio" name="state" value="true" required style="padding-right:50px"><i class="fa fa-check-circle fa-2x green"/></input>
	    				<input type="radio" name="state" value="false" required><i class="fa fa-times-circle fa-2x red"/></input>
	    			 </td>
	    			<td>密码</td>
	    			<td><input class="easyui-passwordbox" value="123456" type="text" name="password2" style="width: 280px;height: 30px" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>入职时间:</td>
	    			<td><input  class="easyui-datebox" type="text" name="joinDate" style="width: 280px;height: 30px" data-options="editable:false,validType:'md[\'2016-11-14\']',required:true"></input></td>
	    			<td>职位</td>
	    			<td><input class="easyui-combobox" type="text" name="jobId" style="width: 280px;height: 30px" 
	    				data-options="valueField:'id',textField:'name',method:'get',
	    				editable:false,required:true,url:'${pageContext.request.contextPath }/job/findAsCombobox.do'">
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
	    			<td><input id="companyId" class="easyui-combobox" type="text" name="companyId" style="width: 280px;height: 30px" data-options="valueField:'id',textField:'text',
	    				editable:false,required:true,url:'${pageContext.request.contextPath }/company/findAsMenu.do'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>备注：</td>
	    			<td colspan="3"><textarea name="remark" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="user_submit" onclick="submit_user_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close_user_win()">关闭</a>
	    </div>
	</div>
<script type="text/javascript">
$(function(){
	
	$('#employee_number').blur(function(){
		var code = $('#employee_number').val();
		if (code.length == 7){
			$.ajax({
				url:basePath+'user/employeeNumberRepeat.do',
				method:'get',
				data:{'employeeNumber':code},
				success:function(data){
					if (data){
						$('#codeState').html('<i class="fa fa-times red"></i><i style="color:red">工号重复</i>');
						 $('#employee_number').focus();
					}else{
						$('#codeState').html('<i class="fa fa-check green"></i><i style="color:green">工号可用</i>');
						
					}
				},
				error:function(data){
					centerMsg('请求异常，请稍后再试...');
				}
			})
		}
	});
})
	
	function load_user_form(id){
		$('#user_form').form('load',basePath+'user/findById.do?id='+id);
	}

	function close_user_win(){
		$('#user_win').window('close');
	}

	function submit_user_form(){
		var url = basePath+"user/save.do";
		if (null !=$('#user_id').val() && '' != $('#user_id').val() ){
			 url = basePath+"user/update.do";
		}
		
		$('#user_form').form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	//
				}
				return isValid;	
		    },
		    success:function(data){
		    	$('#user_datagrid').datagrid('reload');
		    	var o = jQuery.parseJSON(data);
		    	bottomRightMsg(o.message);
		    	$('#user_win').window('close');
		    }
		});
	}
	

</script>

</body>
</html>