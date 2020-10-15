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
		<h4 class="page-header">Aroom Art Gallery 게시판</h4>
	</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"></div>
				<!-- /.panel-heading -->
				<div class="panel-body">
				<hr>
				<div class="form-group">
				<label>번호</label><input class="form-control" name='bno'
				value='<c:out value="${board.bno}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>제목</label><input class="form-control" name='title'
				value='<c:out value="${board.title}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name='content'
				readonly="readonly"><c:out value="${board.content}"/></textarea>
				</div>
				<div class="form-group">
				<label>작성자</label><input class="form-control" name='writer'
				value='<c:out value="${board.writer}"/>' readonly="readonly"></div>
				
				<sec:authentication property="principal" var="pinfo" />
					
					<sec:authorize access="isAuthenticated()"> 
					
					
					
					<c:if test="${pinfo.username eq board.writer}">
					
					<button data-oper='modify' class="btn btn-info">수정</button>
					
					</c:if>
				</sec:authorize>	
				
				
				<button data-oper='list' class="btn btn-info">리스트</button>
				<hr>
				
				
	            <form id='operForm' action="/board/modify" method="get">
				<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				</form>
				</div>
			</div>
			
		</div>
	</div>
<!-- 댓글목록 div ---------------------------------------------  -->
			


<div class="jumbotron">


<div class='row'>
	<div class="col-lg-12">
		<!-- /.panel -->
		<div class="panel panel-default">
		<!--텍스트위치 지정 -->
			<!-- <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div>  -->
				<i class="fa fa-comments fa-fw"></i> 댓글
			<div class="panel-heading">
				<sec:authorize access="isAuthenticated()">
				<div style="text-align: -webkit-right;">
				<button id='addReplyBtn' class='btn btn-primary'>댓글 작성</button>
				
				</div>
				</sec:authorize>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<ul class="chat">
				
					<!-- Start reply -->
					<li class="left clearfix" data-ron='12'>
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong> <small
									class="pull-right text-muted">2018-01-01 13:13</small>
							</div>
							<p>Good job!</p>
						</div>
					</li>
					<!-- End reply -->
				</ul>
				<!-- ./ end ul -->
			</div>
			<!-- /.panel .chat-panel -->
			<div class="panel-footer"></div>
			
		</div>
	</div>
	<!-- ./ end row -->
</div>
</div>

</div>
<!-- Modal 창 -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer' readonly="readonly" >
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>
	<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->	

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function(){
		var bnoValue = '<c:out value = "${board.bno}"/>';
		var replyUL = $(".chat");
		
		showList(1);
		
		function showList(page){
			
			console.log("show list " + page);
			
			replyService.getList({bno:bnoValue, page: page||1}, function(replyCnt, list){
				console.log("replyCnt: " + replyCnt);
				console.log("list: " + list);
				console.log(list);
				
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				if(list == null || list.length == 0){
					return;
				}
				
				for(var i = 0, len = list.length || 0; i < len; i++){
					str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					//str += "	<div><div class='header'><strong class='primary-font'>" + list[i].replyer+"</strong>";
					str += "	<div><div class='header'><strong class='primary-font'>[" + list[i].rno + "] " + list[i].replyer+"</strong>";
					str += "	<samll class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
					str += "	<p>" + list[i].reply + "</p></div></li>";
				}
				replyUL.html(str);
				
				showReplyPage(replyCnt);
			});//end function
		}//end showList
		
		/* 모달창 버튼 처리 */
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		var replyer = null;
		
		<sec:authorize access="isAuthenticated()">
		
		replyer='<sec:authentication property="principal.username"/>';
		
		</sec:authorize>
		
			var csrfHeaderName ="${_csrf.headerName}";
			var csrfTokenValue="${_csrf.token}";
			
		$("#modalCloseBtn").on("click",function(e){
			
			modal.modal('hide');
		});	
		
		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			modal.find("input[name='replyer']").val(replyer);
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		//Ajax spring security header......
		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		});
		
		modalRegisterBtn.on("click", function(e){
			var reply = {
					reply: modalInputReply.val(),
					replyer: modalInputReplyer.val(),
					bno: bnoValue
			};
			replyService.add(reply, function(result){
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
				//showList(1);
				showList(-1);
			});
		});
		//댓글조회 이벤트
		
		$(".chat").on("click", "li", function(e){
			var rno = $(this).data("rno");
			
			console.log(rno); 
			replyService.get(rno, function(reply){
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly");
				modal.data("rno", reply.rno);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
			});
		});
		
		/* 댓긇 수정 */
		modalModBtn.on("click", function(e){
			
			var originalReplyer = modalInputReplyer.val();
			
			var reply = {rno: modal.data("rno"), reply: modalInputReply.val(),replyer: originalReplyer};
			
			
			
			if (!replyer) {
				alert("로그인후 수정이 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			console.log("Original Replyer: "+originalReplyer);
			
			if (replyer != originalReplyer) {
				
				alert("자신이 작성한 댓글만 수정이 가능합니다.");
				modal.modal("hide");
				return;
			}
			replyService.update(reply, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			}); 
		});
	
		
		/* 댓긇 삭제 */
		modalRemoveBtn.on("click", function(e){
			var rno = modal.data("rno");
			
			console.log("RNO: "+rno);
			console.log("REPLYER: "+replyer)
			/* 
			replyService.remove(rno, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum); */
			
	 	if (!replyer) {
				alert("로그인후 삭제가 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			var originalReplyer = modalInputReplyer.val();
			
			console.log("Original Replyer: "+originalReplyer);//댓글의 원래 작성자
			
			if(replyer != originalReplyer){
				
				alert("자신이 작성한 댓글만 삭제가 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			replyService.remove(rno,originalReplyer, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			}); 
	});
	
		
		/* 댓글 페이지 번호 출력 */
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			
			if(endNum * 10 < replyCnt){
				next = true;
			}
			
			var str = "<ul class = 'pagination pull-right'>";
			
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
			}
			
			for(var i = startNum; i <= endNum; i++){
				var active = pageNum == i? "active":"";
				
				str += "<li class='page-item "+ active +" '> <a class = 'page-link' href = '"+ i +"'>" + i + "</a></li>";
			}
			if(next){
				str += "<li class='page-item'><a class = 'page-link' href = '"+(endNum + 1)+"'>NEXT</a></li>";
			}
			
			str += "</ul></div>";
			
			console.log(str);
			
			replyPageFooter.html(str);
		}
		
		/* 페이지 번호를 클릭했을 때 새로운 댓글처리*/
		replyPageFooter.on("click", "li a", function(e){
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum: " + targetPageNum);
			
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
	
	});
	
		
</script>


	<script type="text/javascript">
	$(document).ready(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/board/modify").submit();
		});
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list")
			operForm.submit();
		});
		});
	</script>
	
</body>
</html>

<%@include file="../includes/footer.jsp"%>