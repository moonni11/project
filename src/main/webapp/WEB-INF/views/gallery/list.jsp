<%@ page contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<%@include file="../includes/header2.jsp"%>  
	
	
			
  <!-- Page Content -->
  <div class="container">
	<hr>
   <h2 class="my-4" style="color:#212529">All Of The Art Galleries</h2>
	<hr>
	<ol class="breadcrumb">
       <sec:authentication property="principal" var="pinfo" />
					
		<sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="breadcrumb-item active">
      	<a href="../gallery/register">미술관 등록</a>
      </li>
       </sec:authorize>
    </ol>
    <!-- Marketing Icons Section -->
    <div class="row">
    
  	<c:forEach items="${list}" var="gallery">   
      <div class="col-lg-4 mb-4">
        <div class="card h-100">        
          <h6 class="card-header"><a style="text-decoration:none; color:#212529;" href='/gallery/get?gno=<c:out value="${gallery.gno}"/>'> <c:out value="${gallery.gname}"/></a></h6>            
          <img src="../resources/image/<c:out value='${gallery.image1}'/>" class="card-img-top"> 
        </div>
      </div>
      </c:forEach>
      
    </div>
    <form id='actionForm' action="/gallery/list" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
	</form>
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
    <!-- /.row -->
	<hr>
    <!-- Portfolio Section -->
  
</div>
    <div class="row">
   

    
      
    <!-- /.row -->
	<hr>
    <!-- Features Section -->
    <div class="row">
      <div class="col-lg-6">
        <h1>미술 이야기</h1>
        <h2>세상에서 가장 비싼 미술 작품 TOP 5</h2>
        <ol>
          <li>모나리자(약 2조5600억 추정)</li>
          <li>레오나르도 다빈치 - 살바토르 문디 (약 5300억)</li>
          <li>윌렘 드 쿠닝 - 인터체인지(약 3600억)</li>
          <li>폴세잔 - 카드 놀이 하는 사람들(약 3000억)</li>
          <li>폴 고갱 - 언제 결혼하니?(약 2500억)</li>
        </ol>
        <p></p>
      </div>
      <div class="col-lg-6">
        <img class="img-fluid rounded" src="../resources/image/louvre1.jpg" alt="" 
        onmouseover="this.src='../resources/image/la.jpg'" onmouseout="this.src='../resources/image/louvre1.jpg'" >
      </div>
    </div>
    <!-- /.row -->

    <hr>

    

  </div>
  <!-- /.container -->
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

 
