<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" ccontent="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="uploadFormAction" method="post" enctype="multipart/form-data">

<input type='file' name='uploadFile' multiple>
<button>Submit</button>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

</body>
</html>