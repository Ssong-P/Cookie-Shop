<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
<head>
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	<!-- DatePicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
 	<!-- <link rel="stylesheet" href="/resources/demos/style.css">  -->
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  
	<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>  -->
	<!-- <script type="text/javascript" src="../javascript/calendar.js"></script>  -->
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        
        div h3, div h5 {text-align: center;}
        
        label {
        	color : #6593A6;
        }
        
     </style>
<script type="text/javascript">
	
	function fncUpdatePurchase(){
		$("form").attr("method","POST").attr("action","/purchase/updatePurchase?tranNo=${purchase.tranNo}").submit();
	}
	
	$(function(){

		$("button.btn.btn-primary").click(function(){
			fncUpdatePurchase();
		});
	
	});
	
	$(function(){
		
		$("a[href='#']").click(function(){
			history.go(-1);
		});

	});
		
		$( function() {
		    $( "#dlvyDate" ).datepicker({
		      showOn: "button",
		      showOn: "button",
		      buttonImage: "/images/calendar.gif",
		      buttonImageOnly: true,
		      buttonText: "Select date", 
		      dateFormat : 'yy-mm-dd', 
		      
		      showButtonPanel: true,
		      closeText : "닫기",
	          prevText : "이전달",
	          nextText : "다음달",
	          currentText : "오늘",
	          changeMonth: true, // 월을 바꿀 수 있는 셀렉트 박스
	          changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스
	          monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	          monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	          dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
	          dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
	          dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
	          weekHeader : "주",
	    });
		
	});

</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

<%-- <form name="updatePurchase" method="post"	action="/purchase/updatePurchase?tranNo=${purchase.tranNo}">
 --%>
 
 	<form name="detailForm" method="post">
 	<input type="hidden" name="tranNo" value="${purchase.tranNo}"/>
 
	<div class="container">

	<div class="page-header" >
	       <h3 class="text-info">구 매 정 보 수 정</h3>
	       <h5 class="text-muted">구매 정보를 <strong class="text-danger">수정</strong>해 주세요.</h5>
	</div>
	
	<div class="form-horizontal">

		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="prodName" name="prodName" value="${purchase.buyer.userId}">
		    </div>
		</div>
				
		<hr/>

		<div class="form-group">
			<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
			<div class="col-sm-4">
				<select 	name="paymentOption" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20">
					<option value="1" ${purchase.paymentOption eq '1'? "selected":"" }>현금구매</option>
					<option value="2" ${purchase.paymentOption eq '2'? "selected":"" }>신용구매</option>
				</select>
			</div>
		</div>
				
		<hr/>

		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}">
		    </div>
		</div>
				
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">연락처</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
		    </div>
		</div>
				
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${purchase.dlvyAddr}">
		    </div>
		</div>
				
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">요청사항</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" value="${purchase.dlvyRequest}">
		    </div>
		</div>
				
		<hr/>

		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="dlvyDate" name="dlvyDate" >
		    </div>
		</div>
				
		<hr/>
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수&nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		</div>
		
	</div>
	</div>
	
</form>
</body>
</html>