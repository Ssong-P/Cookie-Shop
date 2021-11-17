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
			
		$("td.ct_btn01:contains('이전')").click( function(){
				history.go(-1);
			});
			
			$("td.ct_btn01:contains('수정')").click(function(){
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

<title>상품수정</title>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header">
		       <h3 class=" text-info">상 품 상 세 조 회</h3>
		       <!-- <h5 class="text-muted">상품 정보를 다시 한번 <strong class="text-danger">확인</strong>해 주세요.</h5>  -->
	    </div>
	    
	    <div class="row">
	  		<div class="col-md-3" ><strong>상 품 번 호</strong></div>
			<div class="col-md-3" >${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>상 품 명</strong></div>
			<div class="col-md-3" >${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>상 품 상 세 정 보</strong></div>
			<div class="col-md-3" >${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>상 품 이 미 지</strong></div>
			<div class="col-md-3" ><img src="/images/uploadFiles/${product.fileName}"></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>제 조 일 자</strong></div>
			<div class="col-md-3" >${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>가격</strong></div>
			<div class="col-md-3" >${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-3" ><strong>등 록 일 자</strong></div>
			<div class="col-md-3" >${product.regDate}</div>
		</div>
		
		<hr/>
	

		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구&nbsp;매</button>
			  <a class="btn btn-primary btn" href="#" role="button">이전</a>
		    </div>
		</div>
	
	</div>

</body>
</html>