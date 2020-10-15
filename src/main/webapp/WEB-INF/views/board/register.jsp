<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp"%>    

<div class="container">
	<hr>
	<div class="row">
	<div class="col-lg-12">

		<h4 class="page-header">○ 게시글 등록하기</h4>
	</div>
	</div>
	<hr>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				
				<!-- /.panel-heading -->
				<div class="panel-body">
				
				<form role="form" action="/board/register" method="post">
				<div class="form-group">
				<label>제목</label><input class="form-control" name='title'>
				</div>
				
				<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name='content'></textarea>
				</div>
				<div class="form-group">
				<label>작성자</label><input class="form-control" name='writer'
				value='<sec:authentication property="principal.username"/>' readonly="readonly">
				</div>
				<hr>
				
				<button type="submit" class="btn btn-info">등록하기</button>
				<button type="reset" class="btn btn-info">취소하기</button>
				<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
				</form>
				<br>
				<a href="/board/list" a class="btn btn-lg btn-secondary btn-block" >게시판 목록</a>
				</div>
				<div style="background-color=white; height:260px;"></div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
	</div>
</div>	
	<!-- /.row -->


<%@ include file="../includes/footer.jsp"%>