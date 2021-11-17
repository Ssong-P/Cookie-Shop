<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import = "com.model2.mvc.service.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="EUC-KR">
	
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

		$(function() {
			
			$("a[href='#']").click( function(){
				history.go(-1);
			});

		});
		
		
		$(function() {
			$("button.btn.btn-primary").click(function(){
				alert("�ȳ���!")
				self.location="/purchase/updatePurchase?tranNo=${purchase.tranNo}";
			});
		});


</script>


<title>���Ż���ȸ</title>

</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header">
		       <h3 class=" text-info">�� �� �� �� �� ȸ</h3>
		       <h5 class="text-muted">���� ������ <strong class="text-danger">Ȯ��</strong>�� �ּ���.</h5>
	    </div>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�� ǰ �� ȣ</strong></div>
			<div class="col-md-3" >${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>���Ź��</strong></div>
			<div class="col-md-3" >
				<c:if test="${purchase.paymentOption == '1  '}">
					���ݱ���
				</c:if>
				<c:if test="${purchase.paymentOption == '2  '}">
					�ſ뱸��
				</c:if>
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�������̸�</strong></div>
			<div class="col-md-3" >${purchase.receiverName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�����ڿ���ó</strong></div>
			<div class="col-md-3" >${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�������ּ�</strong></div>
			<div class="col-md-3" >${purchase.dlvyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>���ſ�û����</strong></div>
			<div class="col-md-3" >${purchase.dlvyRequest}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>��������</strong></div>
			<div class="col-md-3" >${purchase.dlvyDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�ֹ���</strong></div>
			<div class="col-md-3" >${purchase.orderDate}</div>
		</div>
		
		<hr/>

		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">Ȯ��</a>
		    </div>
		</div>

	</div>
</body>
</html>