<%@ page contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
			
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">
      <small>작품보기</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a style="color:black;" href="../gallery/list">홈으로</a>
      </li>
      <li class="breadcrumb-item active">
      <a href="../art/list">작품 리스트</a></li>
      <sec:authentication property="principal" var="pinfo" />
					
		<sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="breadcrumb-item active"><a href="../art/register">작품등록하기</a></li>
      </sec:authorize>	
      
      <li style="padding-left: 450px;">
				
						<form id='searchForm' action="/art/list" method='get'>
							<select name='type'>
							<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>작품이름</option>
								<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>작가이름</option>
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>분류</option>
								
							</select>
						    <input type='text' name='keyword'
						    value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-info'>검색</button>
						</form>
					
		</li>		
    </ol>

    <div class="row">
    
    <c:forEach items="${list}" var="art">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
           <img src="../resources/image/<c:out value='${art.image}'/>"  onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"  class="card-img-top"> 
          <div class="card-body">
            <h4 class="card-title">
              <a href='/art/get?ano=<c:out value="${art.ano}"/>'>
               <c:out value="${art.aname}"/></a><br>
            </h4>
            <c:out value="${art.artist}"/><br>  <c:out value="${art.gname}"/><br> <c:out value="${art.menu}"/>
          </div>
        </div>
      </div>
       </c:forEach>
      
    </div>
     <form id='actionForm' action="/art/list" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
				</form>

    <!-- Pagination -->
     <ul class="pagination justify-content-center">
      			 <li class="page-item">
					

						<c:if test="${pageMaker.prev }">
							
							<a class="page-link" href="${pageMaker.startPage -1}" aria-label="Previous">
							 <span aria-hidden="true">&laquo;</span>
          					 <span class="sr-only">Previous</span>
							</a>
							
						</c:if>
					</li>	

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active': ''} ">
							<a class="page-link"  href="${num}">${num}</a>
							</li>
						</c:forEach>
					<li>
						<c:if test="${pageMaker.next }">
							
							<a class="page-link" href="${pageMaker.endPage +1}" aria-label="Next">
								 <span aria-hidden="true">&raquo;</span>
          						 <span class="sr-only">Next</span>
								</a>
								
						</c:if>
					
				</li>
    </ul>

  </div>
  
  
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
  
   <script type="text/javascript">
$(document).ready(
			function() {
  
  var actionForm=$("#actionForm");
			
			$(".paginate_button a").on("click", function(e){
				
				e.preventDefault();
				
				console.log('click');
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
 
 
			});
</script>


<%@include file="../includes/footer.jsp"%> 

 
