<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Job</title>
</head>
<body>

	<table id="job_datagrid" class="easyui-datagrid" title="" 
			style=""
			data-options="rownumbers:true,checkOnSelect:false,selectOnCheck:true,singleSelect:true,
			url:'${pageContext.request.contextPath }/job/findByPage.do',
			remoteSort:false,multiSort:false,
			method:'get',pagination:true,toolbar:'#job_toolbar'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th data-options="field:'name',width:150,sortable:true">职位名称</th>
				<th data-options="field:'remark',width:300,sortable:true">备注</th>
				<th data-options="field:'state',width:60,align:'center',formatter:formatState,sortable:true">状态</th>
				<th data-options="field:'view',width:60,align:'center',formatter:formatView">更多</th>
				<th data-options="field:'edit',width:60,align:'center',formatter:formatEdit">编辑</th>
				<th data-options="field:'remove',width:60,align:'center',formatter:formatRemove">移除</th>
			</tr>
		</thead>
	</table>
	
	<div id="job_toolbar" style="padding:2px 5px;">
		<a href="#" class="easyui-linkbutton" onclick="job_add()" iconCls="icon-add" plain="true">录入</a>
		<a href="#" class="easyui-linkbutton" onclick="job_remove_checked()" iconCls="icon-remove" plain="true">批量移除</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
       <input id="job_search" class="easyui-textbox" data-options="
                    prompt: '请输入关键字',
                    iconWidth: 30,
                    icons: [{
                        iconCls:'icon-search',
                        handler: function(e){
                        	 var param = $('#job_search').val();
                        if (param != ''){
	                        if ( param.length > 0){
	                        	 $('#job_datagrid').datagrid({
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
                        $('#job_search').textbox('setValue','');
                             $('#job_datagrid').datagrid({
								  queryParams:{
									  
								  }
							  });
                        }
                    
                    }]
                    " style="width: 350px;height: 35px">
        <a href="#" class="easyui-linkbutton" onclick="job_advanced_button()" iconCls="fa fa-chevron-circle-down fa-lg green" plain="true">高级查询</a>
        <div id="job_advanced_search" hidden=true>
         <form id="job_advanced_search_form" method="post">
        	<input class="easyui-textbox" type="text" name="name" style="width: 150px;height: 30px" data-options="label:'名称:',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="manager" style="width: 130px;height: 30px" data-options="label:'工号',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="managerNumber" style="width: 190px;height: 30px" data-options="label:'负责人',labelWidth:45"></input>
        	<a href="#" onclick="job_advanced_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        	<a href="#" onclick="job_advanced_search_form_clear()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" style="width:20px"></a>
        	<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
        	<a onclick="job_advanced_button()" class="fa fa-chevron-circle-up fa-lg" style="cursor: pointer;"></a>
        	</form>
        </div>
	</div>
	
	
	<script type="text/javascript">
		function job_advanced_search(){
			var param = $('#job_advanced_search_form').serializeObject();// to json
			if (param.name != '' || param.head != '' ||
					param.headNumber != '' || param.email != ''||
				 param.tel != '' 
					){
				$('#job_datagrid').datagrid({
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
		
		function job_advanced_search_form_clear(){
			  $('#job_datagrid').datagrid({
				  queryParams:{
					  
				  }
			  });
			$('#job_advanced_search_form').form('clear');
		}
		
	
		function job_advanced_button(){
			alert('暂未开放');
			return ;
			$div1 = $('#job_advanced_search');
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
			return '<i onclick="job_edit(false,'+"'"+row.id+"'"+')" class="fa fa-ellipsis-h fa-2x blue"></i>';
		}
		
		function formatEdit(value,row,index){
				return '<i onclick="job_edit(true,'+"'"+row.id+"'"+')" class="fa fa-edit fa-2x yellow"></i>';
		}
		function formatRemove(value,row,index){
				return '<i onclick="job_remove('+"'"+row.id+"'"+')" class="fa fa-remove fa-2x red"></i>';
		}
	
		function job_add(){
			$('#job_submit').show();
			 $('#job_form').form('clear');
			 $('#job_win').window('open');
		}
		
		function job_edit(edit,id){
			if (!edit){
				$('#job_submit').hide();
			}else{
				$('#job_submit').show();
			}
			$('#job_form').form('clear');
			load_job_form(id);
			 $('#job_win').window('open');
		}
		
		function job_remove_checked(){
			var ids = [];
			var objs = $('#job_datagrid').datagrid('getChecked');
			if (null != objs && objs.length > 0){
				for(var i=0;i<objs.length;i++){
					ids.push(objs[i].id);
				}
				
				job_remove(ids.join(','));
			}else{
				centerMsg('请至少选择一个项目');
			}
		}
		
		function job_remove(ids){
			$.messager.confirm('提示', '确定删除此项目?', function(r){
				if (r){
					$.ajax({
						url:basePath+'job/delete.do',
						method:'get',
						data:{'ids':ids},
						success:function(data){
							bottomRightMsg(data.message);
							$('#job_datagrid').datagrid('reload');
						},
						error:function(data){
							centerMsg('请求有误，请稍后再试...');
						}
						
					});
				}
			
			});
		}
		
		
	</script>
	<div id="job_win" class="easyui-window" title="职位管理" data-options="border:true,modal:true,closed:true,
	iconCls:'icon-save',collapsible:false,minimizable:false,layout:'fit'"
	style="width:720px;margin: 5px">
		<form id="job_form" method="post">
			<input hidden=true name="id" id="job_id"/>
	    	<table cellpadding="5">
	    		
	    		<tr>
	    			<td>职位名称：</td>
	    			<td><input  class="easyui-textbox" type="text" name="name" style="width: 280px;height: 30px" data-options="value:'',required:true"></input></td>
	    			<td>状态:</td>
	    			<td>
		    			<input type="radio" name="state" value="true" required style="padding-right:50px"><i class="fa fa-check-circle fa-2x green"/></input>
	    				<input type="radio" name="state" value="false" required><i class="fa fa-times-circle fa-2x red"/></input>
	    			 </td>
	    		</tr>
	    		<tr>
	    			<td>备注：</td>
	    			<td colspan="3"><textarea name="remark" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="job_submit" onclick="submit_job_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close_job_win()">关闭</a>
	    </div>
	</div>
<script type="text/javascript">
	
	function load_job_form(id){
		$('#job_form').form('load',basePath+'job/findById.do?id='+id);
	}

	function close_job_win(){
		$('#job_win').window('close');
	}

	function submit_job_form(){
		var url = basePath+"job/save.do";
		if (null !=$('#job_id').val() && '' != $('#job_id').val() ){
			 url = basePath+"job/update.do";
		}
		
		$('#job_form').form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	//
				}
				return isValid;	
		    },
		    success:function(data){
		    	$('#job_datagrid').datagrid('reload');
		    	var o = jQuery.parseJSON(data);
		    	bottomRightMsg(o.message);
		    	$('#job_win').window('close');
		    }
		});
	}
	

</script>

</body>
</html>