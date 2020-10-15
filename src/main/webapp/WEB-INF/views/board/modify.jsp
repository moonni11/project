<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header3.jsp"%>    

<div class="container">
	<div class="row">
	<div class="col-lg-12">
	<hr>
		<h3 class="page-header">○ 게시물 수정 페이지</h3>
	</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">			
				<!-- /.panel-heading -->
				<div class="panel-body">
				<form role="form" action="/board/modify" method="post">
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
				
				
				<hr>
				<div class="form-group">
				<label>게시물 번호</label><input class="form-control" name='bno'
				value='<c:out value="${board.bno}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>제목</label><input class="form-control" name='title'
				value='<c:out value="${board.title}"/>' >
				</div>
				
				<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name='content'>
				<c:out value="${board.content}"/></textarea>
				</div>
				
				<div class="form-group">
				<label>작성자</label><input class="form-control" name='writer'
				value='<c:out value="${board.writer}"/>' readonly="readonly"></div>
				
			    <div class="form-group">
				<label>등록일자</label>
				<input class="form-control" name='regDate'
				value='<fmt:formatDate pattern="yyyy/MM/dd"  value="${board.regdate}"/>' readonly="readonly">
				</div>
				
				<sec:authentication property="principal" var="pinfo" />
					
					<sec:authorize access="isAuthenticated()">
					
					<c:if test="${pinfo.username eq board.writer}">
			
				<button type="submit" data-oper='modify' class="btn btn-info">수정</button>
				<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
				
				</c:if>
				</sec:authorize>	
				
				<button type="submit" data-oper='list' class="btn btn-info">리스트</button>
				<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
				</form>				
				</div>
				<div style="background-color=white; height:170px;"></div>
			</div>
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
			formObj.attr("action", "/board/remove");
		}else if(operation === 'list'){
			formObj.attr("action","/board/list").attr("method","get");
			
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

<%@ include file="../includes/footer.jsp"%>	
</body>
</html>