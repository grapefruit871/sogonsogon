<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
/*댓글*/
.replyWrite>table {
	width: 90%;
	margin-top : 100px;
}

#replyContentArea {
	width: 90%;
}

#replyContentArea>textarea {
	resize: none;
	width: 100%;
}

#replyBtnArea {
	width: 100px;
	text-align: center;
}

.rWriter {
	display : inline-block;
	margin-right: 30px;
	vertical-align: top;
	font-weight: bold;
	font-size: 1.2em;
}

.rDate {
	display : inline-block;
	font-size: 0.5em;
	color: gray;
}

#replyListArea {
	list-style-type: none;
}

.rContent, .btnArea{
	display: inline-block;
	box-sizing: border-box;
}

.rContent {
	height: 100%;
	width : 100%;
	word-break:normal;
}

.btnArea {
	height: 100%;
	width : 180px;
	text-align: right;
	float: right;
    margin-bottom: 10px;
}

hr{
    clear: both;
}

.replyUpdateContent{
	resize: none;
	width: 70%;
}


/* 답글 */
.reply2-li{
	padding-left: 50px;  
}

.reply2Area{
	padding-top : 30px;
	width : 80%;
}

.reply2Content{
	resize: none;  
	width : 100%; 
}

</style>
<div id="reply-area ">
	<!-- 댓글 작성 부분 -->
	<div class="replyWrite">
		<table align="center">
			<tr>
				<td id="replyContentArea"><textArea rows="3" id="replyContent"></textArea>
				</td>
				<td id="replyBtnArea">
					<button class="btn btn-primary" id="addReply">댓글<br>등록</button>
				</td>
			</tr>
		</table>
	</div>


	<!-- 댓글 출력 부분 -->
	<div class="replyList mt-5 pt-2">
		
		<div id="replyListArea">
		</div>
	</div>

	
</div>

<script>


// 댓글
// 페이지 로딩 완료 시 댓글 목록 호출
$(function(){
	selectReplyList();
});

// 댓글 목록 불러오기
function selectReplyList(){
	var url = "${contextPath}/reply/selectList/${board.qnaNo}";
	console.log(url);
	$.ajax({
		url : url,
		type : "POST",
		dataType:"json",
		success:function(rList){
			
			
			
			
			var $replyListArea = $("#replyListArea");
			
			$replyListArea.html(""); 
			
			var loginMemberNo = "${loginMember.memberNo}";
		
			$.each(rList, function(i){
				
				
				
				var $li = $("<li>").addClass("reply-row").attr("id", rList[i].replyNo);
				
				// 작성자, 작성일, 수정일 영역 
				var $div = $("<div>");
				var $rWriter = $("<a>").addClass("rWriter idSelect").html(rList[i].writerNick);
				var $rDate = $("<p>").addClass("rDate")
								.html("작성일 : " + rList[i].replyCreateDate + "<br>"
											+ "마지막 수정 날짜 : " + rList[i].replyModifyDate);
				var $rButton = null;
				
				
				
				console.log("${board.qnaWriter}")
				console.log("${loginMember.memberId}")
				<c:if test="${fn:trim(board.qnaWriter) eq fn:trim(loginMember.memberNo)}">
				$rButton = $("<button>").addClass("btn btn-sm btn-primary ml-1 adoption").text("채택").attr("onclick", "addAdoption(this, "+rList[i].replyNo+")");
				</c:if>
			
				$div.append($rWriter).append($rDate).append($rButton);
				
				
				// 댓글 내용
				var $rContent = $("<p>").addClass("rContent").html(rList[i].content);
				
				
				// 답글, 수정, 삭제 버튼 영역
				var $btnArea = $("<div>").addClass("btnArea");

				
				// 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
				
				if(rList[i].replyWriter == loginMemberNo){
					
					var $showUpdate = $("<button>").addClass("btn btn-sm btn-primary ml-1").attr("id","replyUpdate").text("수정").attr("onclick", "updateReplyArea(this, "+rList[i].parentReplyNo+")");
					var $deleteReply = $("<button>").addClass("btn btn-sm btn-primary ml-1").attr("id","replyUpdate").text("삭제").attr("onclick", "deleteReply(this, "+rList[i].replyNo+")");
					$btnArea.append($showUpdate, $deleteReply);
				}
				
				
				// 댓글 경계선
				var $hr = $("<hr>");
		
				
				// 댓글 하나로 합치기
				$li.append($div).append($rContent).append($btnArea);
				//console.log(rList[i].replySelect);
				
				var $p;
				if(rList[i].replySelect == 'Y') {
					$p = $("<span>").addClass("fas fa-check-circle").text(" 채택되었습니다 (채택 시 수정, 삭제가 불가능합니다)").css("background-color", "#db6b6b");
					$("#" + parseInt(rList[i].replyNo)).css("background-color", "#db6b6b").append($p);
					$("#" + parseInt(rList[i].replyNo)).children(".btnArea").remove();
					$(".adoption").remove();
				}
				
				$li.append($p);
				
				// 댓글 영역을 화면에 배치
				$replyListArea.append($li).append($hr);
				
			});
			chkAdoption();
		}, error : function(request, status, error){
			 	console.log("ajax 통신 오류");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        
		}
	});
}

