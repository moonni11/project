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
        
        
        
         
        
       
            
            <li class="nav-item">
            <a class="nav-link" href="../board/list" style="color:#fff">게시판</a>
          </li>
     		<li class="nav-item">
     		<sec:authorize access="isAuthenticated()">
     		<li class="nav-item"><a href="/customLogout" class="nav-link" style="color:#fff"> 로그아웃</a>
     		</li>
     	    </sec:authorize>
     		</li>
     		<li class="nav-item">
     		<sec:authorize access="isAnonymous()">
           <li class="nav-item"><a href="/customLogin" class="nav-link" style="color:#fff"> 로그인</a>
            </li>
            </sec:authorize>
            </li>
     		
        </ul>
      </div>
    </div>
  </nav>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 