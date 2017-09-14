<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 String path = request.getContextPath();  
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
        %>
        
    <script type="text/javascript">var basePath = '<%=basePath%>'</script>
	<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/util.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/datagrid-cellediting.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/valid.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>awesome/css/font-awesome.min.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>运单创建</title>
</head>
<body>
<form id="orderForm_form" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    		<input name="yun" hidden value="true"/>
	    			<td>运单类型</td>
	    			<td><input  class="easyui-combobox" type="text" name="orderType" style="width: 280px;height: 30px" 
	    			data-options="required:true,valueField:'value',textField:'name',editable:false,
		    			url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=orderType',method:'get'">
	    			</input></td>
	    			<td>包装类型</td>
	    			<td><input  class="easyui-textbox" type="text" name="packType" style="width: 280px;height: 30px" 
	    			data-options="required:true"></input></td>
	    			<td>支付方式</td>
	    			<td><input  class="easyui-combobox" type="text" name="paymentType" style="width: 280px;height: 30px" 
	    			data-options="required:true,valueField:'value',textField:'name',editable:false,
		    			url:'${pageContext.request.contextPath }/baseDict/findByType.do?type=payType',method:'get'"></input></td>
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
	    			<td>订单备注：</td>
	    			<td colspan="3"><textarea name="orderRemark" cols="70" rows="5"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    
	     <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" id="orderForm_submit" onclick="submit_orderForm_form()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript :history.back(-1);">取消</a>
	    </div>
	    
	    <script type="text/javascript">
	    function submit_orderForm_form(){
			var url = basePath+"orderForm/save.do";
			
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
			    	var o = jQuery.parseJSON(data);
			    	bottomRightMsg(o.message);
			    	if (o.success){
			    		$('#orderForm_form').form('clear');	
			    	}
			    }
			});
		}
	    
	    
	    </script>
	    
	    
</body>
</html>