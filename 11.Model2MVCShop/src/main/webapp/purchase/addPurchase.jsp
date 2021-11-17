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
	       <h3 class=" text-info">�� �� �� �� Ȯ ��</h3>
	       <h5 class="text-muted">���� ������ �ٽ� �ѹ� <strong class="text-danger">Ȯ��</strong>�� �ּ���.</h5>
	    </div>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>�� ǰ �� ȣ</strong></div>
			<div class="col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>������ ���̵�</strong></div>
			<div class="col-md-4">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>�� �� �� ��</strong></div>
			<div class="col-md-4">
				<c:if test="${purchase.paymentOption eq '1'}">
					���ݱ���
				</c:if>
				
				<c:if test="${purchase.paymentOption eq '2' }">
					�ſ뱸��
			</c:if>
			</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>������ �̸�</strong></div>
			<div class="col-md-4">${purchase.receiverName}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>������ ����ó</strong></div>
			<div class="col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>������ �ּ�</strong></div>
			<div class="col-md-4">${purchase.dlvyAddr}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>���� ��û ����</strong></div>
			<div class="col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-md-2"><strong>��� ��� ����</strong></div>
			<div class="col-md-4">${purchase.dlvyDate}</div>
		</div>
		
		<hr/>
	
</div>
</form>
</body>
</html>