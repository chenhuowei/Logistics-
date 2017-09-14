<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OrderForm</title>
</head>
<body>
<script type="text/javascript">
</script>
	<table id="orderForm_datagrid" class="easyui-datagrid" title="" 
			data-options="rownumbers:true,checkOnSelect:false,selectOnCheck:false,singleSelect:true,
			url:'${pageContext.request.contextPath }/orderForm/findByPage.do',
			remoteSort:false,multiSort:false,
			method:'get',pagination:true,toolbar:'#orderForm_toolbar'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th data-options="field:'orderId',width:150,sortable:true">运单号</th>
				<th data-options="field:'orderType',width:60,sortable:false">运单类型</th>
				<th data-options="field:'senderName',width:150,sortable:true">寄件人/单位</th>
				<th data-options="field:'goodsType',width:60,sortable:true">类型</th>
				<th data-options="field:'recipientsName',width:150,sortable:true">收件人/单位</th>
				<th data-options="field:'createTime',width:130,sortable:true">创建时间</th>
				<th data-options="field:'endTime',width:130,sortable:true">结束时间</th>
				<th data-options="field:'orderState',width:100,align:'center',sortable:true,
					formatter:formatOrderState" 
				              >运单状态</th>
				<th data-options="field:'view',width:60,align:'center',formatter:formatView">更多</th>
				<th data-options="field:'orderTrack',width:60,align:'center',formatter:formatTrack">物流跟踪</th>
				<th data-options="field:'edit',width:60,align:'center',formatter:formatEdit">编辑</th>
				<th data-options="field:'remove',width:60,align:'center',formatter:formatRemove">移除</th>
			</tr>
		</thead>
	</table>
	<div id="orderForm_toolbar" style="padding:2px 5px;">
		<a href="#" class="easyui-linkbutton" onclick="orderForm_add()" iconCls="icon-add" plain="true">录入</a>
		<a href="#" class="easyui-linkbutton" onclick="orderForm_remove_checked()" iconCls="icon-remove" plain="true">批量移除</a>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
		<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
       <input id="orderForm_search" class="easyui-textbox" data-options="
                    prompt: '请输入关键字',
                    iconWidth: 30,
                    icons: [{
                        iconCls:'icon-search',
                        handler: function(e){
                        	 var param = $('#orderForm_search').val();
                        if (param != ''){
	                        if ( param.length > 0){
	                        	 $('#orderForm_datagrid').datagrid({
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
                        $('#orderForm_search').textbox('setValue','');
                             $('#orderForm_datagrid').datagrid({
								  queryParams:{
									  
								  }
							  });
                        }
                    
                    }]
                    " style="width: 350px;height: 35px">
        <a href="#" class="easyui-linkbutton" onclick="orderForm_advanced_button()" iconCls="fa fa-chevron-circle-down fa-lg green" plain="true">高级查询</a>
        <div id="orderForm_advanced_search" hidden=true>
         <form id="orderForm_advanced_search_form" method="post">
        	<input class="easyui-textbox" type="text" name="orderId" style="width: 180px;height: 30px" data-options="label:'运单单号',labelWidth:55"></input>
        	<input class="easyui-textbox" type="text" name="senderName" style="width: 190px;height: 30px" data-options="label:'寄件人',labelWidth:45"></input>
        	<input class="easyui-textbox" type="text" name="recipientsName" style="width: 190px;height: 30px" data-options="label:'收件人',labelWidth:45"></input>
        	<input  class="easyui-combobox" type="text" name="orderType" style="width: 150px;height: 30px" 
	    			data-options="valueField:'value',textField:'name',editable:false,label:'运单类型',labelWidth:55,
		    			url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=orderType',method:'get'">
	    			</input>
	    			</br>
        	<input class="easyui-textbox" type="text" name="goodsType" style="width: 200px;height: 30px" data-options="label:'货物类型',labelWidth:55"></input>
        	<input class="easyui-datetimebox" type="text" name="startTime" style="width: 200px;height: 30px" data-options="label:'创建时间',labelWidth:55,editable:false"></input>
        	<input class="easyui-datetimebox" type="text" name="endTime" style="width: 155px;height: 30px" data-options="label:'~',labelWidth:10,editable:false"></input>
        	
        	<a href="#" onclick="orderForm_advanced_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        	<a href="#" onclick="orderForm_advanced_search_form_clear()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" style="width:20px"></a>
        	<span class="datagrid-btn-separator" style="vertical-align: middle; height: 15px;display:inline-block;float:none"></span>
        	<a onclick="orderForm_advanced_button()" class="fa fa-chevron-circle-up fa-lg green" style="cursor: pointer;"></a>
        	</form>
        </div>
	</div>
	
	
	<script type="text/javascript">
		function orderForm_advanced_search(){
			var param = $('#orderForm_advanced_search_form').serializeObject();// to json
			if (param.orderId != '' || param.senderName != '' ||
					param.recipientsName != '' || param.orderType != ''||
				 param.goodsType != '' || param.starTime != '' || param.endTime != ''
					){
				$('#orderForm_datagrid').datagrid({
					queryParams: {
						orderId: param.orderId,
						senderName:param.senderName,
						recipientsName:param.recipientsName,
						orderType: param.orderType,
						goodsType: param.goodsType,
						startTime:param.startTime,
						endTime:param.endTime
					}
				});
			}
			
		}
		
		function orderForm_advanced_search_form_clear(){
			  $('#orderForm_datagrid').datagrid({
				  queryParams:{
					  
				  }
			  });
			$('#orderForm_advanced_search_form').form('clear');
		}
		
	
		function orderForm_advanced_button(){
			$div1 = $('#orderForm_advanced_search');
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
		
		function formatOrderState(val,row,index){
				var select = '<select style="width:90px">';
				$.ajax({
					url:basePath+'baseDict/findByType.do?type=orderState',
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
		function appendOption(val,id){
			$('#'+id).empty();
			$.ajax({
				url:basePath+'baseDict/findByType.do?type=orderState',
				method:'get',
				success:function(data){
					for(var i=0;i<data.length;i++){
						var oid = id+val;
						if (val == data[i].value){
							$('#'+id).append('<option selected="selected"  id="'+oid+'"  value='+"'"+data[i].value+"'"+'>'+data[i].name+'</option>');
						}else{
							$('#'+id).append('<option value='+"'"+data[i].value+"'"+'>'+data[i].name+'</option>');
						}
					}
				}
			})
		}
		
		function formatView(value,row,index){
			return '<i onclick="orderForm_edit(false,'+"'"+row.id+"'"+')" class="fa fa-ellipsis-h fa-2x blue"></i>';
		}
		
		function formatTrack(value,row,index){
			return '<i onclick="openTrack('+"'"+row.id+"'"+","+"'"+row.orderId+"'"+')" class="fa fa-truck fa-2x green"></i>';
		}
		
		function openTrack(id,orderId){
			OpenTab(orderId,'orderTrack/orderTrackPage.do?orderFormId='+id,'fa fa-truck fa-lg green');
		}
		
		function formatEdit(value,row,index){
				return '<i onclick="orderForm_edit(true,'+"'"+row.id+"'"+')" class="fa fa-edit fa-2x yellow"></i>';
		}
		function formatRemove(value,row,index){
				return '<i onclick="orderForm_remove('+"'"+row.id+"'"+')" class="fa fa-remove fa-2x red"></i>';
		}
		function orderFrom_init(){
			$('#orderForm_operator').textbox('setValue','${USER.name}');
			$('#orderForm_number').textbox('setValue','${USER.employeeNumber}');
		}
		function orderForm_add(){
			$('#orderForm_submit').show();
			 $('#orderForm_form').form('clear');
			 orderFrom_init();
			 $('#orderForm_win').window('open');
		}
		
		function orderForm_edit(edit,id){
			if (!edit){
				$('#orderForm_submit').hide();
			}else{
				$('#orderForm_submit').show();
			}
			$('#orderForm_form').form('clear');
			load_orderForm_form(id);
			 $('#orderForm_win').window('open');
		}
		
		function orderForm_remove_checked(){
			var ids = [];
			var objs = $('#orderForm_datagrid').datagrid('getChecked');
			if (null != objs && objs.length > 0){
				for(var i=0;i<objs.length;i++){
					ids.push(objs[i].id);
				}
				
				orderForm_remove(ids.join(','));
			}else{
				centerMsg('请至少选择一个项目');
			}
		}
		
		function orderForm_remove(ids){
			$.messager.confirm('提示', '确定删除此项目?', function(r){
				if (r){
					$.ajax({
						url:basePath+'orderForm/delete.do',
						method:'get',
						data:{'ids':ids},
						success:function(data){
							bottomRightMsg(data.message);
							$('#orderForm_datagrid').datagrid('reload');
						},
						error:function(data){
							centerMsg('请求有误，请稍后再试...');
						}
						
					});
				}
			
			});
		}
		
		
	</script>
	<div id="orderForm_win" class="easyui-window" title="运单管理" data-options="border:true,modal:true,closed:true,
	iconCls:'icon-save',collapsible:false,minimizable:false"
	style="width:;margin: 5px">
		<form id="orderForm_form" method="post">
			<input hidden=true name="id" id="orderForm_id"/>
	    	<table cellpadding="5">
	    		<tr>
	    			<td>运单号</td>
	    			<td><input  class="easyui-textbox" type="text" name="orderId" style="width: 280px;height: 30px" 
	    			data-options="disabled:true"></input></td>
	    			<td>运单类型</td>
	    			<td><input  class="easyui-combobox" type="text" name="orderType" style="width: 280px;height: 30px" 
	    			data-options="required:true,valueField:'value',textField:'name',editable:false,
		    			url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=orderType',method:'get'">
	    			</input></td>
	    			<td>运单金额</td>
	    			<td><input  class="easyui-numberbox" type="text" name="orderMoney" style="width: 280px;height: 30px" 
	    			data-options="value:'10.00',required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>货物类型</td>
	    			<td><input  class="easyui-textbox" type="text" name="goodsType" style="width: 280px;height: 30px" 
	    			data-options="required:true"></input></td>
	    			<td>货物重量/kg</td>
	    			<td><input  class="easyui-numberbox" type="text" name="goodsWeight" style="width: 280px;height: 30px" 
	    			data-options="required:true"></input></td>
	    			<td>货物体积/m<sup>3</sup></td>
	    			<td><input  class="easyui-numberbox" type="text" name="goodsVolume" style="width: 280px;height: 30px" 
	    			data-options="required:true"></input></td>
	    			
	    		</tr>
	    		<tr>
	    			<td>包装类型</td>
	    			<td><input  class="easyui-textbox" type="text" name="packType" style="width: 280px;height: 30px" 
	    			data-options="required:true"></input></td>
	    			<td>支付方式</td>
	    			<td><input  class="easyui-combobox" type="text" name="paymentType" style="width: 280px;height: 30px" 
	    			data-options="required:true,valueField:'value',textField:'name',editable:false,
		    			url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=payType',method:'get'"></input></td>
	    			<td>付费状态</td>
	    			<td><input  class="easyui-combobox" type="text" name="isPayment" style="width: 280px;height: 30px" 
	    			data-options="required:true,valueField:'value',textField:'name',editable:false,
		    			url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=paymentState',method:'get'"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>寄件人</td>
	    			<td><input class="easyui-textbox" type="text" name="senderName" style="width: 280px;height: 30px" 
	    			data-options="required:true"></input></td>
	    			<td>寄件手机</td>
	    			<td><input  class="easyui-textbox" type="text" name="senderMobile" style="width: 280px;height: 30px" 
	    			data-options="validType:'phone',required:true"></input></td>
	    			<td>寄件邮编</td>
	    			<td><input  class="easyui-textbox" type="text" name="senderZip" style="width: 280px;height: 30px" 
	    			data-options="validType:'zip',required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>寄件地址：</td>
	    			<td colspan="3"><textarea name="senderAddress" cols="70" rows="2"></textarea></td>
	    		</tr>
	    		<tr>
	    			<td>收件人</td>
	    			<td><input class="easyui-textbox" type="text" name="recipientsName" style="width: 280px;height: 30px" 
	    			data-options="validType:'',required:true"></input></td>
	    			<td>收件手机:</td>
	    			<td><input  class="easyui-textbox" type="text" name="recipientsMobile" style="width: 280px;height: 30px" 
	    			data-options="validType:'phone',required:true"></input></td>
	    			<td>收件邮编:</td>
	    			<td><input  class="easyui-textbox" type="text" name="recipientsZip" style="width: 280px;height: 30px" 
	    			data-options="validType:'zip',required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>收件地址：</td>
	    			<td colspan="3"><textarea name="recipientsAddress" cols="70" rows="2"></textarea></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>创建时间</td>
	    			<td><input class="easyui-textbox" type="text" name="createTime" style="width: 280px;height: 30px" 
	    			data-options="disabled:true"></input></td>
	    			<td>更新时间</td>
	    			<td><input  class="easyui-textbox" type="text" name="updateTime" style="width: 280px;height: 30px" 
	    			data-options="disabled:true"></input></td>
	    			<td>结束时间</td>
	    			<td><input  class="easyui-textbox" type="text" name="endTime" style="width: 280px;height: 30px" 
	    			data-options="disabled:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>操作员</td>
	    			<td><input id="orderForm_operator" class="easyui-textbox" value="${USER.name }" type="text" name="operator" style="width: 280px;height: 30px" 
	    			data-options="editable:false"></input></td>
	    			<td>工号</td>
	    			<td><input id="orderForm_number"  class="easyui-textbox" value="${USER.employeeNumber }" type="text" name="operatorNumber" style="width: 280px;height: 30px" 
	    			data-options="editable:false"></input></td>
	    			<td>订单状态</td>
	    			<td><input class="easyui-combobox" type="text" name="orderState" style="width: 280px;height: 30px" 
	    			data-options="required:true,valueField:'value',textField:'name',editable:false,
		    			url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=orderState',method:'get'">
		    			</input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>订单备注：</td>
	    			<td colspan="3"><textarea name="orderRemark" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="orderForm_submit" onclick="submit_orderForm_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close_orderForm_win()">关闭</a>
	    </div>
	</div>
<script type="text/javascript">
	
	function load_orderForm_form(id){
		$('#orderForm_form').form('load',basePath+'orderForm/findById.do?id='+id);
	}

	function close_orderForm_win(){
		$('#orderForm_win').window('close');
	}

	function submit_orderForm_form(){
		var url = basePath+"orderForm/save.do";
		if (null !=$('#orderForm_id').val() && '' != $('#orderForm_id').val() ){
			 url = basePath+"orderForm/update.do";
		}
		
		$('#orderForm_form').form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	//
				}
				return isValid;	
		    },
		    success:function(data){
		    	$('#orderForm_datagrid').datagrid('reload');
		    	var o = jQuery.parseJSON(data);
		    	bottomRightMsg(o.message);
		    	$('#orderForm_win').window('close');
		    }
		});
	}
	

</script>

</body>
</html>