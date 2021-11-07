<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<title>상품 목록조회</title>

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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
      .ct_list_b{
      	color : #6593A6;
      }
    </style>
<script type="text/javascript">

	var menu = $("input[name='menu']").val();

	
	//검색 버튼을 누르면 detailform으로 submit해
	function fncGetUserList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/product/listProduct").submit();
	}
	
	
	//ProdName 상품정보보기
	$(function(){
	
		$(".ct_list_pop td:nth-child(2)").click(function(){
			//alert("안녕")
			self.location="/product/getProduct?prodNo="+$(this).find("input[name=prodNo]").val()+"&menu=${param.menu}";
		});
		
	});
	
	
	
	$(function(){

		$("td.ct_btn01:contains('검색')").click(function(){
			alert("돌아가라")
			fncGetUserList(1);
		});
			
		
		$(".ct_list_pop td:nth-child(6)").click(function(){
		//	self.location="/product/getProduct?prodNo="+$(this).find("input[name=prodNo]").val()+"&menu=${param.menu}";	
		var prodNo = $(this).find("input[name=prodNo]").val();
		//var menu = ${param.menu};
		//alert(prodNo)
		$.ajax(
				
				{
					url : "/product/json/getProduct/"+prodNo , 
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						
						//alert("JSONData : "+JSONData);
						
						var displayValue = "<h3>"
										+ "상품번호 : "+JSONData.prodNo+"</br>"
										+ "상품명 : "+JSONData.prodName+"</br>"
										+ "상품이미지 : "+JSONData.fileName+"</br>"
										+ "상품상세정보 : "+JSONData.prodDetail+"</br>"
										+ "제조일자 : "+JSONData.manuDate+"</br>"
										+ "가격 : "+JSONData.price+"</br>"
										+ "</h3>";	
						
						//alert(displayValue);		
						$("h3").remove();
						$("#"+prodNo+"").html(displayValue);
					}
				});		
		
		});
		
		//$( ".ct_list_pop td:nth-child(3)" ).css("color" , "blue");
		//$("h7").css("color" , "blue");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");

		
	});

	
	
	
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
	<!-- Post 방식 & menu에 대한 value값(search, update)를 받기  -->
	<form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post">
	<input type="hidden" id="menu" name="menu" value="${param.menu}">
	
		<div class="page-header text-info">
	       <h3>상품목록조회</h3>
	    </div>
	
<!-- 
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					 -->
					<c:if test= "${param.menu == 'manage'}">
						<%--<c:set var="title" value="상품관리"/>  --%>
						<div class="page-header text-info">
	      					<h3>상품관리</h3>
	   					</div>
					</c:if>
					
					<c:if test= "${param.menu == 'search'}">
						<%-- <c:set var="title" value="상품목록조회"/>  --%>
						<div class="page-header text-info">
	      					<h3>상품목록조회</h3>
	   					</div>
					</c:if>
					
							${title}
	<!-- 				
					</td>
				</tr>
			</table>  
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table> -->

		
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
		

				<br>
	<table class="table table-hover table-striped" >
      
    <thead>
		<tr class="active">
			<td class="ct_list_b" width="100" align="center"><strong>No</strong></td>
			<td class="ct_list_b" width="500" align="center"><strong>상품명</strong></td>
			<td class="ct_list_b" align="center"><strong>가격</strong></td>
			<td class="ct_list_b" align="center"><strong>등록일</strong></td>	
			<td class="ct_list_b" align="center"><strong>상품정보</strong></td>	
			<td class="ct_list_b" align="center"><strong>현재상태</strong></td>	
		</tr>
	</thead>

	<tbody>
		<c:set var="i" value="0" />
	 		<c:forEach var="product" items="${list}">
	 	<c:set var="i" value="${i+1}"/>
		<tr class="ct_list_pop">
			<td align="center">${i}</td>
			<td align="center" title="Click : 상품수정">${product.prodName}
				<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}">
			</td>
			<td align="center">${product.price}</td>
			<td align="center">${product.manuDate}</td>
			<td align="center">준비중</td>
			<td align="center" title="Click : 상품정보 확인">
				<i class="glyphicon glyphicon-search" id= "${product.prodNo}"></i>
				<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}">
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
