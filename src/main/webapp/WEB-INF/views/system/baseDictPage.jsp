<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BaseDict</title>
</head>
<body>

	<table id="baseDict_datagrid" class="easyui-datagrid" title="" 
			style=""
			data-options="rownumbers:true,checkOnSelect:false,selectOnCheck:false,singleSelect:true,
			url:'${pageContext.request.contextPath }/baseDict/findByPage.do',
			remoteSort:false,multiSort:false,
			method:'get',pagination:true,toolbar:'#baseDict_toolbar'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th data-options="field:'type',width:150,sortable:true">字典类型</th>
				<th data-options="field:'name',width:150,sortable:true">字典名称</th>
				<th data-options="field:'value',width:150,sortable:true">字典值</th>
				<th data-options="field:'remark',width:300">备注</th>
				<th data-options="field:'state',width:60,align:'center',formatter:formatState,sortable:true">状态</th>
				<th data-options="field:'view',width:60,align:'center',formatter:formatView">更多</th>
				<th data-options="field:'edit',width:60,align:'center',formatter:formatEdit">编辑</th>
				<th data-options="field:'remove',width:60,align:'center',formatter:formatRemove">移除</th>
			</tr>
		</thead>
	</table>
	
	<div id="baseDict_toolbar" style="padding:2px 5px;">
		<a href="#" class="easyui-linkbutton" onclick="baseDict_add()" iconCls="icon-add" plain="true">录入</a>
		<a href="#" class="easyui-linkbutton" onclick="baseDict_remove_checked()" iconCls="icon-remove" plain="true">批量移除</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
       <input id="baseDict_search" class="easyui-textbox" data-options="
                    prompt: '请输入关键字',
                    iconWidth: 30,
                    icons: [{
                        iconCls:'icon-search',
                        handler: function(e){
                        	 var param = $('#baseDict_search').val();
                        if (param != ''){
	                        if ( param.length > 0){
	                        	 $('#baseDict_datagrid').datagrid({
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
                        $('#baseDict_search').textbox('setValue','');
                             $('#baseDict_datagrid').datagrid({
								  queryParams:{
									  
								  }
							  });
                        }
                    
                    }]
                    " style="width: 350px;height: 35px">
        <a href="#" class="easyui-linkbutton" onclick="baseDict_advanced_button()" iconCls="fa fa-chevron-circle-down fa-lg green" plain="true">高级查询</a>
        <div id="baseDict_advanced_search" hidden=true>
         <form id="baseDict_advanced_search_form" method="post">
        	<input class="easyui-textbox" type="text" name="type" style="width: 150px;height: 30px" data-options="label:'类型:',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="name" style="width: 130px;height: 30px" data-options="label:'名称',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="value" style="width: 190px;height: 30px" data-options="label:'字典值',labelWidth:45"></input>
        	<a href="#" onclick="baseDict_advanced_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        	<a href="#" onclick="baseDict_advanced_search_form_clear()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" style="width:20px"></a>
        	<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
        	<a onclick="baseDict_advanced_button()" class="fa fa-chevron-circle-up fa-lg" style="cursor: pointer;"></a>
        	</form>
        </div>
	</div>
	
	
	<script type="text/javascript">
	var baseDict_datagrid_id = '#baseDict_datagrid';
	var baseDict_advanced_search_form_id = '#baseDict_advanced_search_form';
	var baseDict_form_id = '#baseDict_form';
	var baseDict_win_id = '#baseDict_win';
		function baseDict_advanced_search(){
			var param = $(baseDict_advanced_search_form_id).serializeObject();// to json
			if (param.name != '' || param.head != '' ||
					param.headNumber != '' || param.email != ''||
				 param.tel != '' 
					){
				$( baseDict_datagrid_id).datagrid({
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
		
		function baseDict_advanced_search_form_clear(){
			  $( baseDict_datagrid_id).datagrid({
				  queryParams:{
					  
				  }
			  });
			$(baseDict_advanced_search_form_id).form('clear');
		}
		
	
		function baseDict_advanced_button(){
			$div1 = $('#baseDict_advanced_search');
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
			return '<i onclick="baseDict_edit(false,'+"'"+row.id+"'"+')" class="fa fa-ellipsis-h fa-2x blue"></i>';
		}
		
		function formatEdit(value,row,index){
				return '<i onclick="baseDict_edit(true,'+"'"+row.id+"'"+')" class="fa fa-edit fa-2x yellow"></i>';
		}
		function formatRemove(value,row,index){
				return '<i onclick="baseDict_remove('+"'"+row.id+"'"+')" class="fa fa-remove fa-2x red"></i>';
		}
	
		function baseDict_add(){
			$('#baseDict_submit').show();
			 $(baseDict_form_id).form('clear');
			 $(baseDict_win_id).window('open');
		}
		
		function baseDict_edit(edit,id){
			if (!edit){
				$('#baseDict_submit').hide();
			}else{
				$('#baseDict_submit').show();
			}
			$(baseDict_form_id).form('clear');
			load_baseDict_form(id);
			 $(baseDict_win_id).window('open');
		}
		
		function baseDict_remove_checked(){
			var ids = [];
			var objs = $( baseDict_datagrid_id).datagrid('getChecked');
			if (null != objs && objs.length > 0){
				for(var i=0;i<objs.length;i++){
					ids.push(objs[i].id);
				}
				
				baseDict_remove(ids.join(','));
			}else{
				centerMsg('请至少选择一个项目');
			}
		}
		
		function baseDict_remove(ids){
			$.messager.confirm('提示', '确定删除此项目?', function(r){
				if (r){
					$.ajax({
						url:basePath+'baseDict/delete.do',
						method:'get',
						data:{'ids':ids},
						success:function(data){
							bottomRightMsg(data.message);
							$( baseDict_datagrid_id).datagrid('reload');
						},
						error:function(data){
							centerMsg('请求有误，请稍后再试...');
						}
						
					});
				}
			
			});
		}
		
		
	</script>
	<div id="baseDict_win" class="easyui-window" title="数据字典管理" data-options="border:true,modal:true,closed:true,
	iconCls:'icon-save',collapsible:false,minimizable:false,layout:'fit'"
	style="width:720px;margin: 5px">
		<form id="baseDict_form" method="post">
			<input hidden=true name="id" id="baseDict_id"/>
	    	<table cellpadding="5">
	    		
	    		<tr>
	    			<td>字典类型：</td>
	    			<td><input id="type_combobox"  class="easyui-combobox" type="text" name="type" style="width: 280px;height: 30px" 
		    			data-options="required:true,valueField:'type',textField:'type',
		    			url:'${pageContext.request.contextPath }/baseDict/findType.do',method:'get'
	    			"></input></td>
	    			<td>状态:</td>
	    			<td>
		    			<input type="radio" name="state" value="true" required style="padding-right:50px"><i class="fa fa-check-circle fa-2x green"/></input>
	    				<input type="radio" name="state" value="false" required><i class="fa fa-times-circle fa-2x red"/></input>
	    			 </td>
	    		</tr>
	    		
	    		<tr>
	    			<td>名称</td>
	    			<td><input  class="easyui-textbox" type="text" name="name" style="width: 280px;height: 30px" data-options="value:'',required:true"></input></td>
	    			<td>值:</td>
	    			<td><input  class="easyui-textbox" type="text" name="value" style="width: 280px;height: 30px" data-options="validType:'',required:true"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>备注：</td>
	    			<td colspan="3"><textarea name="remark" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="baseDict_submit" onclick="submit_baseDict_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close_baseDict_win()">关闭</a>
	    </div>
	</div>
<script type="text/javascript">
	
	function load_baseDict_form(id){
		$(baseDict_form_id).form('load',basePath+'baseDict/findById.do?id='+id);
	}

	function close_baseDict_win(){
		$(baseDict_win_id).window('close');
	}

	function submit_baseDict_form(){
		var url = basePath+"baseDict/save.do";
		if (null !=$('#baseDict_id').val() && '' != $('#baseDict_id').val() ){
			 url = basePath+"baseDict/update.do";
		}
		
		$(baseDict_form_id).form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	//
				}
				return isValid;	
		    },
		    success:function(data){
		    	$('#type_combobox').combobox('reload');
		    	$( baseDict_datagrid_id).datagrid('reload');
		    	var o = jQuery.parseJSON(data);
		    	bottomRightMsg(o.message);
		    	$(baseDict_win_id).window('close');
		    }
		});
	}
	

</script>

</body>
</html>