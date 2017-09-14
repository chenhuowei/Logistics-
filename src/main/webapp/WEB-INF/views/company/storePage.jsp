<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Store</title>
</head>
<body>

	<table id="store_datagrid" class="easyui-datagrid" title="" 
			style=""
			data-options="rownumbers:true,checkOnSelect:false,selectOnCheck:true,singleSelect:true,
			url:'${pageContext.request.contextPath }/store/findByPage.do',
			remoteSort:false,multiSort:false,
			method:'get',pagination:true,toolbar:'#store_toolbar'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th data-options="field:'name',width:150,sortable:true">仓库名称</th>
				<th data-options="field:'chargeName',width:150,sortable:true">仓库主管</th>
				<th data-options="field:'chargeMobile',width:150,sortable:true">仓库电话</th>
				<th data-options="field:'companyName',width:150,sortable:true">隶属公司</th>
				<th data-options="field:'capacityState',width:150,sortable:true,formatter:formatCapacityState">储存状态/m<sup>3</sup></th>
				<th data-options="field:'capacity',width:150,sortable:true">仓库容量/m<sup>3</sup></th>
				<th data-options="field:'state',width:60,align:'center',formatter:formatState,sortable:true">状态</th>
				<th data-options="field:'view',width:60,align:'center',formatter:formatView">更多</th>
				<th data-options="field:'edit',width:60,align:'center',formatter:formatEdit">编辑</th>
				<th data-options="field:'remove',width:60,align:'center',formatter:formatRemove">移除</th>
			</tr>
		</thead>
	</table>
	
	<div id="store_toolbar" style="padding:2px 5px;">
		<a href="#" class="easyui-linkbutton" onclick="store_add()" iconCls="icon-add" plain="true">录入</a>
		<a href="#" class="easyui-linkbutton" onclick="store_remove_checked()" iconCls="icon-remove" plain="true">批量移除</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
       <input id="store_search" class="easyui-textbox" data-options="
                    prompt: '请输入关键字',
                    iconWidth: 30,
                    icons: [{
                        iconCls:'icon-search',
                        handler: function(e){
                        	 var param = $('#store_search').val();
                        if (param != ''){
	                        if ( param.length > 0){
	                        	 $('#store_datagrid').datagrid({
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
                        $('#store_search').textbox('setValue','');
                             $('#store_datagrid').datagrid({
								  queryParams:{
									  
								  }
							  });
                        }
                    
                    }]
                    " style="width: 350px;height: 35px">
        <a href="#" class="easyui-linkbutton" onclick="store_advanced_button()" iconCls="fa fa-chevron-circle-down fa-lg green" plain="true">高级查询</a>
        <div id="store_advanced_search" hidden=true>
         <form id="store_advanced_search_form" method="post">
        	<input class="easyui-textbox" type="text" name="name" style="width: 150px;height: 30px" data-options="label:'名称:',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="chargeName" style="width: 130px;height: 30px" data-options="label:'工号',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="managerNumber" style="width: 190px;height: 30px" data-options="label:'负责人',labelWidth:45"></input>
        	<a href="#" onclick="store_advanced_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        	<a href="#" onclick="store_advanced_search_form_clear()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" style="width:20px"></a>
        	<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
        	<a onclick="store_advanced_button()" class="fa fa-chevron-circle-up fa-lg" style="cursor: pointer;"></a>
        	</form>
        </div>
	</div>
	
	
	<script type="text/javascript">
		function store_advanced_search(){
			var param = $('#store_advanced_search_form').serializeObject();// to json
			if (param.name != '' || param.head != '' ||
					param.headNumber != '' || param.email != ''||
				 param.tel != '' 
					){
				$('#store_datagrid').datagrid({
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
		
		function store_advanced_search_form_clear(){
			  $('#store_datagrid').datagrid({
				  queryParams:{
					  
				  }
			  });
			$('#store_advanced_search_form').form('clear');
		}
		
	
		function store_advanced_button(){
			alert('暂未开放');
			return ;
			$div1 = $('#store_advanced_search');
			if($div1.is(':hidden')){
				$div1.show();
			}else if($div1.is(':visible')){
				$div1.hide();
			}
		}
	
		function formatCapacityState(value,row){
			 //var htmlstr = '<div class="progressbar-text" style="width:120px;">'+val+
			 //'</div><div class="progressbar-value" style="width:'+val+';">&nbsp; </div>';
			 var percent = value/row.capacity*100;
			 var htmlstr = '<div class="easyui-progressbar progressbar easyui-fluid" data-options="value:' + value +
			 '" style="width: 100%; height: 22px;">' +
			'<div class="progressbar-value" style="width: '+percent+'%; height: 22px; line-height: 22px;">' +
			'<div class="progressbar-text" style="width: 100%; height: 22px; line-height: 22px;">' + value + '</div></div></div>';
			    return htmlstr;    
		}
		
		function formatState(val){
			if (val){
				return '<i class="fa fa-check-circle fa-2x green"></i>';
			} else {
				return '<i class="fa fa-times-circle fa-2x red"></i>';
			}
		}
		
		function formatView(value,row,index){
			return '<i onclick="store_edit(false,'+"'"+row.id+"'"+')" class="fa fa-ellipsis-h fa-2x blue"></i>';
		}
		
		function formatEdit(value,row,index){
				return '<i onclick="store_edit(true,'+"'"+row.id+"'"+')" class="fa fa-edit fa-2x yellow"></i>';
		}
		function formatRemove(value,row,index){
				return '<i onclick="store_remove('+"'"+row.id+"'"+')" class="fa fa-remove fa-2x red"></i>';
		}
	
		function store_add(){
			$('#store_submit').show();
			 $('#store_form').form('clear');
			 $('#store_win').window('open');
		}
		
		function store_edit(edit,id){
			if (!edit){
				$('#store_submit').hide();
			}else{
				$('#store_submit').show();
			}
			$('#store_form').form('clear');
			load_store_form(id);
			 $('#store_win').window('open');
		}
		
		function store_remove_checked(){
			var ids = [];
			var objs = $('#store_datagrid').datagrid('getChecked');
			if (null != objs && objs.length > 0){
				for(var i=0;i<objs.length;i++){
					ids.push(objs[i].id);
				}
				
				store_remove(ids.join(','));
			}else{
				centerMsg('请至少选择一个项目');
			}
		}
		
		function store_remove(ids){
			$.messager.confirm('提示', '确定删除此项目?', function(r){
				if (r){
					$.ajax({
						url:basePath+'store/delete.do',
						method:'get',
						data:{'ids':ids},
						success:function(data){
							bottomRightMsg(data.message);
							$('#store_datagrid').datagrid('reload');
						},
						error:function(data){
							centerMsg('请求有误，请稍后再试...');
						}
						
					});
				}
			
			});
		}
		
		
	</script>
	<div id="store_win" class="easyui-window" title="职位管理" data-options="border:true,modal:true,closed:true,
	iconCls:'icon-save',collapsible:false,minimizable:false,layout:'fit'"
	style="width:730px;margin: 5px">
		<form id="store_form" method="post">
			<input hidden=true name="id" id="store_id"/>
	    	<table cellpadding="5">
	    		
	    		<tr>
	    			<td>仓库名称</td>
	    			<td><input  class="easyui-textbox" type="text" name="name" style="width: 280px;height: 30px" data-options="value:'',required:true"></input></td>
	    			<td>仓库主管</td>
	    			<td><input  class="easyui-textbox" type="text" name="chargeName" style="width: 280px;height: 30px" 
	    			data-options="value:'',required:true">
	    				</input></td>
	    		</tr>
	    		<tr>
	    			<td>仓库电话</td>
	    			<td><input  class="easyui-textbox" type="text" name="chargeMobile" style="width: 280px;height: 30px" data-options="validType:'tel',required:true"></input></td>
	    			<td>隶属公司</td>
	    			<td><input  class="easyui-combobox" type="text" name="companyName" style="width: 280px;height: 30px" 
	    			data-options="valueField:'text',textField:'text',method:'get',
	    				editable:false,required:true,url:'${pageContext.request.contextPath }/company/findAsMenu.do'">
	    				</input></td>
	    		</tr>
	    		<tr>
	    			<td>仓库容量/m<sup>3</sup></td>
	    			<td><input  class="easyui-numberbox" type="text" name="capacity" style="width: 280px;height: 30px" data-options="value:'',required:true"></input></td>
	    			<td>已用容量/m<sup>3</sup></td>
	    			<td><input  class="easyui-numberbox" type="text" name="capacityState" style="width: 280px;height: 30px" data-options="value:'',required:true"></input></td>
	    		</tr>
	    		<tr>
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
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="store_submit" onclick="submit_store_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close_store_win()">关闭</a>
	    </div>
	</div>
<script type="text/javascript">
	
	function load_store_form(id){
		$('#store_form').form('load',basePath+'store/findById.do?id='+id);
	}

	function close_store_win(){
		$('#store_win').window('close');
	}

	function submit_store_form(){
		var url = basePath+"store/save.do";
		if (null !=$('#store_id').val() && '' != $('#store_id').val() ){
			 url = basePath+"store/update.do";
		}
		
		$('#store_form').form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	//
				}
				return isValid;	
		    },
		    success:function(data){
		    	$('#store_datagrid').datagrid('reload');
		    	var o = jQuery.parseJSON(data);
		    	bottomRightMsg(o.message);
		    	if (o.success){
			    	$('#store_win').window('close');
		    	}
		    }
		});
	}
	

</script>

</body>
</html>