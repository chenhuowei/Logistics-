 function centerMsg(msg){
        $.messager.alert({
            title:'警告',
            msg:msg,
            icon:'warning',
            showType:'show',
            style:{
                right:'',
                bottom:''
            }
        });
    }
	
function bottomRightMsg(msg){
        $.messager.show({
            title:'提示',
            msg:msg,
            border:false,
            icon:'info',
            showType:'show'
        });
    }

//








