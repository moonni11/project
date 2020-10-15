<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@include file="../includes/header3.jsp"%>


  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3"> <c:out value="${gallery.gname}"/></h1>
	<hr>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="list" style="color:black;">홈으로</a>
      </li>
       <sec:authentication property="principal" var="pinfo" />
					
		<sec:authorize access="hasRole('ROLE_ADMIN')">
     <li class="breadcrumb-item">
      	<a style="color:black;"href="modify?gno=<c:out value='${gallery.gno}'/>">수정/삭제</a>
      </li>
       </sec:authorize>
    </ol>

    <!-- Intro Content -->
    <div class="row">
      <div class="col-lg-6">
        <img class="img-fluid rounded mb-4" src="../resources/image/<c:out value='${gallery.image1}'/>" width="550" alt="">
      </div>
      <div class="col-lg-6" style="font-family:Monospace;">
        <p>이름: <c:out value="${gallery.gname}"/></p>
        <p>전화번호: <c:out value="${gallery.tel}"/></p>
        <p>주소: <c:out value="${gallery.address}"/></p>
        <p>입관료: <c:out value="${gallery.pay}"/></p>
        <p>이용시간: <c:out value="${gallery.hours}"/></p>
        <p>주차: <c:out value="${gallery.route}"/></p>
        <p><button onclick="window.open('<c:out value="${gallery.mapurl}"/>')" class="btn btn-secondary">지도</button>
        <button onclick="window.open('<c:out value="${gallery.sns}"/>')" class="btn btn-secondary">홈페이지</button></p>
      </div>
    </div>
    <!-- /.row -->
	<hr>
    <!-- Team Members -->
    <h2>A Work Of Art</h2>

     <div class="row">
      <c:forEach items="${list2}" var="art">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
           <img src="../resources/image/<c:out value='${art.image}'/>" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"   class="card-img-top"> 
          <div class="card-body">
            <h4 class="card-title">
               <c:out value="${art.aname}"/><br>
            </h4>
            <c:out value="${art.artist}"/><br>  <c:out value="${art.gname}"/>
          </div>
        </div>
      </div>
       </c:forEach>
    

    <!-- /.row -->
    <!-- Our Customers -->
    <!-- /.row -->

  </div>
  <!-- /.container -->
</div>
</body>

</html>

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
  
 

<%@include file="../includes/footer.jsp"%>



