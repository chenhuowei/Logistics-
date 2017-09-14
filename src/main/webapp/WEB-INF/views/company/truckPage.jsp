<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Truck</title>
</head>
<body>

	<table id="truck_datagrid" class="easyui-datagrid" title="" 
			style=""
			data-options="rownumbers:true,checkOnSelect:false,selectOnCheck:true,singleSelect:true,
			url:'${pageContext.request.contextPath }/truck/findByPage.do',
			remoteSort:false,multiSort:false,
			method:'get',pagination:true,toolbar:'#truck_toolbar'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th data-options="field:'truckId',width:110,sortable:true">车辆编号</th>
				<th data-options="field:'truckPlateNumber',width:100,sortable:true">车牌号码</th>
				<th data-options="field:'truckType',width:100,sortable:true">车辆类型</th>
				<th data-options="field:'driverName',width:100,sortable:true">随车司机</th>
				<th data-options="field:'driverMobile',width:90,sortable:true">随车手机</th>
				<th data-options="field:'truckLocation',width:180,sortable:true">车辆位置</th>
				<th data-options="field:'truckState',width:100,sortable:true,formatter:formatTruckState">车辆状态</th>
				<th data-options="field:'isWorking',width:100,formatter:formatWork">工作中</th>
				<th data-options="field:'isTemporary',width:100,formatter:formatTemp">临时车辆</th>
				<th data-options="field:'view',width:60,align:'center',formatter:formatView">更多</th>
				<th data-options="field:'edit',width:60,align:'center',formatter:formatEdit">编辑</th>
				<th data-options="field:'remove',width:60,align:'center',formatter:formatRemove">移除</th>
			</tr>
		</thead>
	</table>
	
	<div id="truck_toolbar" style="padding:2px 5px;">
		<a href="#" class="easyui-linkbutton" onclick="truck_add()" iconCls="icon-add" plain="true">录入</a>
		<a href="#" class="easyui-linkbutton" onclick="truck_remove_checked()" iconCls="icon-remove" plain="true">批量移除</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
       <input id="truck_search" class="easyui-textbox" data-options="
                    prompt: '请输入关键字',
                    iconWidth: 30,
                    icons: [{
                        iconCls:'icon-search',
                        handler: function(e){
                        	 var param = $('#truck_search').val();
                        if (param != ''){
	                        if ( param.length > 0){
	                        	 $('#truck_datagrid').datagrid({
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
                        $('#truck_search').textbox('setValue','');
                             $('#truck_datagrid').datagrid({
								  queryParams:{
									  
								  }
							  });
                        }
                    
                    }]
                    " style="width: 350px;height: 35px">
        <a href="#" class="easyui-linkbutton" onclick="truck_advanced_button()" iconCls="fa fa-chevron-circle-down fa-lg green" plain="true">高级查询</a>
        <div id="truck_advanced_search" hidden=true>
         <form id="truck_advanced_search_form" method="post">
        	<input class="easyui-textbox" type="text" name="truckId" style="width: 180px;height: 30px"
        	 data-options="label:'车辆编号',labelWidth:55"></input>
        	<input class="easyui-textbox" type="text" name="truckPlateNumber" style="width: 180px;height: 30px"
        	 data-options="label:'车牌号码',labelWidth:55"></input>
        	<input class="easyui-combobox" type="text" name="truckLocation" style="width: 190px;height: 30px" 
        	data-options="label:'车辆位置',labelWidth:55,
        	valueField:'text',textField:'text',method:'get',
	    				editable:false,url:'${pageContext.request.contextPath }/company/findAsMenu.do'
        	"></input>
        	<input class="easyui-combobox" type="text" name="truckState" style="width: 190px;height: 30px" 
        	data-options="label:'车辆状态',labelWidth:55,
        	valueField:'value',textField:'name',method:'get',
	    				editable:false,url:'${pageContext.request.contextPath}/baseDict/findByType.do?type=truckState'
        	"></input>
        	<a href="#" onclick="truck_advanced_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        	<a href="#" onclick="truck_advanced_search_form_clear()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" style="width:20px"></a>
        	<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
        	<a onclick="truck_advanced_button()" class="fa fa-chevron-circle-up fa-lg green" style="cursor: pointer;"></a>
        	</form>
        </div>
	</div>
	
	
	<script type="text/javascript">
		function truck_advanced_search(){
			var param = $('#truck_advanced_search_form').serializeObject();// to json
			if (param.truckId != '' || param.truckPlateNumber != '' ||
					param.truckState != '' || param.truckLocation != ''
					){
				$('#truck_datagrid').datagrid({
					queryParams: {
						truckId: param.truckId,
						truckPlateNumber:param.truckPlateNumber,
						truckLocation:param.truckLocation,
						truckState : param.truckState,
					}
				});
			}
			
		}
		
		function truck_advanced_search_form_clear(){
			  $('#truck_datagrid').datagrid({
				  queryParams:{
					  
				  }
			  });
			$('#truck_advanced_search_form').form('clear');
		}
		
	
		function truck_advanced_button(){
			$div1 = $('#truck_advanced_search');
			if($div1.is(':hidden')){
				$div1.show();
			}else if($div1.is(':visible')){
				$div1.hide();
			}
		}
	
		
		function formatTruckState(val){
			var select = '<select style="width:90px">';
			$.ajax({
				url:basePath+'baseDict/findByType.do?type=truckState',
				method:'get',
				async:false,
				success:function(data){
					for(var i=0;i<data.length;i++){
						if (val == data[i].value){
							select += '<option selected="selected" value="'+"'"+data[i].value+"'"+'">'+data[i].name+'</option>';
						}else{
							select += '<option value="'+"'"+data[i].value+"'"+'">'+data[i].name+'</option>';
						}
					}
					select += '</select>';
				}
			});
			
			return select;
		}
		function formatDriver(val){
			var select = '<select style="width:90px">';
			$.ajax({
				url:basePath+'user/findAsCombobox.do',
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
		function formatLocation(val){
			var select = '<select style="width:170px">';
			$.ajax({
				url:basePath+'company/findAsMenu.do',
				method:'get',
				async:false,
				success:function(data){
					for(var i=0;i<data.length;i++){
						if (val == data[i].text){
							select += '<option selected="selected" value="'+"'"+data[i].text+"'"+'">'+data[i].text+'</option>';
						}else{
							select += '<option value="'+"'"+data[i].text+"'"+'">'+data[i].text+'</option>';
						}
					}
					select += '</select>';
				}
			});
			
			return select;
		}
		function formatType(val){
			var select = '<select style="width:90px">';
			$.ajax({
				url:basePath+'baseDict/findByType.do?type=truckType',
				method:'get',
				async:false,
				success:function(data){
					for(var i=0;i<data.length;i++){
						if (val == data[i].value){
							select += '<option selected="selected" value="'+"'"+data[i].value+"'"+'">'+data[i].name+'</option>';
						}else{
							select += '<option value="'+"'"+data[i].value+"'"+'">'+data[i].name+'</option>';
						}
					}
					select += '</select>';
				}
			});
			
			return select;
		}
		function formatTemp(val){
			var select = '<select style="width:90px">';
			$.ajax({
				url:basePath+'baseDict/findByType.do?type=isTemporary',
				method:'get',
				async:false,
				success:function(data){
					for(var i=0;i<data.length;i++){
						if (val == data[i].value){
							select += '<option selected="selected" value="'+"'"+data[i].value+"'"+'">'+data[i].name+'</option>';
						}else{
							select += '<option value="'+"'"+data[i].value+"'"+'">'+data[i].name+'</option>';
						}
					}
					select += '</select>';
				}
			});
			
			return select;
		}
		function formatWork(val){
			var select = '<select style="width:90px">';
			$.ajax({
				url:basePath+'baseDict/findByType.do?type=workState',
				method:'get',
				async:false,
				success:function(data){
					for(var i=0;i<data.length;i++){
						if (val == data[i].value){
							select += '<option selected="selected" value="'+"'"+data[i].value+"'"+'">'+data[i].name+'</option>';
						}else{
							select += '<option value="'+"'"+data[i].value+"'"+'">'+data[i].name+'</option>';
						}
					}
					select += '</select>';
				}
			});
			
			return select;
		}
		
		function formatView(value,row,index){
			return '<i onclick="truck_edit(false,'+"'"+row.id+"'"+')" class="fa fa-ellipsis-h fa-2x blue"></i>';
		}
		
		function formatEdit(value,row,index){
				return '<i onclick="truck_edit(true,'+"'"+row.id+"'"+')" class="fa fa-edit fa-2x yellow"></i>';
		}
		function formatRemove(value,row,index){
				return '<i onclick="truck_remove('+"'"+row.id+"'"+')" class="fa fa-remove fa-2x red"></i>';
		}
	
		function truck_add(){
			$('#truck_submit').show();
			 $('#truck_form').form('clear');
			 $('#truck_win').window('open');
		}
		
		function truck_edit(edit,id){
			if (!edit){
				$('#truck_submit').hide();
			}else{
				$('#truck_submit').show();
			}
			$('#truck_form').form('clear');
			load_truck_form(id);
			 $('#truck_win').window('open');
		}
		
		function truck_remove_checked(){
			var ids = [];
			var objs = $('#truck_datagrid').datagrid('getChecked');
			if (null != objs && objs.length > 0){
				for(var i=0;i<objs.length;i++){
					ids.push(objs[i].id);
				}
				
				truck_remove(ids.join(','));
			}else{
				centerMsg('请至少选择一个项目');
			}
		}
		
		function truck_remove(ids){
			$.messager.confirm('提示', '确定删除此项目?', function(r){
				if (r){
					$.ajax({
						url:basePath+'truck/delete.do',
						method:'get',
						data:{'ids':ids},
						success:function(data){
							bottomRightMsg(data.message);
							$('#truck_datagrid').datagrid('reload');
						},
						error:function(data){
							centerMsg('请求有误，请稍后再试...');
						}
						
					});
				}
			
			});
		}
		
		
	</script>
	<div id="truck_win" class="easyui-window" title="职位管理" data-options="border:true,modal:true,closed:true,
	iconCls:'icon-save',collapsible:false,minimizable:false,layout:'fit'"
	style="width:720px;margin: 5px">
		<form id="truck_form" method="post">
			<input hidden=true name="id" id="truck_id"/>
	    	<table cellpadding="5">
	    		
	    		<tr>
	    			<td>车辆编号</td>
	    			<td><input  class="easyui-textbox" type="text" name="truckId" style="width: 280px;height: 30px" 
	    			data-options="disabled:true">
	    				</input></td>
	    			<td>车辆类型</td>
	    			<td><input  class="easyui-combobox" type="text" name="truckType" style="width: 280px;height: 30px" 
	    			data-options="valueField:'value',textField:'name',method:'get',
	    				editable:false,required:true,url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=truckType'">
	    				</input></td>
	    		<tr>
	    		<tr>
	    			<td>车牌号码</td>
	    			<td><input  class="easyui-textbox" type="text" name="truckPlateNumber" style="width: 280px;height: 30px" 
	    			data-options="value:'',required:true">
	    			</input></td>
	    		<tr>
	    		<tr>
	    			<td>随车司机</td>
	    			<td><input  class="easyui-textbox" type="text" name="driverName" style="width: 280px;height: 30px" 
	    			data-options="value:'',required:true">
	    			</input></td>
	    			<td>随车手机</td>
	    			<td><input  class="easyui-textbox" type="text" name="driverMobile" style="width: 280px;height: 30px" 
	    			data-options="validType:'mobile',required:true">
	    			</input></td>
	    		<tr>
	    		<tr>
	    			<td>车辆状态</td>
	    			<td><input  class="easyui-combobox" type="text" name="truckState" style="width: 280px;height: 30px" 
	    			data-options="valueField:'value',textField:'name',method:'get',
	    				editable:false,required:true,url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=truckState'">
	    			</input></td>
	    			<td>车辆位置</td>
	    			<td><input  class="easyui-combobox" type="text" name="truckLocation" style="width: 280px;height: 30px" 
	    			data-options="valueField:'text',textField:'text',method:'get',
	    				editable:false,required:true,url:'${pageContext.request.contextPath }/company/findAsMenu.do'">
	    			</input></td>
	    		<tr>
	    		<tr>
	    			<td>工作状态</td>
	    			<td><input  class="easyui-combobox" type="text" name="isWorking" style="width: 280px;height: 30px" 
	    			data-options="valueField:'value',textField:'name',method:'get',
	    				editable:false,required:true,url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=workState'">
	    			</input></td>
	    			<td>临时车辆</td>
	    			<td><input  class="easyui-combobox" type="text" name="isTemporary" style="width: 280px;height: 30px" 
	    			data-options="valueField:'value',textField:'name',method:'get',
	    				editable:false,required:true,url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=isTemporary'">
	    			</input></td>
	    		<tr>
	    			<td>备注：</td>
	    			<td colspan="3"><textarea name="remark" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="truck_submit" onclick="submit_truck_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close_truck_win()">关闭</a>
	    </div>
	</div>
<script type="text/javascript">
	
	function load_truck_form(id){
		$('#truck_form').form('load',basePath+'truck/findById.do?id='+id);
	}

	function close_truck_win(){
		$('#truck_win').window('close');
	}

	function submit_truck_form(){
		var url = basePath+"truck/save.do";
		if (null !=$('#truck_id').val() && '' != $('#truck_id').val() ){
			 url = basePath+"truck/update.do";
		}
		
		$('#truck_form').form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	//
				}
				return isValid;	
		    },
		    success:function(data){
		    	$('#truck_datagrid').datagrid('reload');
		    	var o = jQuery.parseJSON(data);
		    	bottomRightMsg(o.message);
		    	if(o.success){
			    	$('#truck_win').window('close');
		    	}
		    }
		});
	}
	

</script>

</body>
</html>