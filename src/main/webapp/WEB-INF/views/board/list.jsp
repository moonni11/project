<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

<div class="container">
	<div class="row">
	<div class="col-lg-12">
	

		<h1 class="mt-4 mb-3">
      <small>게시판</small>
    </h1>
	</div>
	</div>
<!-- /.row -->
<hr>
<div class="row">
	<div class="col-lg-12">

		<div class="panel panel-default">
			<div class="panel-heading">
					
				

						<ol class="breadcrumb">
				 <sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">							
							<sec:authentication property="principal" var="pinfo" />

				<li><button id='regBtn' type="button" class="btn btn-info">게시글 등록</button></li>
							

					</sec:authorize>	 
						</ol>

					
			</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped  table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>

							<td><a class='move'  style="color:black;" href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" /><b> [<c:out value="${board.replyCnt }"/>]</b>
							</a></td>


							<td><c:out value="${board.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
					</c:forEach>
				</table>
				<a href="/board/list" a class="btn btn-lg btn-secondary btn-block" >게시판 목록</a>
				<br>
				<div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/board/list" method='get'>
							<select name='type'>
							<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
								<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW"
								<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC"
								<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
							</select>
						    <input type='text' name='keyword'
						    value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-info'>검색</button>
						</form>
					</div>
				</div>


				<form id='actionForm' action="/board/list" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
				</form>

				<div class='pull-right'>
					 <ul class="pagination justify-content-center">

						<c:if test="${pageMaker.prev }">
						<li class="page-item">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">&larr; Older</a>
							</li>
							
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage }">
							<li
								class="paginate_button ${pageMaker.cri.pageNum == num ? 'active': ' '} "><a class="page-link"
								href="${num}">${num}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next }">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1}">Newer &rarr;</a></li>
						</c:if>
					</ul>
				</div>
				



				<!-- Modal 추가-->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->


			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
</div>
<!-- /.row -->
</div>

<script type="text/javascript">
	$(document).ready(
			function() {

			var result = '<c:out value="${result}"/>';
			
			checkModal(result);

			history.replaceState({}, null, null);

			function checkModal(result) {

				if (result === '' || history.state) {
					return;
				}

				if (parseInt(result) > 0) {
					$(".modal-body").html( "게시글 " + parseInt(result)
									+ " 번이 등록되었습니다.");
				}

				$("#myModal").modal("show");
			}
			
			// 상단  등록 버튼(Register New Board) 처리
			$("#regBtn").on("click", function() {

				self.location = "/board/register";

			});
			
			$(".move").on("click", function(e){
				
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
				actionForm.attr("action","/board/get");
				actionForm.submit();
			});
			
			var actionForm=$("#actionForm");
			
			$(".paginate_button a").on("click", function(e){
				
				e.preventDefault();
				
				console.log('click');
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			var searchForm = $("#searchForm");
			
			

	});
  </script>

<%@include file="../includes/footer.jsp"%>
