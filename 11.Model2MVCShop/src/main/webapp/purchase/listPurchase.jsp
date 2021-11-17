<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<title>구매 목록조회</title>

<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<style>
	  body {
            padding-top : 50px;
        }
        
      .ct_list_b{
      	color : #6593A6;
      }
    </style>
	
	
<script type="text/javascript">

	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	}	


	$(function(){

		$("td.ct_btn02").click(function(){
			self.location="/user/getUser?userId=${purchase.buyer.userId}";
		});
	
		$(".ct_list_pop td:nth-child(1)").click(function(){
			var tranNo = $(this).find("input[name='tranNo']").val();
			//alert(tranNo)
		
			$.ajax(
				{ 
					url : "/purchase/json/getPurchase/"+tranNo , 
					method : "GET" , 
					dataType : "json", 
					header : {
						"Accept" : "application/json", 
						"Content-Type" : "application/json"
					}, 
					success : function(JSONData , status){
						
						var displayValue = "<h4>"
										+ "구매자 이름 : "+JSONData.receiverName+"</br>" 
										+ "구매방법 : "+JSONData.paymentOption+"</br>" 
										+ "구매자 연락처 : "+JSONData.receiverPhone+"</br>" 
										+ "구매자 주소 : "+JSONData.dlvyAddr+"</br>" 
										+ "구매요청사항 : "+JSONData.dlvyRequest+"</br>" 
										+ "배송희망일 : "+JSONData.dlvyDate+"</br>" 
										+ "주문일 : "+JSONData.orderDate+"</br>" 
										+ "</h4>";
						//alert(displayValue)
						$("h4").remove();
						$("#"+tranNo+"").html(displayValue);
					}
				});
		
			});
		
			$( ".ct_list_pop td:nth-child(1)" ).css("color" , "blue");
			$("h4").css("color" , "blue");
			
	});

</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
		
		<form name="detailForm" action="/purchase/listPurchase" method="post">
		
		<div class="page-header">
			<h3 class="text-info">구매 이력 조회</h3>
			<h5 class="text-muted">배송 정보를 <strong class="text-danger">확인</strong>해 주세요.</h5>
		</div>
		
		<div class="row">

		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <div class="form-inline" name="searchForm">
			     
				 <div class="form-group">
				 	<select class="form-control" name="searchCondition" >
						<option value="0" ${!empty search.searchCondition && searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1" ${!empty search.searchCondition && searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2" ${!empty search.searchCondition && searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				</div>
				
				<div class="form-group" >
				    <label class="sr-only" for="searchKeyword">검색어</label>
					<input type="text" class="form-control" name="searchKeyword"  placeholder="검색어" 
						value="${!empty serach.searchKeyword ? serach.searchKeyword : "" }" >
				</div>
				
				<button type="button" class="btn btn-default">검색</button>
				
				<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				<input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</div>
			</div>

		</div>
		
		</br>

		<table class="table table-hover table-striped" >
		
			<thread>
				<tr class="active">	
					<td class="ct_list_b" width="100" align="center"><strong>No</strong></td>
					<td class="ct_list_b" width="200" align="center"><strong>회원ID</strong></td>
					<td class="ct_list_b" align="center"><strong>회원명</strong></td>
					<td class="ct_list_b" align="center"><strong>전화번호</strong></td>	
					<td class="ct_list_b" align="center"><strong>배송현황</strong></td>	
					<td class="ct_list_b" width="100" align="center"><strong>정보수정</strong></td>
				</tr>
			</thread>
			
			
			<tbody>
				 <c:set var="i" value="0" />
				 	<c:forEach var="purchase" items="${list}">
				 <c:set var="i" value="${i+1}"/>
						
				<tr class="ct_list_pop">
					<td align="center" title="Click : 주문정보 확인">	${i}
						<i id= "${purchase.tranNo}">
							<input type="hidden" id="tranNo" name ="tranNo" value="${purchase.tranNo}">
						</i>
					</td>
					
					<td class="ct_btn02" align="center" title="Click : 회원정보 확인">${purchase.buyer.userId}</td>
					<td align="center">${purchase.receiverName}</td>
					<td align="center">${purchase.receiverPhone}</td>
					<td align="center">
						<c:choose>
							<c:when test="${purchase.tranCode eq '001'}">
								구매완료
							</c:when>
							<c:when test="${purchase.tranCode eq '002'}">
								배송중
								<a href="/purchase/updateTranCodeByProd?prodNo=${purchase.purchaseProd.prodNo}&tranCode=003">상품도착</a>
							</c:when>
							<c:when test="${purchase.tranCode eq '003'}">
								배송 완료
							</c:when>
						</c:choose>
					</td>
					<td align="center" title="Click : 배송정보 수정">
						<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">
						<i class="glyphicon glyphicon-pencil"></i>
						</a>
					</td>
				</tr>
	 				</c:forEach>
				 </tbody>
				</table>
		
	
			<jsp:include page="../common/pageNavigator_new.jsp"/>	
		</form>
		</div>
</body>
</html>