<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Company</title>
</head>
<body>

	<table id="company_datagrid" class="easyui-datagrid" title="" 
			style=""
			data-options="rownumbers:true,layout:'fit',checkOnSelect:false,selectOnCheck:true,singleSelect:true,
			url:'${pageContext.request.contextPath }/company/findByPage.do',
			remoteSort:false,multiSort:false,
			method:'get',pagination:true,toolbar:'#company_toolbar'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th data-options="field:'name',width:150,sortable:true">名称</th>
				<th data-options="field:'head',width:60,sortable:true">负责人</th>
				<th data-options="field:'headMobile',width:100,sortable:true">手机</th>
				<th data-options="field:'headNumber',width:80,sortable:true">工号</th>
				<th data-options="field:'address',width:200,sortable:true">地址</th>
				<th data-options="field:'tel',width:100,sortable:true">电话</th>
				<th data-options="field:'email',width:180,sortable:true">电子邮箱</th>
				<th data-options="field:'state',width:60,align:'center',formatter:formatState,sortable:true">状态</th>
				<th data-options="field:'view',width:60,align:'center',formatter:formatView">更多</th>
				<th data-options="field:'edit',width:60,align:'center',formatter:formatEdit">编辑</th>
				<th data-options="field:'remove',width:60,align:'center',formatter:formatRemove">移除</th>
			</tr>
		</thead>
	</table>
	
	<div id="company_toolbar" style="padding:2px 5px;">
		<a href="#" class="easyui-linkbutton" onclick="company_add()" iconCls="icon-add" plain="true">录入</a>
		<a href="#" class="easyui-linkbutton" onclick="company_remove_checked()" iconCls="icon-remove" plain="true">批量移除</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
       <input id="company_search" class="easyui-textbox" data-options="
                    prompt: '请输入关键字',
                    iconWidth: 30,
                    icons: [{
                        iconCls:'icon-search',
                        handler: function(e){
                        	 var param = $('#company_search').val();
                        if (param != ''){
	                        if ( param.length > 0){
	                        	 $('#company_datagrid').datagrid({
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
                        $('#company_search').textbox('setValue','');
                             $('#company_datagrid').datagrid({
								  queryParams:{
									  
								  }
							  });
                        }
                    
                    }]
                    " style="width: 350px;height: 35px">
        <a href="#" class="easyui-linkbutton" onclick="company_advanced_button()" iconCls="fa fa-chevron-circle-down fa-lg green" plain="true">高级查询</a>
        <div id="company_advanced_search" hidden=true>
         <form id="company_advanced_search_form" method="post">
        	<input class="easyui-textbox" type="text" name="name" style="width: 150px;height: 30px" data-options="label:'名称:',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="headNumber" style="width: 130px;height: 30px" data-options="label:'工号',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="head" style="width: 190px;height: 30px" data-options="label:'负责人',labelWidth:45"></input>
        	<input class="easyui-textbox" type="text" name="email" style="width: 180px;height: 30px" data-options="label:'邮箱',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="tel" style="width: 130px;height: 30px" data-options="label:'电话',labelWidth:25"></input>
        	<a href="#" onclick="company_advanced_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        	<a href="#" onclick="company_advanced_search_form_clear()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" style="width:20px"></a>
        	<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
        	<a onclick="company_advanced_button()" class="fa fa-chevron-circle-up fa-lg" style="cursor: pointer;"></a>
        	</form>
        </div>
	</div>
	
	
	<script type="text/javascript">
		function company_advanced_search(){
			var param = $('#company_advanced_search_form').serializeObject();// to json
			if (param.name != '' || param.head != '' ||
					param.headNumber != '' || param.email != ''||
				 param.tel != '' 
					){
				$('#company_datagrid').datagrid({
					queryParams: {
						name: param.name,
						head:param.head,
						headNumber:param.headNumber,
						email : param.email,
						tel: param.tel,
					}
				});
			}
			
		}
		
		function company_advanced_search_form_clear(){
			  $('#company_datagrid').datagrid({
				  queryParams:{
					  
				  }
			  });
			$('#company_advanced_search_form').form('clear');
		}
		
	
		function company_advanced_button(){
			$div1 = $('#company_advanced_search');
			if($div1.is(':hidden')){
				$div1.show();
			}else if($div1.is(':visible')){
				$div1.hide();
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
			return '<i onclick="company_edit(false,'+"'"+row.id+"'"+')" class="fa fa-ellipsis-h fa-2x blue"></i>';
		}
		
		function formatEdit(value,row,index){
				return '<i onclick="company_edit(true,'+"'"+row.id+"'"+')" class="fa fa-edit fa-2x yellow"></i>';
		}
		function formatRemove(value,row,index){
				return '<i onclick="company_remove('+"'"+row.id+"'"+')" class="fa fa-remove fa-2x red"></i>';
		}
	
		function company_add(){
			$('#company_submit').show();
			 $('#company_form').form('clear');
			 $('#company_win').window('open');
		}
		
		function company_edit(edit,id){
			if (!edit){
				$('#company_submit').hide();
			}else{
				$('#company_submit').show();
			}
			$('#company_form').form('clear');
			load_company_form(id);
			 $('#company_win').window('open');
		}
		
		function company_remove_checked(){
			var ids = [];
			var objs = $('#company_datagrid').datagrid('getChecked');
			if (null != objs && objs.length > 0){
				for(var i=0;i<objs.length;i++){
					ids.push(objs[i].id);
				}
				
				company_remove(ids.join(','));
			}else{
				centerMsg('请至少选择一个项目');
			}
		}
		
		function company_remove(ids){
			$.messager.confirm('提示', '确定删除此项目?', function(r){
				if (r){
					$.ajax({
						url:basePath+'company/delete.do',
						method:'get',
						data:{'ids':ids},
						success:function(data){
							bottomRightMsg(data.message);
							$('#company_datagrid').datagrid('reload');
						},
						error:function(data){
							centerMsg('请求有误，请稍后再试...');
						}
						
					});
				}
			
			});
		}
		
		
	</script>
	<div id="company_win" class="easyui-window" title="公司管理" data-options="border:true,modal:true,closed:true,
	iconCls:'icon-save',collapsible:false,minimizable:false,layout:'fit'"
	style="width:720px;margin: 5px">
		<form id="company_form" method="post">
			<input hidden=true name="id" id="company_id"/>
	    	<table cellpadding="5">
	    		
	    		<tr>
	    			<td>公司名称：</td>
	    			<td><input  class="easyui-textbox" type="text" name="name" style="width: 280px;height: 30px" data-options="value:'',required:true"></input></td>
	    			<td>状态:</td>
	    			<td>
		    			<input type="radio" name="state" value="true" required style="padding-right:50px"><i class="fa fa-check-circle fa-2x green"/></input>
	    				<input type="radio" name="state" value="false" required><i class="fa fa-times-circle fa-2x red"/></input>
	    			 </td>
	    		</tr>
	    		<tr>
	    			<td>负责人:</td>
	    			<td><input  class="easyui-textbox" type="text" name="head" style="width: 280px;height: 30px" data-options="validType:'',required:true"></input></td>
	    			
	    		</tr>
	    		<tr>
	    			<td>工号</td>
	    			<td><input  class="easyui-textbox" type="text" name="headNumber" style="width: 280px;height: 30px" data-options="value:'',required:true"></input></td>
	    			<td>手机:</td>
	    			<td><input  class="easyui-textbox" type="text" name="headMobile" style="width: 280px;height: 30px" data-options="validType:'mobile',required:true"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>电子邮箱</td>
	    			<td><input class="easyui-textbox" type="text" name="email" style="width: 280px;height: 30px" data-options="validType:'email',required:true"></input></td>
	    			<td>电话:</td>
	    			<td><input  class="easyui-textbox" type="text" name="tel" style="width: 280px;height: 30px" data-options="validType:'tel',required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>地址：</td>
	    			<td colspan="3"><textarea name="address" cols="70" rows="2"></textarea></td>
	    		</tr>
	    		<tr>
	    			<td>备注：</td>
	    			<td colspan="3"><textarea name="info" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="company_submit" onclick="submit_company_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close_company_win()">关闭</a>
	    </div>
	</div>
<script type="text/javascript">
	
	function load_company_form(id){
		$('#company_form').form('load',basePath+'company/findById.do?id='+id);
	}

	function close_company_win(){
		$('#company_win').window('close');
	}

	function submit_company_form(){
		var url = basePath+"company/save.do";
		if (null !=$('#company_id').val() && '' != $('#company_id').val() ){
			 url = basePath+"company/update.do";
		}
		
		$('#company_form').form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	//
				}
				return isValid;	
		    },
		    success:function(data){
		    	$('#company_datagrid').datagrid('reload');
		    	var o = jQuery.parseJSON(data);
		    	bottomRightMsg(o.message);
		    	$('#company_win').window('close');
		    }
		});
	}
	

</script>

</body>
</html>