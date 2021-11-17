<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>

	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>
 		body {
            padding-top : 50px;
        }
        
        div h3, div h5 {
        	text-align: center;
        }
        
        .col-md-2 {
        	color : #6593A6;
        }
 
     </style>
<script type="text/javascript">

</script>

</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchaseView?tranNo=0" method="post">


	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">구 매 등 록 확 인</h3>
	       <h5 class="text-muted">구매 정보를 다시 한번 <strong class="text-danger">확인</strong>해 주세요.</h5>
	    </div>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>상 품 번 호</strong></div>
			<div class="col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>구매자 아이디</strong></div>
			<div class="col-md-4">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>구 매 방 법</strong></div>
			<div class="col-md-4">
				<c:if test="${purchase.paymentOption eq '1'}">
					현금구매
				</c:if>
				
				<c:if test="${purchase.paymentOption eq '2' }">
					신용구매
			</c:if>
			</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>구매자 이름</strong></div>
			<div class="col-md-4">${purchase.receiverName}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>구매자 연락처</strong></div>
			<div class="col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>구매자 주소</strong></div>
			<div class="col-md-4">${purchase.dlvyAddr}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>구매 요청 사항</strong></div>
			<div class="col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>배송 희망 일자</strong></div>
			<div class="col-md-4">${purchase.dlvyDate}</div>
		</div>
		
		<hr/>
	
</div>
</form>
</body>
</html>