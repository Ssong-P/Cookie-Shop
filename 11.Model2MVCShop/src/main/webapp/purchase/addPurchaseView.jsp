<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">


<title>상품 구매</title>
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
	
	
	<style>
 		body {
            padding-top : 50px;
        }
        
        div h3, div h5 {text-align: center;}
        
        label {
        	color : #6593A6;
        }
        
        img{
		    height:300;
		    width:300;
		}
        
     </style>
     
<script type="text/javascript">

	function fncAddPurchase() {
		$("form").attr("method","POST").attr("action","/purchase/addPurchase").submit();
	}

	$(function(){
		$("button.btn.btn-primary").click(function(){
			alert("구매하시겠습니까?");
			fncAddPurchase();
		});

		$("a[href='#']").click(function(){
			alert("취소하시겠습니까?")
			history.go(-1);
		});
	});

</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">

	<form name="detailForm" method="post">
	<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo}" />

	<div class="page-header" >
	       <h3 class="text-info">구 매 정 보 입 력</h3>
	       <h5 class="text-muted">구매정보를 <strong class="text-danger">입력</strong>해 주세요.</h5>
	</div>
	
	</br>
		

		<div class="form-horizontal">
		
		<div class="row">
			<label for="userName" class="col-sm-offset-1 col-sm-3 control-label"></label>
			 <div class="col-sm-4"><img src="/images/uploadFiles/${product.fileName}"></div>

		</div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">제 조 일 자</label>
		    <div class="col-sm-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">가 격</label>
		    <div class="col-sm-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">등 록 일 자</label>
		    <div class="col-sm-4">${product.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
						<input type="text" class="form-control" id="buyerId" name="buyerId"
							value="${user.userId}">
					</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		    	<select name="paymentOption" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">		
					<option value="1" selected="selected">현금구매</option>
					<option value="2">신용구매</option>
				</select>
		    </div>
		</div>
		
		<hr/>

		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}">
		    </div>
		</div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
		    </div>
		</div>		
		
		<hr/>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${purchase.dlvyAddr}">
		    </div>
		</div>	
		
		<hr/>
			
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매 요청사항</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" value="${purchase.dlvyRequest}">
		    </div>
		</div>	
		
		<hr/>
			
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">배송 희망 일자</label>
		    <div class="col-sm-4">
			    <input type="text" class="form-control" id="dlvyDate" name="dlvyDate" value="${purchase.dlvyDate}">
		    </div>
		</div>
	
	
	</div>
	
	 	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구&nbsp;매</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		</div>
<!-- 
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="center">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="javascript:fncAddPurchase();">구매</a>
						구매
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="javascript:history.go(-1)">취소</a>
						취소
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table> -->
	</form>
	</div>
</body>
</html>