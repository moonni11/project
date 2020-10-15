<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@include file="../includes/header3.jsp"%>

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


 <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3"><c:out value="${art.aname}"/>
     
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="../art/list">작품리스트</a>
      </li>
      
    
    </ol>

    <!-- Portfolio Item Row -->
    <div class="row">
   

      <div class="col-md-8">
       
      
        <img class="img-fluid" src="../resources/image/<c:out value='${art.image}'/>"  >
      </div>
      

      <div class="col-md-4">
       <form role="form" action="/art/modify" method="post">
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      
		
		
		<div class="form-group">
		<label>작품번호</label><input class="form-control" name='ano'
		value='<c:out value="${art.ano}"/>' readonly="readonly">
		</div>
         <div class="form-group">
		<label>제목</label><input class="form-control" name='aname'
		value='<c:out value="${art.aname}"/>' >
		</div>
		<div class="form-group">
		<label>작가</label><input class="form-control" name='artist'
		value='<c:out value="${art.artist}"/>' >
		</div>
		<div class="form-group">
		<label>미술관 번호</label><input class="form-control" name='gno'
		value='<c:out value="${art.gno}"/>' >
		</div>
		<div class="form-group">
		<label>소장미술관</label><input class="form-control" name='gname'
		value='<c:out value="${art.gname}"/>' >
		</div>
		<div class="form-group">
		<label>분류</label><input class="form-control" name='menu'
		value='<c:out value="${art.menu}"/>'>
		</div>
		<div class="form-group">
	<label>작품내용</label>
	<textarea class="form-control" rows="10" name='content'>
	<c:out value="${art.content}"/></textarea>
</div>
		<div class="form-group">
		<label>사진</label><input class="form-control" id="image" name='image'
		value='<c:out value="${art.image}"/>'>
		</div>
      	<button type="submit" data-oper='modify' class="btn btn-info">수정</button>
		<button type="submit" data-oper='remove' class="btn btn-info">삭제</button>
		<button type="submit" data-oper='list' class="btn btn-info">리스트</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
		</form>
		
     
     
     <!-- /.row -->
<!-- 첨부파일등록 -->
<br>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">파일 등록</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' onchange="javascript:document.getElementById('image').value=this.value.replace(/c:\\fakepath\\/i,'')" >
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
	
    </div>
     </div>
   

</div>
<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click",function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/art/remove");
		}else if(operation === 'list'){
			formObj.attr("action","/art/list").attr("method","get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		formObj.submit();
	});
});
</script>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/gallery/remove");
			} else if (operation === 'list') {
				formObj.attr("action", "/gallery/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();

				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
				/* self.location = "/board/list";
				return;*/
			}
			formObj.submit();
		});
	});
</script> -->
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

</body>
</html>
