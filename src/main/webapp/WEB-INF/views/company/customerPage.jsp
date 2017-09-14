<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer</title>
</head>
<body>

	<table id="customer_datagrid" class="easyui-datagrid" title="" 
			style=""
			data-options="rownumbers:true,layout:'fit',checkOnSelect:false,selectOnCheck:true,singleSelect:true,
			url:'${pageContext.request.contextPath }/customer/findByPage.do',
			remoteSort:false,multiSort:false,
			method:'get',pagination:true,toolbar:'#customer_toolbar'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th data-options="field:'name',width:150,sortable:true">客户名称</th>
				<th data-options="field:'manager',width:80,sortable:true">客户经理</th>
				<th data-options="field:'managerMobile',width:100,sortable:true">联系手机</th>
				<th data-options="field:'tel',width:100,sortable:true">联系电话</th>
				<th data-options="field:'fox',width:100,sortable:true">传真地址</th>
				<th data-options="field:'address',width:300,sortable:true">客户地址</th>
				<th data-options="field:'rated',width:120,sortable:true,formatter:formatRated">客户评价</th>
				<th data-options="field:'view',width:60,align:'center',formatter:formatView">更多</th>
				<th data-options="field:'edit',width:60,align:'center',formatter:formatEdit">编辑</th>
				<th data-options="field:'remove',width:60,align:'center',formatter:formatRemove">移除</th>
			</tr>
		</thead>
	</table>
	
	<div id="customer_toolbar" style="padding:2px 5px;">
		<a href="#" class="easyui-linkbutton" onclick="customer_add()" iconCls="icon-add" plain="true">录入</a>
		<a href="#" class="easyui-linkbutton" onclick="customer_remove_checked()" iconCls="icon-remove" plain="true">批量移除</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
       <input id="customer_search" class="easyui-textbox" data-options="
                    prompt: '请输入关键字',
                    iconWidth: 30,
                    icons: [{
                        iconCls:'icon-search',
                        handler: function(e){
                        	 var param = $('#customer_search').val();
                        if (param != ''){
	                        if ( param.length > 0){
	                        	 $('#customer_datagrid').datagrid({
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
                        $('#customer_search').textbox('setValue','');
                             $('#customer_datagrid').datagrid({
								  queryParams:{
									  
								  }
							  });
                        }
                    
                    }]
                    " style="width: 350px;height: 35px">
        <a href="#" class="easyui-linkbutton" onclick="customer_advanced_button()" iconCls="fa fa-chevron-circle-down fa-lg green" plain="true">高级查询</a>
        <div id="customer_advanced_search" hidden=true>
         <form id="customer_advanced_search_form" method="post">
        	<input class="easyui-textbox" type="text" name="name" style="width: 150px;height: 30px" data-options="label:'名称:',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="manager" style="width: 130px;height: 30px" data-options="label:'经理',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="managerMobile" style="width: 190px;height: 30px" data-options="label:'手机',labelWidth:45"></input>
        	<input class="easyui-textbox" type="text" name="fox" style="width: 180px;height: 30px" data-options="label:'传真',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="tel" style="width: 130px;height: 30px" data-options="label:'电话',labelWidth:25"></input>
        	<a href="#" onclick="customer_advanced_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        	<a href="#" onclick="customer_advanced_search_form_clear()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" style="width:20px"></a>
        	<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
        	<a onclick="customer_advanced_button()" class="fa fa-chevron-circle-up fa-lg green" style="cursor: pointer;"></a>
        	</form>
        </div>
	</div>
	
	
	<script type="text/javascript">
		function customer_advanced_search(){
			var param = $('#customer_advanced_search_form').serializeObject();// to json
			if (param.name != '' || param.manager != '' ||
					param.managerMobile != '' || param.tel != ''||
				 param.fox != '' 
					){
				$('#customer_datagrid').datagrid({
					queryParams: {
						name: param.name,
						manager:param.manager,
						managerMobile:param.managerMobile,
						fox : param.fox,
						tel: param.tel,
					}
				});
			}
			
		}
		
		function customer_advanced_search_form_clear(){
			  $('#customer_datagrid').datagrid({
				  queryParams:{
					  
				  }
			  });
			$('#customer_advanced_search_form').form('clear');
		}
		
	
		function customer_advanced_button(){
			$div1 = $('#customer_advanced_search');
			if($div1.is(':hidden')){
				$div1.show();
			}else if($div1.is(':visible')){
				$div1.hide();
			}
		}
	
		
		function formatRated(val){
			var rate = '';
			for(var i=0;i<5;i++){
				if (i<val){
					rate += '<i class="fa fa-star fa-2x green"></i>'
				}else{
					rate += '<i class="fa fa-star-o fa-2x gray"></i>'
				}
			}
			return rate;
		}
		
		function formatState(val){
			if (val){
				return '<i class="fa fa-check-circle fa-2x green"></i>';
			} else {
				return '<i class="fa fa-times-circle fa-2x red"></i>';
			}
		}
		
		function formatView(value,row,index){
			return '<i onclick="customer_edit(false,'+"'"+row.id+"'"+')" class="fa fa-ellipsis-h fa-2x blue"></i>';
		}
		
		function formatEdit(value,row,index){
				return '<i onclick="customer_edit(true,'+"'"+row.id+"'"+')" class="fa fa-edit fa-2x yellow"></i>';
		}
		function formatRemove(value,row,index){
				return '<i onclick="customer_remove('+"'"+row.id+"'"+')" class="fa fa-remove fa-2x red"></i>';
		}
	
		function customer_add(){
			$('#customer_submit').show();
			 $('#customer_form').form('clear');
			 $('#customer_win').window('open');
		}
		
		function customer_edit(edit,id){
			if (!edit){
				$('#customer_submit').hide();
			}else{
				$('#customer_submit').show();
			}
			$('#customer_form').form('clear');
			load_customer_form(id);
			 $('#customer_win').window('open');
		}
		
		function customer_remove_checked(){
			var ids = [];
			var objs = $('#customer_datagrid').datagrid('getChecked');
			if (null != objs && objs.length > 0){
				for(var i=0;i<objs.length;i++){
					ids.push(objs[i].id);
				}
				
				customer_remove(ids.join(','));
			}else{
				centerMsg('请至少选择一个项目');
			}
		}
		
		function customer_remove(ids){
			$.messager.confirm('提示', '确定删除此项目?', function(r){
				if (r){
					$.ajax({
						url:basePath+'customer/delete.do',
						method:'get',
						data:{'ids':ids},
						success:function(data){
							bottomRightMsg(data.message);
							$('#customer_datagrid').datagrid('reload');
						},
						error:function(data){
							centerMsg('请求有误，请稍后再试...');
						}
						
					});
				}
			
			});
		}
		
		
	</script>
	<div id="customer_win" class="easyui-window" title="公司管理" data-options="border:true,modal:true,closed:true,
	iconCls:'icon-save',collapsible:false,minimizable:false,layout:'fit'"
	style="margin: 5px">
		<form id="customer_form" method="post">
			<input hidden=true name="id" id="customer_id"/>
	    	<table cellpadding="5">
	    		
	    		<tr>
	    			<td>客户名称：</td>
	    			<td><input  class="easyui-textbox" type="text" name="name" style="width: 280px;height: 30px" data-options="value:'',required:true"></input></td>
	    			<td>客户评价</td>
	    			<td><input class="easyui-numberspinner" type="text" name="rated" style="width: 280px;height: 30px;text-align:center" 
	    				data-options="spinAlign:'',required:true,min:0,max:5"></input></td>
	    		</tr>
	    		<tr>
	    			<td>客户经理:</td>
	    			<td><input  class="easyui-textbox" type="text" name="manager" style="width: 280px;height: 30px" data-options="validType:'',required:true"></input></td>
	    			<td>联系手机:</td>
	    			<td><input  class="easyui-textbox" type="text" name="managerMobile" style="width: 280px;height: 30px" data-options="validType:'mobile',required:true"></input></td>
	    			
	    		</tr>
	    		<tr>
	    			<td>联系电话</td>
	    			<td><input  class="easyui-textbox" type="text" name="tel" style="width: 280px;height: 30px" data-options="validType:'tel',required:true"></input></td>
	    			<td>传真地址:</td>
	    			<td><input  class="easyui-textbox" type="text" name="fox" style="width: 280px;height: 30px" data-options="validType:'fox',required:true"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>客户地址：</td>
	    			<td colspan="3"><textarea required name="address" cols="70" rows="2"></textarea></td>
	    		</tr>
	    		<tr>
	    			<td>客户信息：</td>
	    			<td colspan="3"><textarea name="info" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="customer_submit" onclick="submit_customer_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close_customer_win()">关闭</a>
	    </div>
	</div>
<script type="text/javascript">
	
	function load_customer_form(id){
		$('#customer_form').form('load',basePath+'customer/findById.do?id='+id);
	}

	function close_customer_win(){
		$('#customer_win').window('close');
	}

	function submit_customer_form(){
		var url = basePath+"customer/save.do";
		if (null !=$('#customer_id').val() && '' != $('#customer_id').val() ){
			 url = basePath+"customer/update.do";
		}
		
		$('#customer_form').form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	//
				}
				return isValid;	
		    },
		    success:function(data){
		    	$('#customer_datagrid').datagrid('reload');
		    	var o = jQuery.parseJSON(data);
		    	bottomRightMsg(o.message);
		    	$('#customer_win').window('close');
		    }
		});
	}
	

</script>

</body>
</html>