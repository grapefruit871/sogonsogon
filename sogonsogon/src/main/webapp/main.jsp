<%@page import="org.springframework.ui.Model"%>
<%@page import="com.kh.sogon.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<style>
	@font-face {
		font-family: 'GmarketSansMedium';
		src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	@font-face {
		font-family: 'FontAwesome';
		src: url('../fonts/fontawesome-webfont.eot?v=4.7.0');
		src: url('../fonts/fontawesome-webfont.eot?#iefix&v=4.7.0') format('embedded-opentype'), url('../fonts/fontawesome-webfont.woff2?v=4.7.0') format('woff2'), url('../fonts/fontawesome-webfont.woff?v=4.7.0') format('woff'), url('../fonts/fontawesome-webfont.ttf?v=4.7.0') format('truetype'), url('../fonts/fontawesome-webfont.svg?v=4.7.0#fontawesomeregular') format('svg');
		font-weight: normal;
		font-style: normal;
	}
	@font-face {
		font-family: 'TmoneyRoundWindExtraBold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	@font-face {
		font-family: 'JSDongkang-Regular';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	@font-face { font-family: 'IBMPlexSansKR-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff'); font-weight: normal; font-style: normal; }
            
	.room-box {
		width: 100%;
		height: 400px;
		justify-content: center;
		flex-wrap: unset;
		font-family: 'JSDongkang-Regular';
		text-align: center;
	}
	
	.roomlist-box {
		width: 250px;
		height: 220px;
		border-radius: 2.5px;
		box-sizing: border-box;
		border: 2px solid black;
		margin-top : 30px;
		display: inline-block;
		text-align: center;
		box-shadow: 14px 14px rgb(255, 178, 181), -14px 14px rgb(255, 178, 181);
		position: relative;
	}
	
	.roomlist-box>img {
		width: 60px;
		position: absolute;
		bottom: 237px;
		margin: auto;
		top: 0; left: 0; right: 0;
	}
	
	#tagbox {
		width: 100%;
		height: 25px;
		text-align: center;
		position: relative;
		margin: 5px auto;
	}
	
	.tags {
		font-size: 14px;
		background-color: rgba(116, 116, 116, 0.1);
		display: inline-block;
		margin: 4px 4px 0px 4px;
		border-radius: 3px;
		padding: 2px;
	}
	
	.join-button {
		width: 90px;
		height: 30px;
		background-color: rgb(248, 162, 113);
		border-radius: 14px;
		margin: auto;
		color: white;
		line-height: 200%;
		margin-top: 12px;
		cursor: pointer;
	}
	
	.category {
		font-size: 14px;
		margin: 28px 0px 2px 0px;
	}
	
	.review-box>p {
		clear: both;
	}
	
	.room-title {
		font-size: 20px;
		margin: 0px;
	}
	
	.enter-number {
		margin-bottom: 1px;
		font-size: 13px;
	}
	
	.top-area {
		width: 100%;
		height: 100px;
		text-align: center;
		margin-top: 40px;
	}
	
	.modal-button2 {
		width: 100px;
		height: 35px;
		border-radius: 18px;
		background-color: rgb(248, 162, 113);
		line-height: 200%;
		float: left;
		color: white;
		text-decoration: none;
		margin: 0px 6px;
	}
	
	.button-area {
		height: 40px;
		width: 100%;
	}
	
	.button-area .btn {
		width: 80px;
		height: 38px;
		padding: 0px;
		border-radius: 10px;
		font-size: 18px;
		font-family: 'GmarketSansMedium';
	}
	
	.modal-btn-area2 {
		margin: 10px auto;
		width: 50%;
		box-sizing: border-box;
		top: 0px; bottom: 0px; left: 0px; right: 0px;
	}
	
	.m-title {
		height: 20%;
		font-size: 24px;
		margin: 0px 8px 0px 0px;
	}
	
	.m-passnotice {
		font-size: 13px;
	}
	
	.clear-btn {
		border: 2px solid white;
		color: white;
		text-align: center;
		text-decoration: none;
		width: 90px;
		height: 30px;
		border-radius: 14px;
		line-height: 160%;
		cursor: pointer;
	}

	/* 슬라이드 css */
	.section{
		width: 100%;
		padding-top:150px;
	}
	#carouselExampleCaptions{
		height: 25%;
	}
	#carouselExampleCaptions div{
		height: 100%;
	}
	#carouselExampleCaptions img{
		width: 100%;
	}
	#roomListArea{
		height: 300px;
		margin-top: 15px;
	}
	.container{
		width: 100%;
	}
		
	/* 테이블 css */
	th{
		background: rgba(252, 163, 17,0.9);
	}
	td{
		font-size: 13px;
		font-family: 'FontAwesome';
		
	}
	.boardTable > thead > tr > th:nth-child(1), 
	.notieTable > thead > tr > th:nth-child(1) {
		background: rgba(252, 163, 17,0.9);
		border-top-left-radius: 10px;
	}
	.boardTable > thead > tr > th:nth-child(4), 
	.notieTable > thead > tr > th:nth-child(4){
		background: rgba(252, 163, 17,0.9);
		border-top-right-radius: 10px;
	}
	#freeboard > tr:nth-child(3) > td:nth-child(1),
	#noticeBoard > tr:nth-child(3) > td:nth-child(1){
			border-bottom-left-radius: 10px;
	}
	#freeboard > tr:nth-child(3) > td:nth-child(4),
	#noticeBoard > tr:nth-child(3) > td:nth-child(4){
			border-bottom-right-radius: 10px;
	}
	
	.boardTable .notieTable{
		border-spacing: 5px;
		/* border-collapse: separate; */
	}
	.boardTable th,.boardTable td, .notieTable th, .notieTable td{
		padding: 8px;
	}
	.bordTitle{
		background-image: linear-gradient(transparent 50%, #F8CD07 40%);
		 font-family: 'TmoneyRoundWindExtraBold';
	}
	.freeBoard tr, .noticeBoard tr{
		cursor: pointer;
		background:#f8f9fa;
	}
	.tablesize{
		width: 500px;
		margin-top: 20px;
		overflow: hidden;
	}
	/* 테이블 css end */
	
	.more{
		width: 70px;
		height: 26px;
		font-size: 20px;
		border: 2px solid orange;
		border-radius: 10px;
		padding: 2px;
		font-size: 12px;
		margin-left: 4px;
		 font-family: 'TmoneyRoundWindExtraBold';
	}
		
	/* 광고영역 */
	.likelist{
	    background: #faf9f9;
	    width: 350px;
	    height: 250px;
	    text-align: center;
	    position: fixed;
	    bottom: 100px;
	    right: 100px;
	    padding: 10px;
	    border-radius: 5px;
	    border: 3px solid gray;
	    font-family: 'IBMPlexSansKR-Regular'; 
	}
	#close > a{
		color: black;
		text-decoration: none;
	}


