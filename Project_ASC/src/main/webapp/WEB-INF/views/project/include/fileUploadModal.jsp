<%@ page contentType="text/html; charset=UTF-8"%>
<style>
.fileDrop {
	width: 100%;
	height: 50px;
}

.uploadedList {
	width: 100%;
	height: 200px;
}

</style>
<!-- Modal -->
<div class="modal fade" id="fileUploadModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="background: #354555; color: #ffffff;">
				<button type="button" class="close" data-dismiss="modal"></button>
				<h4 class="modal-title" style="font-weight: bolder;">
					파일 업로드 <i class="fa fa-upload fa-lg"></i>
				</h4>
			</div>

			<form id="uploadForm" action="/project/uploadAjax" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-2 col-xs-offset-1">
							<label style="font-size: 15px;"> 제목 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" id="" style="width: 100%;">
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-xs-2 col-xs-offset-1"></div>
						<div class="col-xs-8">
							<div class="thumbnail">
								<div class="uploadedList" id="holder"></div>
							</div>
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-xs-2 col-xs-offset-1">
							<label style="font-size: 15px;">파일 선택</label>
						</div>
						<div class="col-xs-8">
							<input type="file" class="fileSelect" name="file" style="width: 100%">
						</div>
					</div>
					<br>
					
					<div class="row">
						<div class="col-xs-2 col-xs-offset-1">
							<label style="font-size: 15px;">파일 선택 (드래그)</label>
						</div>
						<div class="col-xs-8">
							<div class="thumbnail">
								<div class="fileDrop"><label class="text-center"> 파일을 이곳에 드래그해 주세요 :) </label></div>
							</div>
						</div>
					</div>


					<div class="modal-footer">
						<div class="row">
							<div class="col-xs-2 col-xs-offset-4">
								<button type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">등록</button>
							</div>
							<div class="col-xs-2">
								<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
$(function() {

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	$(".uploadedList").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	$(".uploadedList").on("drop", function(event) {
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
		
		// 전달된 파일 데이터를 가져오는 부분
		var files = event.originalEvent.dataTransfer.files;	// dataTransfer : 이벤트와 같이 전달된 데이터, dataTransfer.files : 그 안에 포함된 파일 데이터 찾아내기 위함
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file", file);
		
		$.ajax({
			url: '/project/uploadAjax',
			data : formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data) {
				var str ="";
				
				console.log(data);
				console.log(checkImageType(data));
				console.log(getOriginalName(data));
				
				if (checkImageType(data)) {
					str ="<div>"
						+ "<a href='displayFile?fileName=" + getImageLink(data) + "' style='color: black'>"
						+ "<img src='displayFile?fileName="+data+"'/>"
						+ "</a>"
						+ "<small data-src=" + data +"> X </small>" 
						+"</div>";
				} else {
					str ="<div>"
						+ "<a href='displayFile?fileName=" + data + "' style='color: black'>"
						+ getOriginalName(data) + "</a>"
						+ "<small data-src=" + data +"> X </small>"
						+"</div>";
				}
				
				$(".uploadedList").append(str);
			}
		});
	});
	
	var holder =  document.getElementById('holder');
	
	$(".fileSelect").on("change", function(e) {
		e.preventDefault();
		
		console.log("파일 선택");
		
		
		var file = $(".fileSelect").files[0];
		var reader = new FileReader();
		
		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;
	
			holder.innerHTML = '';
			holder.appendChild(img);
		};
		
		reader.readAsDataURL(file);
		
		return false;
	});
	
	/** 첨부 파일 삭제 처리 */
	$(".uploadedList").on("click", "small", function(event) {		// small 태그로 처리된 'X' 클릭 이벤트
		var that = $(this);
		
		$.ajax({
			url:"/project/deleteFile",
			type: 'POST',
			data : {fileName: $(this).attr("data-src")},
			dataType: 'text',
			success : function(result) {
				if (result == 'deleted') {
					that.parent("div").remove();
				}
			}
		});
	});
	
	/** 파일의 확장자가 존재하는지 검사 */
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i;	// i는 대소문자 구분 없음을 의미
		
		return fileName.match(pattern);
	}
	
	/** uuid로 인해 길어진 파일 이름 줄여주는 기능*/
	function getOriginalName (fileName) {
		if (checkImageType(fileName)) {
			return;
		}
		
		var idx = fileName.indexOf("_")+1;	// 원본 파일 이름만 추출
		
		return fileName.substr(idx);
	}
	
	/** 이미지 파일의 원본 파일 찾기 */
	function getImageLink(fileName) {
		if (!checkImageType(fileName)) {
			return;
		}
		
		var front = fileName.substr(0, 5);	// /asc 경로 추출
		var end = fileName.substring(7); 	// s_ 제거
		
		return front + end;
	}
});
</script>