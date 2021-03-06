<!--  
 * @개요   : 대쉬보드 페이지
 * @파일명 : project/dashboard.jsp
 * @작성자 : 이종윤
 * @작성일 : 2017. 5. 29.
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<style>
.daysLeft {
	color: black;
}

.foot {
	background: white;
}

#memo {
	overflow: auto;
	height: 250px;
	width: 100%;
	border: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
}

.panel-today {
	background: #a8c8f9;
}

.panel-memo {
	background: #c2e0ba;
}

.panel-d-day {
	background: #fc9ebd;
}

.panel-action {
	background: #ffdda6;
}
</style>
<div id="page-wrapper">
	<input type="hidden" id="chatName" value="${chatName}" />
	<div class="col-md-12" style="margin-top: 50px">
		<div class="col-lg-6 col-md-6">
			<div class="col-lg-12 col-md-12">
				<div class="panel panel-today">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12 text-center">
								<div class="huge">오늘 할 일</div>
							</div>
						</div>
					</div>
					<div class="panel-footer" style="background-color: white; height: 15em">
						<div class="row">
							<div class="col-xs-12 text-left">
								<c:forEach items="${todayList }" var="todayList" varStatus="status">
									<div>${status.index + 1 }. ${todayList}</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>

			<form action="/project/memoUpdate" method="POST">
				<div class="col-lg-12 col-md-12" style="height: 50%">
					<div class="panel panel-memo">
						<div class="panel-heading">
							<div class="row">
							
								<div class="col-xs-2 text-left">
									<button type="button" class='btn btn-success btn-circle btn-lg' id="delBtn">
										<i class="fa fa-trash"></i>
									</button>
								</div> 
								
								<div class="col-xs-8 text-center">
									<div class="huge">메모</div>
								</div>
								
								<div class="col-xs-2 text-right">
									<button type='submit' class='btn btn-success btn-circle btn-lg'>
										<i class="fa fa-check"></i>
									</button>
								</div>
								
							</div>
						</div>
						<div class="panel-footer textarea" style="background-color: white;">
							<div class='row'>
								<div class='col-xs-12'>
									<textarea id="memo" name="memo" placeholder="자유롭게 작성하세용 :)" >${memo }</textarea>
									<input type="hidden" id="userNo" name="userNo" value="${login.userNo }"> 
									<input type="hidden" id="projectListNo" name="projectListNo" value="${projectListNo}"> 
									<input type="hidden" id="msg" name="msg" value="${msg}">
									<script>
									if($("#memo").val().trim().length <1){
										swal({
								            title: '메모를 입력해 주세요!',
								            text: '',
								            type: 'warning',
								            confirmButtonText: '닫기'
								          })
									} else{
										if ($("#msg").val() == "success") {
											swal('메모가 저장되었습니다!', '', 'success')
										}
										
									}
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>

		</div>
		<div class="col-lg-6 col-md-6">
			<div class="col-lg-6 col-md-6">
				<div class="panel panel-d-day">
					<div class="panel-heading">
						<div class='row'>
							<div class='col-xs-12 text-center'>
								<div class="huge">D-Day</div>
								<input type="hidden" id="endDate" name="endDate" value="${endDate}">
							</div>
						</div>
					</div>
					<div class="panel-footer foot">
						<div class='row'>
							<div class='col-xs-12 text-center'>
								<div class='huge daysLeft'  id="d_day"> </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="panel panel-action">
					<div class="panel-heading">
						<div class='row'>
							<div class='col-xs-12 text-center'>
								<div class="huge">달성률</div>
							</div>
						</div>
					</div>
					<div class="panel-footer foot">
						<div class='row'>
							<div class='col-xs-12 text-center'>
								<div class='huge daysLeft'>${actionPercent }</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12">
				<div class="panel">
					<div class="panel-heading">
						<div class="row">
							<div class="calendar"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->

<!-- Action Percent -->
<script>
	$(function() {
		$('.calendar').pignoseCalendar({
			date : moment(),
			lang : 'ko',
			theme : 'light'
		});
		
		/** 메모 초기화 */
		$("#delBtn").on("click", function() {
			$("#memo").val("");
		});
		
		/** D-Day 계산 */
		var str = $("#endDate").val().split('-');
		var year = str[0];
		var month = str[1];
		var date = str[2];
		
		var today = new Date();
		var dday = new Date(year, month-1, date	);
		
		var gap = dday-today;
		var currDay = 24 * 60 * 60 * 1000; // 시 * 분 * 초 * 밀리세컨
		
		var day = Math.ceil(gap/currDay);
		
		if (day == 0) {
			$("#d_day").html("D-DAY!");
			return;
		}
		
		if (day < 0 ) {
			$("#d_day").html("프로젝트 종료");
			return;
		}
		
		$("#d_day").html("D-"+day);
	
	});
</script>