</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script language="JavaScript">
        function setCookie( name, value, expiredays ) {
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays ); 
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }
        function closePop() {
            if ( document.pop_form.chkbox.checked ){
                setCookie( "maindiv", "done" , 1 );
            }
            document.all['layer_popup'].style.visibility = "hidden";
        }
</script>

</head>

<body>
	<jsp:include page="WEB-INF/views/common/header.jsp" />

<!-- 이미지 슬라이드 영역 -->

  <section id="content">
  
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
        	<img src="${contextPath}/resources/images/banner_3.png">
          <div class="carousel-caption d-none d-md-block">

          </div>
        </div>
        <div class="carousel-item">
        	<img src="${contextPath}/resources/images/banner_2.png">
          <div class="carousel-caption d-none d-md-block">

          </div>
        </div>
        <div class="carousel-item">
        	<img src="${contextPath}/resources/images/슬라이드3.png">
          <div class="carousel-caption d-none d-md-block">

          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <!-- 이미지 슬라이드 영역 end -->
    
<!-- body with:100%할시 container이름변경  -->
	<div class="container" >


		<hr>

      <div class="row">
         <div class="col-lg-6" align="center">
            <p>
            <h2><span class="bordTitle">자유게시판</span></h2>
            </p>
            <table class="boardTable tablesize" >
               <thead>
                  <tr>
                     <th>글번호</th>
                     <th>분류</th>
                     <th>제목</th>
                     <th>작성자</th>
                  </tr>
               </thead>
               <tbody id="freeboard"  class="freeBoard">
               </tbody>
            </table>
         </div>

         <div class="col-lg-6" align="center">
            <p>
            <h2><span class="bordTitle">공지사항</span></h2>
            </p>
            <table class="notieTable tablesize">
			<thead>
                  <tr>
                     <th>글번호</th>
                     <th>분류</th>
                     <th>제목</th>
                     <th>작성자</th>
                  </tr>
               </thead>
               <tbody id="noticeBoard"  class="noticeBoard">
               </tbody>
            </table>
         </div>
      </div>



      <hr>

      <div class="row">
         <div class="col-lg-12" align="center">
            <h2>
            <span class="bordTitle">방 리스트 최신순</span>
            <span class="more"><a style="text-decoration: none; color: #5D5D5D;"  href="${contextPath}/room/roomList/1">더보기</a></span>
            </h2>
            <p></p>
         </div>
      </div>

      <div class="row" id="roomListArea">
         <div class="col-lg-3" align="center">

            <div class="room-box">
               <div class="roomlist-box">
                  <img src="${contextPath}/resources/images/clip.png">


                  <p class="room-content">
                  <p class="category"  id="category0"></p>
                  <p class="room-title" id="room-title0">${roomList.roomTitle}</p>
                  <p class="enter-number">
                     방장 :<span id="member-nick0"></span>
                     <br> 참가인원 : <span id="member-count0"></span>/<span id="max-count0"></span>명 <br>
                      개설일 : <span id="create-date0"></span>
                     ${createDate}
                  </p>


                  <div id="tagbox">
                     <div class="tags" id="tags0">#${tag}</div>
                  </div>
                  
				 
                  <a data-toggle="modal" data-target="#myModal">
                     <div class="join-button" id="join-button0">참여하기</div>
				 <input type="hidden"  id="roomNo0">
                  </a>
               </div>
               <!-- roomlist end-->
            </div>
            <!--room-container end-->


         </div>
         <div class="col-lg-3" align="center">

            <div class="room-box">
               <div class="roomlist-box">
                  <img src="${contextPath}/resources/images/clip.png">


                  <p class="room-content">
                  <p class="category"  id="category1"></p>
                  <p class="room-title"  id="room-title1">${roomList.roomTitle}</p>
                  <p class="enter-number">
                     방장 :<span id="member-nick1"></span>
                     <br> 참가인원 : <span id="member-count1"></span>/<span id="max-count1"></span>명 <br>
                      개설일 : <span id="create-date1"></span>
                  </p>
                  <div id="tagbox">
                     <div class="tags" id="tags1"></div>
                  </div>
					
				
                  <a data-toggle="modal" data-target="#myModal">
                     <div class="join-button" id="join-button1">참여하기</div>
					 <input type="hidden"  id="roomNo1">	
                  </a>
               </div>
               <!-- roomlist end-->
            </div>
            <!--room-container end-->

         </div>
         <div class="col-lg-3" align="center">


            <div class="room-box">
               <div class="roomlist-box">
                  <img src="${contextPath}/resources/images/clip.png">
                  <p class="room-content">
                  <p class="category" id="category2"></p>
                  <p class="room-title"  id="room-title2">${roomList.roomTitle}</p>
                  <p class="enter-number">
                     방장 :<span id="member-nick2"></span>
                     <br> 참가인원 <span id="member-count2"></span>/<span id="max-count2"></span>명 <br>
                      개설일 : <span id="create-date2"></span>
                  </p>


                  <div id="tagbox">
                     <div class="tags" id="tags2"></div>
                  </div>
				
				 
                  <a data-toggle="modal" data-target="#myModal">
                     <div class="join-button" id="join-button2">참여하기</div>
				 <input type="hidden"  id="roomNo2">
                  </a>
               </div>
               <!-- roomlist end-->
            </div>
            <!--room-container end-->

         </div>
         <div class="col-lg-3" align="center">

            <div class="room-box">
               <div class="roomlist-box">
                  <img src="${contextPath}/resources/images/clip.png" style="width: 60px;">
                  <p class="room-content">
                  <p class="category"  id="category3"></p>
                  <p class="room-title"  id="room-title3"></p>
                  <p class="enter-number">
                     방장 :<span id="member-nick3"></span>
                     <br> 참가인원 : <span id="member-count3"></span>/<span id="max-count3"></span>명 <br>
                      개설일 : <span id="create-date3"></span>
                  </p>


                  <div id="tagbox">
                     <div class="tags" id="tags3"></div>
                  </div>
				
                  <a data-toggle="modal" data-target="#myModal">
                     <div class="join-button" id="join-button2">참여하기</div>
				 <input type="hidden"  id="roomNo2">
                  </a>
               </div>
               <!-- roomlist end-->
            </div>
            <!--room-container end-->

         </div>
      </div>
   </div>
   
   
      <!-- Modal -->
      <c:if test="${!empty loginMember}">
     <form class="transPage" method="post" style="font-family: 'GmarketSansMedium';">
     <div class="modal fade" id="myModal" role="dialog" style="text-align: center;">
       <div class="modal-dialog ">
         <div class="modal-content">
           <div class="modal-header">입장하기
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title"></h4>
           </div>
           <div class="modal-body">

               <p class="m-title" style="font-weight: bold;"></p>
               <p class="m-content" style="margin-bottom: 6px; font-size: 14px;"></p>
              
              <div class="pass-area">
             	    <img src="${contextPath}/resources/images/lock.png"  style="width: 40px;">

                 <p style="margin: 0px;">참여 번호 입력</p>
                  <input type="password" placeholder="영문/숫자 4~10자리"  name="inputPwd" style="margin-top: 10px;"> 
                 <p class="m-passnotice">
                       참여 비밀 번호가 필요한 채팅방입니다.<br>
                       참여 비밀 번호를 입력해 주세요.
                 </p>
  				  <input type="hidden"  class="hiddenNo" name="roomNo"> <!--  hiddenNo 영역보일시 display:none처리-->
              </div>

            
            <div class="modal-btn-area2" > 
              	<button type="button"  class="modal-button2" data-dismiss="modal">뒤로가기</button>
                <button type="button"  class="modal-button2" id="modal-btn">참여하기</button>
            </div>
      
           </div>
         </div>
       </div>
     </div>
     </form> <!-- modal end -->
     </c:if>
     
     <!-- 광고영역 -->
        <div class="likelist"  id="layer_popup" style="visibility: visible;" >
       		 <img src="${contextPath}/resources/images/smile.png" style="width:25px; margin-bottom: 10px;">
            <hr width="50px;" style="margin: auto;">
            
            <h5 style="margin-top: 10px; font-weight: bold;">이달의 지식왕</h5>

            <div>1등. <span class="likeCount" id="likeCount0"></span> - 상품권 만원</div>
            <div>2등. <span class="likeCount" id="likeCount1"></span> - 상품권 오천원</div>
            <div>3등. <span class="likeCount" id="likeCount2"></span> - 상품권 오천원</div>
         	<div style="font-size: 12px; margin-bottom: 6px; color: gray; margin-top: 2px;">
             입력하신 연락처로 연락드립니다.<br>
             마이페이지에서 연락처를 확인해주세요.<br>    	
         	</div>
	        <form name="pop_form">
	            <span id="check"><input type="checkbox" name="chkbox" value="checkbox" style="margin-right:5px;">오늘 하루동안 보지 않기</span>
	            <span id="close" style="margin:auto;"><a href="javascript:closePop();" >닫기</a></span>
	        </form>

        </div>

     
   <jsp:include page="WEB-INF/views/common/footer.jsp" />

	<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->
	<script type="text/javascript">
	// 방리스트 최신순 조회
	$(function() {
		$.ajax({
			url: "${contextPath}/room/mainRoomList",
			type : "POST",
			dataType : "JSON",
			success: function(roomList){
				
				for(var i=0; i<roomList.length; i++){
					var tags =(roomList[i].roomTag).split(",");
					
					console.log(tags);
					
					if(roomList[i].roomType == "1"){
						var caregoryName = "IT";
					}else if(roomList[i].roomType == "2"){
						var caregoryName = "공모전";
					}else if(roomList[i].roomType == "3"){
						var caregoryName = "면접";
					}else if(roomList[i].roomType == "4"){
						var caregoryName = "전공";
					}else if(roomList[i].roomType == "5"){
						var caregoryName = "외국어";
					}else{
						var caregoryName = "기타";
					}
					
					//$("#category"+i).text(roomList[i].roomType);
					$("#category"+i).text(caregoryName);
					$("#room-title"+i).text(roomList[i].roomTitle);
					$("#tags"+i).text(tags);
					$("#member-nick"+i).text(roomList[i].memberNick);
					$("#member-count"+i).text(roomList[i].roomMemberCount);
					$("#max-count"+i).text(roomList[i].roomMaxNumber);
					$("#create-date"+i).html(roomList[i].roomCreateDate);
					$("#roomNo"+i).html(roomList[i].roomNo);
					
				}
			},error: function(){
				 console.log("ajax 통신 실패");
			}	
		}); /* ajax end */
		
	});
	
	if("${loginMember}" != ""){
		for(var i=0; i<4; i++){		
			$("#join-button"+i).on("click",function(){
				// 참여하기 버튼 눌렀을 때 방번호 얻기
				var roomNo = $(this).next().text();
				//console.log(roomNo);
				 $(".transPage").prop("action", "${contextPath}/room/roomDetail/"+ roomNo);
				  
				$.ajax({
					url : "${contextPath}/room/roomMList/"+roomNo,
					type : "POST",
					dataType : "JSON",
					success : function(map){
						$(".m-title").html("\""+map.room.roomTitle+"\''");
						$(".m-content").html(map.room.roomContent);
						
						// 비공개 방인경우 비밀번호 입력창 사라짐
						if(map.room.roomOpen == 'Y' ){
							$(".pass-area").css("display","none");
						}
						
						// 로그인한 멤버가 이미 가입한 방일때 
						for(var i=0; i<map.roomMember.length; i++){
							if(roomNo == map.roomMember[i].roomMemberRoomNo){
								$(".pass-area").css("display","none");
								$(".m-content").append("<br><br>이미 가입한 방입니다.<br>바로 입장이 가능합니다.");
							}
						} 
			
					},error : function(){
						 console.log("ajax 통신 실패");
					}
				}); /*ajax end  */
				
				//$("#myModal").open();
			});
		}
	}
	
	$("#modal-btn").click(function(){
		//$(".transPage").submit();
		location.href=$(".transPage").attr("action");
	});
	
	// ------------------자유게시판 실시간 조회-----------------------------
		$(function(){
			NewboardList(); 	// 함수 호출
			// 일정시간(1분)마다 리스트 갱신
			//setInterval(function(){NewboardList()}, 60000);

		});
		
		function NewboardList(){
			$.ajax({
				url: "${contextPath}/board/mainBoardList",
				dataType : "json",
				success: function(boardList){
					$("#freeBoard").html(""); // 리스트 갱신을 위해 이전 내용 삭제
					
					$.each(boardList, function(index, item){
						var splitTitle = (item.qnaTitle).substring(0,22);
						
						var $tr = $("<tr>"); // 행
						var $td1 = $("<td>").text(" "+item.qnaNo);
						var $td2 = $("<td>").text(item.qnaCategory);
						var $td3 = $("<td>").text(splitTitle);
						var $td4 = $("<td>").text(item.writerNick);		
						
						$tr.append($td1, $td2, $td3, $td4);
						
						$(".freeBoard").append($tr);
					});
					
				},error : function(){
					console.log("ajax 통신 실패");
				}
			})
		}
		
	//----------------------공지사항 실시간 조회----------------------------
		$(function(){
			$.ajax({
				url: "${contextPath}/mypage/mainNoticeList",
				dataType : "json",
				success: function(noticeList){
					$(".noticeBoard").html(""); // 리스트 갱신을 위해 이전 내용 삭제
					
					$.each(noticeList, function(index, item){
						var splitTitle = (item.qnaTitle).substring(0,22);
						var $tr = $("<tr>"); // 행
						var $td1 = $("<td>").text(item.qnaNo);
						var $td2 = $("<td>").text(item.qnaCategory);
						var $td3 = $("<td>").text(splitTitle);
						var $td4 = $("<td>").text(item.writerNick);		
						
						$tr.append($td1, $td2, $td3, $td4);
						$(".noticeBoard").append($tr);
					});
					
				},error : function(){
					console.log("ajax 통신 실패");
				}
			})

		});
	
	// 자유게시판 클릭시 이동
	$(function(){
		// ajax로 얻은 데이터는 동적인 움직임으로 조정가능 -> $(document).on("click", ".freeBoard td", function(){
		$(document).on("click", ".freeBoard td", function(){
			var fBoardNo = $(this).parent().children().eq(0).text();
			console.log(fBoardNo);
			location.href="${contextPath}/board/"+fBoardNo;
		});
	});
	
	// 공지사항 클릭시 이동
	$(function(){
		$(document).on("click", ".noticeBoard td", function(){
			var nBoardNo = $(this).parent().children().eq(0).text();
			console.log(nBoardNo);
			location.href="${contextPath}/board/"+nBoardNo;
		});
	});
	
	// 팝업레이어에 데이터 입력
	$(function(){
		$.ajax({
			url: "${contextPath}/room/mainLikeList",
			dataType : "json",
			success: function(mainLikeList){
				
				$.each(mainLikeList, function(index, item){
					var $memberNick = item.roomMemberNick;
					var $likeCount = item.LikeCount;
				
					 //console.log($memberNick);
					 //console.log($likeCount);
					$("#likeCount"+index).text($memberNick+"님" + "(좋아요:" +$likeCount +")");
				});
			},error: function(){
				console.log("ajax 통신 실패");
			}
		});
	});
	
	
	cookiedata = document.cookie;   
    if ( cookiedata.indexOf("maindiv=done") < 0 ){     
        document.all['layer_popup'].style.visibility = "visible";
    }
    else {
        document.all['layer_popup'].style.visibility = "hidden";
    }

	</script>
</body>
</html>