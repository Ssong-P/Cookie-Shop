<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<title>���� �����ȸ</title>

<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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
										+ "������ �̸� : "+JSONData.receiverName+"</br>" 
										+ "���Ź�� : "+JSONData.paymentOption+"</br>" 
										+ "������ ����ó : "+JSONData.receiverPhone+"</br>" 
										+ "������ �ּ� : "+JSONData.dlvyAddr+"</br>" 
										+ "���ſ�û���� : "+JSONData.dlvyRequest+"</br>" 
										+ "�������� : "+JSONData.dlvyDate+"</br>" 
										+ "�ֹ��� : "+JSONData.orderDate+"</br>" 
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
			<h3 class="text-info">���� �̷� ��ȸ</h3>
			<h5 class="text-muted">��� ������ <strong class="text-danger">Ȯ��</strong>�� �ּ���.</h5>
		</div>
		
		<div class="row">

		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <div class="form-inline" name="searchForm">
			     
				 <div class="form-group">
				 	<select class="form-control" name="searchCondition" >
						<option value="0" ${!empty search.searchCondition && searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1" ${!empty search.searchCondition && searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2" ${!empty search.searchCondition && searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
				</div>
				
				<div class="form-group" >
				    <label class="sr-only" for="searchKeyword">�˻���</label>
					<input type="text" class="form-control" name="searchKeyword"  placeholder="�˻���" 
						value="${!empty serach.searchKeyword ? serach.searchKeyword : "" }" >
				</div>
				
				<button type="button" class="btn btn-default">�˻�</button>
				
				<!-- PageNavigation ���� ������ ���� ������ �κ� -->
				<input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</div>
			</div>

		</div>
		
		</br>

		<table class="table table-hover table-striped" >
		
			<thread>
				<tr class="active">	
					<td class="ct_list_b" width="100" align="center"><strong>No</strong></td>
					<td class="ct_list_b" width="200" align="center"><strong>ȸ��ID</strong></td>
					<td class="ct_list_b" align="center"><strong>ȸ����</strong></td>
					<td class="ct_list_b" align="center"><strong>��ȭ��ȣ</strong></td>	
					<td class="ct_list_b" align="center"><strong>�����Ȳ</strong></td>	
					<td class="ct_list_b" width="100" align="center"><strong>��������</strong></td>
				</tr>
			</thread>
			
			
			<tbody>
				 <c:set var="i" value="0" />
				 	<c:forEach var="purchase" items="${list}">
				 <c:set var="i" value="${i+1}"/>
						
				<tr class="ct_list_pop">
					<td align="center" title="Click : �ֹ����� Ȯ��">	${i}
						<i id= "${purchase.tranNo}">
							<input type="hidden" id="tranNo" name ="tranNo" value="${purchase.tranNo}">
						</i>
					</td>
					
					<td class="ct_btn02" align="center" title="Click : ȸ������ Ȯ��">${purchase.buyer.userId}</td>
					<td align="center">${purchase.receiverName}</td>
					<td align="center">${purchase.receiverPhone}</td>
					<td align="center">
						<c:choose>
							<c:when test="${purchase.tranCode eq '001'}">
								���ſϷ�
							</c:when>
							<c:when test="${purchase.tranCode eq '002'}">
								�����
								<a href="/purchase/updateTranCodeByProd?prodNo=${purchase.purchaseProd.prodNo}&tranCode=003">��ǰ����</a>
							</c:when>
							<c:when test="${purchase.tranCode eq '003'}">
								��� �Ϸ�
							</c:when>
						</c:choose>
					</td>
					<td align="center" title="Click : ������� ����">
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