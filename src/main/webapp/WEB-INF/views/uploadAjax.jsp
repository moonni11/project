<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Upload with Ajax</h1>

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
	width: 200px;
}

.uploadResult ul li span {
	color: black;
}
.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255,255,255,0.5);	
}
.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}
.bigPicture img {
	width: 600px;
}

</style>


<div class='uploadDiv'>
	<input type='file' name='uploadFile' multiple>	
</div>

<button id='uploadBtn'>Upload</button>

<div class='uploadResult'>
	<ul>
	
	</ul>
</div>

<script
	src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

	<script>
	/*function showImage(fileCallPath){
		//alert(fileCallPath);	
		
 		$(".bigPictureWrapper").css("display","flex").show();
		
		$(".bigPicture")
		.html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
		.animate({width:'100%', height:'100%'}, 1000);
	} */
	
		$(document).ready(function() {
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
			
			// 업로드버튼			
			$("#uploadBtn").on("click", function(e) {

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
			
			// 첨부파일을 리스트로 출력 + 클릭시 원본 보여주기
				function showUploadedFile(uploadResultArr) {
					
					var str = "";
					
					$(uploadResultArr).each(function(i, obj){
								

									//str += "<li>" + obj.fileName + "</li>";		
									
									var fileCallPath = encodeURIComponent("s_" + obj.fileName);
									
									var originPath = obj.fileName;
									
									originPath = originPath.replace(new RegExp(/\\/g),"/");
									
									str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName="+fileCallPath+"'></a><li>";
												
							});
					
					uploadResult.append(str);
				}
			
			

		});
	</script>


</body>
</html>