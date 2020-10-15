<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@include file="../includes/header3.jsp"%>

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
        <img class="img-fluid" src="../resources/image/<c:out value='${art.image}'/>" alt="">
      </div>

      <div class="col-md-4">
        <div class="form-group">
		<label>제목</label><input class="form-control" name='aname'
		value='<c:out value="${art.aname}"/>' readonly="readonly">
		</div>
		<div class="form-group">
		<label>작가</label><input class="form-control" name='artist'
		value='<c:out value="${art.artist}"/>' readonly="readonly">
		</div>
		<div class="form-group">
		<label>소장미술관</label><input class="form-control" name='gname'
		value='<c:out value="${art.gname}"/>' readonly="readonly">
		</div>
		<div class="form-group">
		<label>분류</label><input class="form-control" name='menu'
		value='<c:out value="${art.menu}"/>' readonly="readonly">
		</div>
		<div class="form-group">
	<label>작품내용</label>
	<textarea class="form-control" rows="10" name='content'
	readonly="readonly"><c:out value="${art.content}"/></textarea>
</div>
       
       	<sec:authorize access="hasRole('ROLE_ADMIN')">
        <button data-oper='modify' class="btn btn-secondary" onclick="location.href='/art/modify?ano=<c:out value="${art.ano}"/>'">수정하기</button>
		</sec:authorize>
		<button data-oper='list' class="btn btn-xs pull-right" onclick="location.href='/art/list'">목록보기</button>
      
     <form id='operForm' action="/art/modify" method="get">
				<input type='hidden' id='ano' name='ano' value='<c:out value="${art.ano}"/>'>
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				</form>
      </div>
     
	
    </div>
    </div>
<!-- /.row -->
<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			
			operForm.attr("action", "/art/modify").submit();
			
		});
		
		$("button[data-oper='list']").on("click", function(e){
			
			operForm.find("#ano").remove();
			operForm.attr("action", "/art/list");
			operForm.submit();
			
		});
	});
</script>
<script type="text/javascript">
  function fnImgPop(url){
	  var img=new Image();
	  img.src=url;
	  var img_width=img.width;
	  var win_width=img.width+25;
	  var img_height=img.height;
	  var win=img.height+30;
	  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
	  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
	 }
  function zoomIn(event) {
	  event.target.style.transform ="scale(1.5)";
	  event.target.style.zIndex = 1;
	  event.target.style.transition = "all 0.5s";
  }
  function zoomOut(event) {
	  event.target.style.transform ="scale(1)";
	  event.target.style.zIndex = 0;
	  event.target.style.transition = "all 0.5s";
  }
  
  </script>