//-----------------------------------------------------------------------------------------
// 댓글 등록
$("#addReply").on("click", function(){
	
	
	var replyContent = $("#replyContent").val();
	
	
	if(${empty loginMember} == true){
		alert("로그인 후 이용해 주세요.");	
		
	}else{
		
		if(replyContent.trim().length == 0){
			alert("댓글 작성 후 클릭해주세요.");
			$("#replyContent").focus();
			
		
		}else{
			var url = "${contextPath}/reply/insertReply/${board.qnaNo}";
			var memberId = "${loginMember.memberNo}"; 
				$.ajax({
					url : url,
					type : "POST",
					data : {"memberId" : memberId,
							"content" : replyContent},
					dataType : "text",
					success : function(result){
						
						
						alert(result);
						$("#replyContent").val("");
						selectReplyList();
					},error : function(){
						console.log("통신 실패");
					}
			});
		}
	} 
});

//댓글 채택
function addAdoption(el, replyNo) {
	var cancleConfirm = confirm("채택하시겠습니까?");
	var memberNo = "${loginMember.memberNo}";
	var qnaNo = "${board.qnaNo}";
	
	if(cancleConfirm) {
		$.ajax({
			url : "${contextPath}/reply/adoptionReply/" + replyNo,
			type : "post",
			data : {"memberNo" : memberNo, "qnaNo" : qnaNo},
			success : function(result) {
				alert(result);
				console.log("채택 !!");
				$p = $("<span>").text(" **********채택된 댓글입니다.*************").css("color", "#1010c4");
				$(el).parent().parent().css("background-color", "#db6b6b").append($p);
				$(el).parent().parent().children(".btnArea").remove();
				$(".adoption").remove();
				// 유지가 안됨...
			},error : function() {
				console.log("통신 실패");
			}
		});
	}
}


// 댓글 채택 있는지 확인
function chkAdoption() {
	var qnaNo = "${board.qnaNo}";
	$.ajax({
		url : "${contextPath}/reply/adoptionReplyChk/" + qnaNo,
		type : "post",
		success : function(result) {
			if(result > 0) {
				$p = $("<span>").addClass("fas fa-check-circle").text(" 채택되었습니다 (채택 시 수정, 삭제가 불가능합니다)");
				$("#" + parseInt(result)).css("background-color", "#db6b6b").append($p);
				$("#" + parseInt(result)).children(".btnArea").remove();
				$(".adoption").remove();
			}
		},error : function() {
			console.log("통신 실패");
		}
	});
}



// 삭제
function deleteReply(el, replyNo) {
	var cancleConfirm = confirm("정말 댓글 삭제하시겠습니까?");
	
	if(cancleConfirm) {
		$.ajax({
			url : "${contextPath}/reply/deleteReply/" + replyNo,
			type : "get",
			success : function(result) {
				alert(result);
				selectReplyList();
			}, error : function() {
				console.log("통신 실패");
			}
		});
		
		return cancleConfirm;
	}
}
//-----------------------------------------------------------------------------------------

//댓글 수정 클릭 동작
 function updateReplyArea(el, parentReplyNo){
 	
 	
 	
 	if(true){
 	
 	var replyOldContent = $(el).parent().prev().text();
 	
 	var $textArea = $("<textArea rows='3' cols='150'>").addClass("updateReplyContent").val(replyOldContent);
 	
 	$(el).parent().prev().last("p").hide();
 	$(el).parent().prev().last().append($textArea);
 	$(el).parent().hide();
 	

 		var $div = $("<div>").addClass("updateReplyArea");
 		var $btnArea = $("<div>").addClass("btnArea");
 		
 		var $insertBtn = $("<button>").addClass("btn btn-sm btn-primary ml-1").text("등록").attr("onclick", "updateReply(this, " + $(el).parent().parent().attr('id') +")");
 		var $cancelBtn = $("<button>").addClass("btn btn-sm btn-secondary ml-1 updateReply-cancle").text("취소").attr("onclick", "cancelReply2()");
 		
 		$btnArea.append($insertBtn,$cancelBtn);
 		
 		$div.append($textArea, $btnArea);  
 		$(el).parent().after($div);
 	}
 	$(".updateReplyContent").focus();
 }
 
//댓글 수정
 function updateReply(el, replyNo){
 	console.log($(el).parent().prev().val());
 	console.log(replyNo);
 	
 	
 	var replyContent = $(el).parent().prev().val();
 	
 	$.ajax({
 		url : "${contextPath}/reply/updateReply/${board.qnaNo}",
 		data : {"content" : replyContent,
 				"replyNo" : replyNo},
 		dataType : "text",
 		success : function(result){
 			alert(result);
 			
 			selectReplyList();
 		},error : function(){
 			console.log("통신 실패");
 		}
 	});  
 }
 

</script>