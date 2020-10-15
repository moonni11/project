<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>미술관</title>

  <!-- Bootstrap core CSS -->
  <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../resources/css/modern-business.css" rel="stylesheet">

</head>

<body>

    <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="../gallery/list">Aroom Art Gallery</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        
        
         <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCh" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:#fff">
              	지역보기
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
          	<div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type'style="display:none">
							<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								
							</select>
						    <input type='hidden' name='keyword'
						    value='' /> 
						
							<button class='btn btn-default'>All view</button>
							
						</form>
					</div>
				</div>
         <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='서울' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>서울</button>
							
							
						</form>
					</div>
				</div>
          <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='경기' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>경기</button>
							
							
						</form>
					</div>
				</div>
          
              <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='충북' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>충북</button>
							
							
						</form>
					</div>
				</div>
				
				<div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='충남' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>충남</button>
							
							
						</form>
					</div>
				</div>
              <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='대전' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>대전</button>
							
							
						</form>
					</div>
				</div>
         
          
              <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='전북' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>전북</button>
							
							
						</form>
					</div>
				</div>
               <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='전남' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>전남</button>
							
							
						</form>
					</div>
				</div>
          
         
              <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='경상북도' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>경북</button>
							
							
						</form>
					</div>
				</div>
              <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='경상남도' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>경남</button>
							
							
						</form>
					</div>
				</div>
        
     	
            <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/gallery/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='강원' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>강원</button>
							
							
						</form>
					</div>
				</div>
          
         </div>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCh" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:#fff">
              	미술작품보기
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
          	<div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/art/list" method='get'>
							<select name='type'style="display:none">
							<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								
							</select>
						    <input type='hidden' name='keyword'
						    value='' /> 
						
							<button class='btn btn-default'>All view</button>
							
						</form>
					</div>
				</div>
         <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/art/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='드로잉' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>드로잉</button>
							
							
						</form>
					</div>
				</div>
          <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/art/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='오브제' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>오브제</button>
							
							
						</form>
					</div>
				</div>
          
              <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/art/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='판화' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>판화</button>
							
							
						</form>
					</div>
				</div>
				
				<div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/art/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='실크스크린' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>실크스크린</button>
							
							
						</form>
					</div>
				</div>
                        
              <div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/art/list" method='get'>
							<select name='type' style="display:none">
							
								<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
							</select>
						    <input type='hidden' name='keyword'
						    value='사진' /> 
							<input type='hidden'name='pageNum' 
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>사진</button>
							
							
						</form>
					</div>
				</div>
				
				 	 
				
               	</div>
               	
              
          
         
         </li>
         
        
       
            
            <li class="nav-item">
            <a class="nav-link" href="../board/list" style="color:#fff">게시판</a>
         	</li>
     		<li class="nav-item">
     		<sec:authorize access="isAuthenticated()">
     		<li class="nav-item"><a href="/customLogout" class="nav-link" style="color:#fff">로그아웃</a>
     		</li>
     	    </sec:authorize>
     		</li>
     		<li class="nav-item">
     		<sec:authorize access="isAnonymous()">
            <li class="nav-item"><a href="/customLogin" class="nav-link" style="color:#fff">로그인</a>
            </li>
            </sec:authorize>
            </li>
     		
        </ul>
      </div>
    </div>
  </nav>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 