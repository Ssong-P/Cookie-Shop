<%@page import="com.model2.mvc.service.domain.*"%>
<%@ page contentType="text/html; charset=euc-kr" %>
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

<title>��ǰ���</title>

	<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css">  -->

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script type="text/javascript">

	
	$(function(){
		$("button.btn.btn-primary").click(function(){
			self.location="/product/listProduct?menu=manage"
		});
	});
	
	
	$(function() {
		 $( "a[href='#']" ).click( function() {
			 self.location="../product/addProductView.jsp;"
		});
	});	


</script>

</head>

<body>

		<jsp:include page="/layout/toolbar.jsp" />


	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">�� ǰ �� �� Ȯ ��</h3>
	       <h5 class="text-muted">��ǰ ������ �ٽ� �ѹ� <strong class="text-danger">Ȯ��</strong>�� �ּ���.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-md-2"><strong>�� ǰ ��</strong></div>
			<div class="col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ �� �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName}"></div>
		</div>
		

		<hr/>
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >Ȯ&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�߰����</a>
		    </div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->



</body>
</html>
