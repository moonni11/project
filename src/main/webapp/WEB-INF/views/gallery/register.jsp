<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<style>

.uploadResult {

	width:100%;
	background-color: white;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 150px;
}

.uploadResult ul li span {
	color: black;
}

</style>

<div class="container">

<div class="row">
	<div class="col-lg-12">
	<hr>
		<h3 class="page-header">○ 미술관 등록하기</h3>
	</div>
</div>
<hr>
<div class="row">
	<div class="col-lg-12">
		
		<div class="panel-body">
			<form role="form" action="/gallery/register" method="post">
				<div class="form-group">
					<label>미술관 이름</label> <input class="form-control" name="gname">
				</div>
				<div class="form-group">
					<label>전화번호</label> <input class="form-control" name="tel">
				</div>
				<div class="form-group">
					<label>주소</label> <input class="form-control" name="address">
				</div>
				<div class="form-group">
					<label>지도</label> <input class="form-control" name="mapurl">
				</div>
				<div class="form-group">
					<label>입관료</label> <input class="form-control" name="pay">
				</div>
				<div class="form-group">
					<label>이용시간</label> <input class="form-control" name="hours">
				</div>
				<div class="form-group">
					<label>주차 여부</label> <input class="form-control" name="route">
				</div>
				<div class="form-group">
					<label>홈페이지 / SNS</label> <input class="form-control" name="sns">
				</div>
				<div class="form-group">
					<label>전경</label> <input class="form-control" id="image" name="image1">
				</div>
			
			<!-- 첨부파일등록 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">
			<h4>○ 파일 등록</h4></div>
			<hr>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' onchange="javascript:document.getElementById('image').value=this.value.replace(/c:\\fakepath\\/i,'')"  >
				</div>
					
				<div class='uploadResult'>
					<ul>

					</ul>
				</div>

			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

				<button type="submit" class="btn btn-info">등록</button>
				<button type="reset" class="btn btn-info">초기화</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>	
</div>
<hr>
<!-- /.row -->

</div>
<%@include file="../includes/footer.jsp"%>

<script>
	
		$(document).ready(function() {
			//Submit Button 클릭했을때 기본 동작 막기
			var formObj = $("form[role='form']");
			
			$("button[type='submit']").on("click", function(e){
				
				e.preventDefault();
				
				console.log("submit clicked");
				
				//Submit Button 클릭시 게시물 전송되게
				var str ="";
				
				$(".uploadResult ul li").each(function(i, obj){
					
					var jobj = $(obj);
					
					console.dir(jobj);
					
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";	
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";	
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";	
					
				});
				
				formObj.append(str).submit();
				
			});			
			
			//파일 확장자나 크기의 사전 처리
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; //5MB
			
			function checkExtension(fileName, fileSize) {
				
				if(fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}	//파일 확장자나 크기의 사전 처리 end
			
			// 업로드버튼 안눌러도되게			
			$("input[type='file']").change(function(e) {

				var formData = new FormData();

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;		
								
				//21.3.1 jQuery를 이용한 첨부파일 전송
				//add filedate to formdata
				for(var i=0; i<files.length; i++){
					
					if(!checkExtension(files[i].name, files[i].size) ) {
						return false;
					}					
					formData.append("uploadFile", files[i]);					
				}			
				
				
				$.ajax({
					url: '/uploadAjaxAction',
						processData: false,
						contentType: false,
						data: formData,
						type: 'POST',
						 beforeSend: function(xhr) {
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
							},
						dataType: 'json',
						success: function(result) {		
							
							console.log(result);
							
							showUploadedFile(result); //업로드 결과 처리 함수
							
							$(".uploadDiv").html(cloneObj.html());
						
						}
				}); //$.ajax
			});
			
			var cloneObj = $(".uploadDiv").clone();
			
			var uploadResult = $(".uploadResult ul");
			
			// 첨부파일을 리스트로 출력
			function showUploadedFile(uploadResultArr) {
				
				var str = "";
				
				$(uploadResultArr).each(function(i, obj){
							

								//str += "<li>" + obj.fileName + "</li>";		
								
								var fileCallPath = encodeURIComponent("s_" + obj.fileName);
								
								//var originPath = obj.fileName;
								
								//originPath = originPath.replace(new RegExp(/\\/g),"/");
								
								str += "<li data-path='"+obj.uploadPath+"'";
								str += "data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
								str += " ><div>";
								str += "<span> " + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\' "
								str += "data-type='image' class='btn btn-warning btn-sm btn-circle'>X<i class='fa fa-times'></i></button><br>";
								str += "<img src='/display?fileName="+fileCallPath+"'>";
								str += "</div>";
								str += "</li>";						
											
						});
				
				uploadResult.append(str);
				
				// 업로드 파일 X 아이콘
				$(".uploadResult").on("click", "button", function(e){
					
					console.log("delete file");
					
					var targetFile = $(this).data("file");
					var type = $(this).data("type");
					
					var targetLi = $(this).closest("li");
					
					$.ajax({
						url: '/deleteFile',
						data: {fileName: targetFile, type:type},
						dataType: 'text',
						type: 'POST',
						 beforeSend: function(xhr) {
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
							},
						success: function(result){
							alert(result);
							targetLi.remove();
						}						
					}); //$.ajax
					
				});
			}
						
			
			

});
	</script>
