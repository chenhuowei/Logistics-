<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.header{
	background-color: gray
}
</style>
</head>
<body>

<div  class="easyui-panel" data-options="region:'west',split:false,title:'菜单导航',
		iconCls:'fa fa-navicon fa-lg',tools:'#treeTool'" 
		style="width:150px;">
			<ul class="easyui-tree" id="left_tree"
			data-options="url:'${pageContext.request.contextPath }/menu/findAll.do',method:'get',
			
			animate:true">
			
			</ul>
</div>
	<div id="treeTool">
        <a class="icon-reload" onclick="reloadTree()"></a>
    </div>
    <div id="tree_contextMenu" class="easyui-menu" style="width:120px;">
		<div onclick="appendNode()" data-options="iconCls:'fa fa-plus'">增加节点</div>
		<div onclick="append()" data-options="iconCls:'icon-add'">增加菜单</div>
		<div onclick="edit()" data-options="iconCls:'fa fa-edit'">编辑菜单</div>
		<div onclick="rename()" data-options="iconCls:'fa fa-edit'">重命名</div>
		<div onclick="remove()" data-options="iconCls:'fa fa-remove'">删除</div>
	</div>
	
	<div id="tree_win" >
		<form id="tree_form" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>名称:</td>
	    			<td><input class="easyui-textbox" type="text" name="text" style="width: 280px;height: 30px" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>链接:</td>
	    			<td><input class="easyui-textbox" type="text" name="url" style="width: 280px;height: 30px" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>图标:</td>
	    			<td><input id="tree_icon" class="easyui-textbox" type="text" name="iconCls" style="width: 280px;height: 30px" data-options="value:'icon-file',required:true"></input></td>
	    		</tr>
	    			<input id="nodeId" hidden=true name="id" style="width: 280px;height: 30px"></input>
	    			<input id="tree_pid" hidden=true  name="pid" style="width: 280px;height: 30px"></input>
	    		<tr>
	    			<td>父菜单:</td>
	    			<td><input id="tree_pidText" data-options="disabled:true" class="easyui-textbox" name="pidText" style="width: 280px;height: 30px"></input></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a  class="easyui-linkbutton" onclick="submit()">提交</a>
	    	<a  class="easyui-linkbutton" onclick="closeWin()">关闭</a>
	    </div>
	</div>
	
	
<script type="text/javascript">
	$('#left_tree').tree({
		onClick: function(node){
			if ($('#left_tree').tree('isLeaf',node.target)){
				OpenTab(node.text, node.url,node.iconCls);
			}else{
				if (node.state == "open"){
					$('#left_tree').tree('collapse',node.target);
				}else{
					$('#left_tree').tree('expand',node.target);
				}
			}
				
		}
	});

 
  
  
	function reloadTree(){
	    $('#left_tree').tree('reload');
	}
	
	
	$('#left_tree').tree({
		onContextMenu: function(e, node){
			e.preventDefault();
			$('#left_tree').tree('select', node.target);
			$('#tree_contextMenu').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
			
		}
	});
	
	function appendNode(){
		$('#tree_form').form('clear');
		var node = $('#left_tree').tree('getSelected');
			$('#tree_pid').val(node.id);	
			$('#tree_pidText').textbox('setValue',node.text);	
			$('#tree_icon').textbox('setValue',"icon-file");	
	    $('#tree_win').window({
	    	title:'新增节点',
	    	iconCls:"icon-save",
			border:false,
	        width:350,
	        height:250,
	        modal:true,
	        collapsible:false,
	        minimizable:false,
	        maximizable:false,
	    });
	}
	function append(){
		$('#tree_form').form('clear');
		$('#tree_icon').textbox('setValue',"icon-files");	
	    $('#tree_win').window({
	    	title:'新增',
	    	iconCls:"icon-save",
			border:false,
	        width:350,
	        height:250,
	        modal:true,
	        collapsible:false,
	        minimizable:false,
	        maximizable:false,
	    });
	}
	function remove(){
		var node = $('#left_tree').tree('getSelected');
         $.messager.confirm('提示', '确定删除此项目?', function(r){
             if (r){
                 $.ajax({
                	 url:basePath+'menu/delete.do',
                	 method:'get',
                	 data:{'id':node.id},
                	 success:function(data){
                		 
                		 bottomRightMsg(data.message);
                		 reloadTree();
                	 },
                	 error:function(){
                		 
                	 }
                 })
             }
         });
	}
	function edit(){
		$('#tree_form').form('clear');
		var node = $('#left_tree').tree('getSelected');
		loadTreeNode(node);
	    $('#tree_win').window({
	    	title:'编辑',
			iconCls:"icon-edit",
			border:false,
	        width:350,
	        height:250,
	        modal:true,
	        collapsible:false,
	        minimizable:false,
	        maximizable:false,
	    });
	}
	function rename(){
		console.info(basePath);
	}
	
	function submit(){
		var url = basePath+"menu/save.do";
		if (null !=$('#nodeId').val() && '' != $('#nodeId').val() ){
			 url = basePath+"menu/update.do";
		}
		
		$('#tree_form').form('submit', {
		    url:url,
		    onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	// hide progress bar while the form is invalid
				}
				return isValid;	
		    },
		    success:function(data){
		    	reloadTree();
		    	var o = jQuery.parseJSON(data);
		    	bottomRightMsg(o.message);
		    	$('#tree_win').window('close');
		    }
		});
	}
	
   
	
	function loadTreeNode(node){
		var pText = $('#left_tree').tree('find',node.pid);
		var p = "";
		if (null != pText){
			p = pText.text;
		}
		$('#tree_form').form('load',{
			text:node.text,
			url:node.url,
			pid:node.pid,
			id:node.id,
			iconCls:node.iconCls,
			pidText:p,
		});
	}
	
	function closeWin(){
		$('#tree_win').window('close');
	}
	
	
</script>
</body>
</html>