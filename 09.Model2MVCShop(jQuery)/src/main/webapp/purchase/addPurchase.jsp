<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>


<html>
<head>
<title>Insert title here</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">


	


</script>

</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchaseView?tranNo=0" method="post">

다음과 같이 구매가 되었습니다.

<table border=1>
	<tr>
		<td>물품번호</td>
		<%-- <td><%= purchase.getPurchaseProd().getProdNo() %></td> --%>
		<td>${purchase.purchaseProd.prodNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자아이디</td>
		<%-- <td><%= purchase.getBuyer().getUserId() %></td> --%>
		<td>${purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매방법</td>
		<td>
			<%-- <% if(purchase.getPaymentOption().equals("1")) { %>
				현금구매
			<% } else { %>
				신용구매
			<% } %> --%>
			<c:if test="${purchase.paymentOption eq '1'}">
				현금구매
			</c:if>
			
			<c:if test="${purchase.paymentOption eq '2' }">
				신용구매
			</c:if>
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자이름</td>
		<%-- <td><%= purchase.getReceiverName() %></td> --%>
		<td>${purchase.receiverName}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자연락처</td>
		<%-- <td><%= purchase.getReceiverPhone() %></td> --%>
		<td>${purchase.receiverPhone}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자주소</td>
		<%-- <td><%= purchase.getDlvyAddr() %></td> --%>
		<td>${purchase.dlvyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>구매요청사항</td>
		<%-- <td><%= purchase.getDlvyRequest() %></td> --%>
		<td>${purchase.dlvyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>배송희망일자</td>
		<%-- <td><%= purchase.getDlvyDate() %></td> --%>
		<td>${purchase.dlvyDate}</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>