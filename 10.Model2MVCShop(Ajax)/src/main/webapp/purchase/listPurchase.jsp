<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	$(function(){

		$("td.ct_btn02").click(function(){
			self.location="/user/getUser?userId=${purchase.buyer.userId}";
		});
	
	
		$(".ct_list_pop td:nth-child(1)").click(function(){
			var tranNo = $(this).find("input[name=tranNo]").val();
			alert(tranNo)
		
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
						
						var displayValue = "<h3>"
										+ "��ǰ��ȣ : "+JSONData.prodNo+"</br>" 
										+ "������ ���̵� : "+JSONData.userId+"</br>" 
										+ "���Ź�� : "+JSONData.paymentOption+"</br>" 
										+ "������ �̸� : "+JSONData.receiverName+"</br>" 
										+ "������ ����ó : "+JSONData.receiverPhone+"</br>" 
										+ "������ �ּ� : "+JSONData.dlvyAddr+"</br>" 
										+ "���ſ�û���� : "+JSONData.dlvyRequest+"</br>" 
										+ "�������� : "+JSONData.dlvyDate+"</br>" 
										+ "�ֹ��� : "+JSONData.orderDate+"</br>" 
										+"<h3>";
						alert(displayValue)
						$("h3").remove();
						$("#"+tranNo+"").html(displayValue);
					}
				});
		
			});
		
			$( ".ct_list_pop td:nth-child(1)" ).css("color" , "blue");
			$("h7").css("color" , "blue");
			
	});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<%-- <td colspan="11">��ü <%=resultPage.getTotalCount()%> �Ǽ�, ���� <%=resultPage.getCurrentPage()%> ������</td> --%>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No<br>
			<h7 >(No click:������)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%--
	int no=list.size();
			for(int i=0; i<list.size(); i++) {
		Purchase purchase = (Purchase)list.get(i);
	--%>
	
	 <c:set var="i" value="0" />
	 	<c:forEach var="purchase" items="${list}">
	 <c:set var="i" value="${i+1}"/>
	
	<tr class="ct_list_pop">
		<td align="center">
			<%-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${i}</a>  --%>
			${i}
			<input type="hidden" id="tranNo" name = "tranNo" value="${purchase.tranNo}">
		</td>
		<td></td>
		<td class="ct_btn02" align="left">
<%-- 			<a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a> --%>
		${purchase.buyer.userId}
		</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.receiverPhone}</td>
		<td></td>
		<td align="left">

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

		<td></td>
		<td align="left">
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<%-- } --%>
	 </c:forEach>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		
		<jsp:include page="../common/pageNavigator.jsp"/>	
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>