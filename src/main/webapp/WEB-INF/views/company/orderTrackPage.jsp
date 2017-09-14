<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OrderTrack</title>
</head>
<body>

	<table id="orderTrack_datagrid_${orderForm.id }" class="easyui-datagrid" title="" 
			style=""
			data-options="rownumbers:true,layout:'fit',checkOnSelect:false,selectOnCheck:true,singleSelect:true,
			url:'${pageContext.request.contextPath }/orderTrack/findByPage.do?orderFormId=${orderForm.orderId }',
			remoteSort:false,multiSort:false,
			method:'get',pagination:true,toolbar:'#orderTrack_toolbar_${orderForm.id }'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th data-options="field:'location',width:280,sortable:true">收入站点</th>
				<th data-options="field:'destination',width:280,sortable:true">下一站点</th>
				<th data-options="field:'operatorType',width:80,sortable:true">操作类型</th>
				<th data-options="field:'orderUpdateTime',width:130,sortable:true">更新时间</th>
				<th data-options="field:'truckId',width:120,sortable:true">车辆编号</th>
				<th data-options="field:'driverName',width:80,sortable:true">车辆司机</th>
				<th data-options="field:'view',width:60,align:'center',formatter:formatView">更多</th>
				<th data-options="field:'edit',width:60,align:'center',formatter:formatEdit">编辑</th>
				<th data-options="field:'remove',width:60,align:'center',formatter:formatRemove">移除</th>
			</tr>
		</thead>
	</table>
	
	<div id="orderTrack_toolbar_${orderForm.id }" style="padding:2px 5px;">
	<div id="orderForm_info_${orderForm.id }" style="">
		<table>
			<tr>
				<th> 运单编号：${orderForm.orderId }</th>
				<th> 创建时间：${orderForm.createTime }</th>
				<th> 运单类型：${orderForm.orderType }</th>
			</tr>
			<tr>
				<td>寄件人/单位：${orderForm.senderName }</td>
				<td>寄件地址：${orderForm.senderAddress }</td>
				<td>   寄件手机：${orderForm.senderMobile }</td>
			</tr>
			<tr>
				<td> 收件人/单位：${orderForm.recipientsName }</td>
				<td>收件地址：${orderForm.recipientsAddress }</td>
				<td>  收件手机:${orderForm.recipientsMobile }</td>
			</tr>
		</table>
			        <br/>
			       
	</div>
		<a href="#" class="easyui-linkbutton" onclick="orderForm_info_button()" iconCls="fa fa-eye fa-lg green" plain="true">运单信息</a>
		<a href="#" class="easyui-linkbutton" onclick="orderTrack_add()" iconCls="icon-add" plain="true">录入</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
       <input id="orderTrack_search_${orderForm.id }" class="easyui-textbox" data-options="
                    prompt: '请输入关键字',
                    iconWidth: 30,
                    icons: [{
                        iconCls:'icon-search',
                        handler: function(e){
                        	 var param = $('#orderTrack_search_${orderForm.id }').val();
                        if (param != ''){
	                        if ( param.length > 0){
	                        	 $('#orderTrack_datagrid_${orderForm.id }').datagrid({
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
                        $('#orderTrack_search').textbox('setValue','');
                             $('#orderTrack_datagrid_${orderForm.id }').datagrid({
								  queryParams:{
									  
								  }
							  });
                        }
                    
                    }]
                    " style="width: 350px;height: 35px">
        <a href="#" class="easyui-linkbutton" onclick="orderTrack_advanced_button()" iconCls="fa fa-chevron-circle-down fa-lg green" plain="true">高级查询</a>
        <div id="orderTrack_advanced_search_${orderForm.id }" hidden=true>
         <form id="orderTrack_advanced_search_form_${orderForm.id }" method="post">
        	<input class="easyui-textbox" type="text" name="name" style="width: 150px;height: 30px" data-options="label:'名称:',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="headNumber" style="width: 130px;height: 30px" data-options="label:'工号',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="head" style="width: 190px;height: 30px" data-options="label:'负责人',labelWidth:45"></input>
        	<input class="easyui-textbox" type="text" name="email" style="width: 180px;height: 30px" data-options="label:'邮箱',labelWidth:25"></input>
        	<input class="easyui-textbox" type="text" name="tel" style="width: 130px;height: 30px" data-options="label:'电话',labelWidth:25"></input>
        	<a href="#" onclick="orderTrack_advanced_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        	<a href="#" onclick="orderTrack_advanced_search_form_clear()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" style="width:20px"></a>
        	<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
        	<a onclick="orderTrack_advanced_button()" class="fa fa-chevron-circle-up fa-lg" style="cursor: pointer;"></a>
        	</form>
        </div>
	</div>
	
	
	<script type="text/javascript">
		function orderTrack_advanced_search(){
			var param = $('#orderTrack_advanced_search_form_${orderForm.id }').serializeObject();// to json
			if (param.name != '' || param.head != '' ||
					param.headNumber != '' || param.email != ''||
				 param.tel != '' 
					){
				$('#orderTrack_datagrid_${orderForm.id }').datagrid({
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
		
		function orderTrack_advanced_search_form_clear(){
			  $('#orderTrack_datagrid_${orderForm.id }').datagrid({
				  queryParams:{
					  
				  }
			  });
			$('#orderTrack_advanced_search_form_${orderForm.id }').form('clear');
		}
		
	
		function orderTrack_advanced_button(){
			return;
			$div1 = $('#orderTrack_advanced_search_${orderForm.id }');
			if($div1.is(':hidden')){
				$div1.show();
			}else if($div1.is(':visible')){
				$div1.hide();
			}
		}
	
		function orderForm_info_button(){
			$div1 = $('#orderForm_info_${orderForm.id }');
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
			return '<i onclick="orderTrack_edit(false,'+"'"+row.id+"'"+')" class="fa fa-ellipsis-h fa-2x blue"></i>';
		}
		
		function formatEdit(value,row,index){
			if ('${USER.name}' == row.operator && '${USER.employeeNumber}'== row.operatorNumber){
				return '<i onclick="orderTrack_edit(true,'+"'"+row.id+"'"+')" class="fa fa-edit fa-2x yellow"></i>';
			}
			return '不可操作';
		}
		function formatRemove(value,row,index){
			if ('${USER.name}' == row.operator && '${USER.employeeNumber}' == row.operatorNumber){
				return '<i onclick="orderTrack_remove('+"'"+row.id+"'"+')" class="fa fa-remove fa-2x red"></i>';
			}
			return '不可操作';
		}
	
		function orderTrack_init_form(){
			 $("#location_${orderForm.id }").textbox('setValue','${COMPANY.address}${COMPANY.name}');
			 $("#operator_${orderForm.id }").textbox('setValue','${USER.name}');
			 $("#operatorNumber_${orderForm.id }").textbox('setValue','${USER.employeeNumber}');
		}
		
		function orderTrack_add(){
			$('#orderTrack_submit_${orderForm.id }').show();
			$('#orderTrack_form_${orderForm.id }').form('clear');
			orderTrack_init_form();
			 $('#orderTrack_win_${orderForm.id }').window('open');
		}
		
		function orderTrack_edit(edit,id){
			if (!edit){
				$('#orderTrack_submit_${orderForm.id }').hide();
			}else{
				$('#orderTrack_submit_${orderForm.id }').show();
			}
			$('#orderTrack_form_${orderForm.id }').form('clear');
				load_orderTrack_form(id);
			 $('#orderTrack_win_${orderForm.id }').window('open');
		}
		
		function orderTrack_remove_checked(){
			var ids = [];
			var objs = $('#orderTrack_datagrid_${orderForm.id }').datagrid('getChecked');
			if (null != objs && objs.length > 0){
				for(var i=0;i<objs.length;i++){
					ids.push(objs[i].id);
				}
				
				orderTrack_remove(ids.join(','));
			}else{
				centerMsg('请至少选择一个项目');
			}
		}
		
		function orderTrack_remove(ids){
			$.messager.confirm('提示', '确定删除此项目?', function(r){
				if (r){
					$.ajax({
						url:basePath+'orderTrack/delete.do',
						method:'get',
						data:{'ids':ids},
						success:function(data){
							bottomRightMsg(data.message);
							$('#orderTrack_datagrid_${orderForm.id }').datagrid('reload');
						},
						error:function(data){
							centerMsg('请求有误，请稍后再试...');
						}
						
					});
				}
			
			});
		}
		$(function(){
			  $("input[name='trackState']").change(function(){
				  $('#destinationTip_${orderForm.id }').hide();
					if($(this).val() == 0){
						$("#destination_${orderForm.id }").combobox("setValue","${orderForm.recipientsAddress}");
					}else{
					}
			  });
			  
			  
		});
		
	</script>
	<div id="orderTrack_win_${orderForm.id }" class="easyui-window" title="公司管理" data-options="border:true,modal:true,closed:true,
	iconCls:'icon-save',collapsible:false,minimizable:false,layout:'fit'"
	style="margin: 5px">
		<form id="orderTrack_form_${orderForm.id }" method="post">
			<input hidden=true name="id" id="orderTrack_id_${orderForm.id }"/>
	    	<table cellpadding="5">
	    		
	    		<tr>
	    			<td>录入类型:</td>
	    			<td>
		    			<input  type="radio" name="trackState" value=1 checked required style="padding-right:50px">中转站点</input>
	    				<input type="radio" name="trackState" value=0 required>派送站点</input>
	    			 </td>
	    		</tr>
	    		<tr>
	    			<td>当前站点：</td>
	    			<td><input  class="easyui-textbox" value="${COMPANY.address }${COMPANY.name}"
		    			type="text" id="location_${orderForm.id }" name="location" style="width: 280px;height: 30px" 
		    			data-options="editable:false,required:true"></input></td>
	    			<td>下一站点：</td>
	    			<td><input class="easyui-combobox" type="text" name="destination"
	    			 style="width: 280px;height: 30px" id="destination"
	    			  data-options="
	    			  valueField:'text',textField:'text',
	    				editable:false,required:true,
	    				 panelWidth: 280,
	                    panelHeight: 'auto',
	                    formatter: formatDestination,
	    				url:'${pageContext.request.contextPath }/company/findAsMenu.do'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>操作类型:</td>
	    			<td><input  class="easyui-combobox" type="text" 
	    			name="operatorType" style="width: 280px;height: 30px" 
	    				data-options="required:true,editable:false,valueField:'value',textField:'name',
	    				url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=orderTrackOperatorType',method:'get'
	    				"></input></td>
	    			<td>操作时间:</td>
	    			<td><input  class="easyui-textbox" type="text" name="operateTime" 
	    			style="width: 280px;height: 30px" data-options="disabled:true,required:true"></input></td>
	    			
	    		</tr>
	    		<tr>
	    			<td>物流车辆</td>
	    			<td><input  class="easyui-combobox" type="text" name="truckId" 
	    			style="width: 280px;height: 30px" 
	    			data-options="
	    			limitToList:true,
                    url: '${pageContext.request.contextPath }/truck/findAsCombobox.do',
                    method: 'get',
                    valueField: 'truck_id',
                    textField: 'truck_id',
                    panelWidth: 280,
                    panelHeight: 'auto',
                    formatter: formatTruck,
                    required:true
	    			"></input></td>
	    			<td>车辆司机:</td>
	    			<td><input   class="easyui-textbox" type="text" name="driverName" style="width: 280px;height: 30px" data-options="disabled:true,required:true"></input></td>
	    		</tr>

	    		<tr>
	    			<td>操作员:</td>
	    			<td><input id="operator_${orderForm.id }"  class="easyui-textbox" type="text" name="operator" 
	    			style="width: 280px;height: 30px" value="${USER.name }"
	    			data-options="editable:false,required:true"></input></td>
	    			<td>工号</td>
	    			<td><input class="easyui-textbox" type="text" id="operatorNumber_${orderForm.id }" name="operatorNumber" 
	    			style="width: 280px;height: 30px"  value="${USER.employeeNumber }"
	    			data-options="required:true,editable:false"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>备注：</td>
	    			<td colspan="3"><textarea name="remark" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="orderTrack_submit" onclick="submit_orderTrack_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close_orderTrack_win()">关闭</a>
	    </div>
	</div>
<script type="text/javascript">
	
	function formatTruck(row){
	    var s = '<span style="font-weight:bold">'+row.truck_id+ '</span><br/>' +
	            '<span style="color:#888">' +'车辆类型：'+row.truck_type +
	           	'|司机:'+ row.driver_name+'|手机:'+row.driver_mobile+ '|位置:'+ row.truck_location + '</span>';
	    return s;
	}
	
	function formatDestination(row){
	    var s = '<span style="font-weight:bold">'+row.text+ '</span><br/>' +
	            '<span style="color:#888">'+
	            '位置:'+ row.address +"|电话:"+row.tel+ '</span>';
	    return s;
	}
	
	function load_orderTrack_form(id){
		$('#orderTrack_form_${orderForm.id }').form('load',basePath+'orderTrack/findById.do?id='+id);
	}

	function close_orderTrack_win(){
		$('#orderTrack_win_${orderForm.id }').window('close');
	}

	function submit_orderTrack_form(){
		var url = basePath+"orderTrack/save.do?orderFormId=${orderForm.orderId}";
		if (null !=$('#orderTrack_id_${orderForm.id }').val() && '' != $('#orderTrack_id_${orderForm.id }').val() ){
			 url = basePath+"orderTrack/update.do?orderFormId=${orderForm.orderId}";
		}
		
		$('#orderTrack_form_${orderForm.id }').form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	//
				}
				return isValid;	
		    },
		    success:function(data){
		    	$('#orderTrack_datagrid_${orderForm.id }').datagrid('reload');
		    	var o = jQuery.parseJSON(data);
		    	if (o.success){
			    	$('#orderTrack_win_${orderForm.id }').window('close');
			    	$('#orderTrack_form_${orderForm.id }').form('clear');		    		
		    	}
		    	bottomRightMsg(o.message);
		    }
		});
	}
	

</script>

</body>
</html>