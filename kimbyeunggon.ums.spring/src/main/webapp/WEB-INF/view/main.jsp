<%@page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>UMS</title>
	<meta charset="utf-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1">
	<link rel="styleheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
$(function(){
	regBtns();
});

var showUser = function(user){
	$(":input[name='name']").val($(user).data("userName"));
}

var regBtns = function(){
	var modal=$("#resultModal");//추가, 수정, 삭제 결과 창
	var msg = $("#msg"); //결과 메세지
	
	var chkName= function(){
		if($(":input[name=''name]").val())return true;
		else{
			msg.text("회원 이름을 입력하세요");
			modal.modal("show");
		}
	}
	
	//버튼 클릭시 이벤트
	$("#listBtn").bind("click", function(){
		var userList = $("#userList"); //회원목록
		var tr;
		var input;
		var etc;
		
		userList.empty();
		
		$.ajax({
			url:"listUsers",
			success:function(users){
				$(users).each(function(idx, user){
					tr = $("<tr></tr>");
					td = $("<td><input type='radio' name='userNo' value=""
							+user.userNo+"'xxxxonClick='showUser(this)'/>"
							+"&nbsp;&nbsp;&nbsp"
							+user.userNo+"</td>");
					td2 = $("<td>"+user.userName+"</td><td>"+user.regDate+"</td>");
					
					userList.append(tr.append(td).append(td2));
					td.fing("input").data("userName",user.userName);
					
				});
			}
		});
	});
	
	$("#addBtn").bind("click",function(){
		if(chkName()){
			$.ajax({
				url:"join",
				data:{userName:$("input[name='name']").val()},
				success:function(result){
					if(result)msg.text("추가 성공");
					else msg.text("추가 실패");
					$("#listBtn").trigger("click");
				},
				error:function(a, b, errMsg){
					msg.text("추가 실패:"+errMsg);
				},
				complete:function(){
					modal.modal("show");
				}
			});
		}
	});
	
	$("#updateBtn").bind("click",function(){
		if(chkName()){
			var user=$(":chsecked");
			if(user.size()){
				$.ajax({
					url:"fixUserInfo",
					data:{userNo:user.var(),userName:$("input[name='name']").val()},
					success:function(result){
						if(result) msg.text("수정 성공");
						else msg.text("수정 실패");
						$("#listBtn").trigger("click");
					},
					error:function(a, b, errMsg){
						msg.text("수정 실패:"+errMsg);
					},
					complete:function(){
						modal.modal("show");
					}
				});
			}else{
				msg.text("수정할 회원을 선택하세요");
				modal.modal("show");
			}
		}
	});
	
	$("#delBtn").bind("click",function(){
		var user = $(":checked");
		if(user.size()){
			$.ajax({
				url:"secede",
				data:{userNo:user.var()},
				success:function(result){
					if(result) msg.text("삭제 성공");
					else msg.text("삭제 실패");
					$("#listBtn").trigger("click");
				},
				error:function(a,b,errMsg){
					msg.text("삭제 실패:"+errMsg);
				},
				complete:function(){
					modal.modal("show");
				}
			});
		}else{
			msg.text("삭제할 회원을 선택하세요");
			modal.modal("show");	
		}
	});
}
</script>
<style>
	#sectiono1{
		border: solid black 1px;
		text-align:center;
	}
	#section2{
		padding-top: 30px;
	}
	table, th{
	text-align: center;
	}
</style>

</head>
<body>
	<div>
		<div id="section1">
			<h3>U M S</h3>
		</div>
		
		<div id="section2" class="container">
			<form>
				<div class="form-group">
					<input type="text" class="form-control" name="name" placeholder="name">
				</div>
				
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<button type="button" class="btn-btn-default" id="listBtn">
							<span class="glyphicon glyphicon-list"></span>list
						</button>
					</div>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default" id="addBtn">
						<span class="glyphicon glyphicon glyphicon-plus"></span>add
					</button>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default" id="updateBtn">
						<span class="glyphicon glyphicon-asterisk"></span>update
					</button>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default" id="delBtn">
						<span class="glyphicon glyphicon-remove"></span>delete
					</button>
				</div>
			</div>
			</form>
			<br>
			
			<div class="modal fade" id="resultModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="msg"></h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<table class="table">
			<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>등록일</th>
			</tr>
			</thead>
			<tbody id="userList">
			</tbody>
		</table>
	</div>
	
	</div>
</body>
</html>