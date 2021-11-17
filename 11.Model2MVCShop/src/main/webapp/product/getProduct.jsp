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
     
	<script type="text/javascript">
	/* 	
		$(function() {
			
		$("td.ct_btn01:contains('����')").click( function(){
				history.go(-1);
			});
			
			$("td.ct_btn01:contains('����')").click(function(){
				self.location="/purchase/addPurchase?prod_no=${product.prodNo}"
			});
		}); */
		
		$(function(){
			//alert("hell...")
			$("button.btn.btn-primary").click(function(){
				alert(${product.prodNo})
				self.location="/purchase/addPurchase?prodNo=${product.prodNo}";
			});
		});
		
		
		$(function() {
			 $( "a[href='#']" ).click( function() {
				 history.go(-1);
			});
		});	


	</script>

<title>��ǰ����</title>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header">
		       <h3 class=" text-info">�� ǰ �� �� �� ȸ</h3>
		       <!-- <h5 class="text-muted">��ǰ ������ �ٽ� �ѹ� <strong class="text-danger">Ȯ��</strong>�� �ּ���.</h5>  -->
	    </div>
	    
	    <div class="row">
	  		<div class="col-md-3" ><strong>�� ǰ �� ȣ</strong></div>
			<div class="col-md-3" >${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�� ǰ ��</strong></div>
			<div class="col-md-3" >${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�� ǰ �� �� �� ��</strong></div>
			<div class="col-md-3" >${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�� ǰ �� �� ��</strong></div>
			<div class="col-md-3" ><img src="/images/uploadFiles/${product.fileName}"></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�� �� �� ��</strong></div>
			<div class="col-md-3" >${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>����</strong></div>
			<div class="col-md-3" >${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>�� �� �� ��</strong></div>
			<div class="col-md-3" >${product.regDate}</div>
		</div>
		
		<hr/>
	

		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">����</a>
		    </div>
		</div>
	
	</div>

</body>
</html>