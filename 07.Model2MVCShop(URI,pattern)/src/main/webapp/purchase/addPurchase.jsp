<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--@ page import = "com.model2.mvc.service.domain.*" --%>

<!DOCTYPE html>

<%--
	Purchase purchase = (Purchase)session.getAttribute("purchase");
	User user =(User)session.getAttribute("user");
--%>



<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchaseView?tranNo=0" method="post">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<%-- <td><%= purchase.getPurchaseProd().getProdNo() %></td> --%>
		<td>${purchase.purchaseProd.prodNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<%-- <td><%= purchase.getBuyer().getUserId() %></td> --%>
		<td>${purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
			<%-- <% if(purchase.getPaymentOption().equals("1")) { %>
				���ݱ���
			<% } else { %>
				�ſ뱸��
			<% } %> --%>
			<c:if test="${purchase.paymentOption eq '1'}">
				���ݱ���
			</c:if>
			
			<c:if test="${purchase.paymentOption eq '2' }">
				�ſ뱸��
			</c:if>
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<%-- <td><%= purchase.getReceiverName() %></td> --%>
		<td>${purchase.receiverName}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<%-- <td><%= purchase.getReceiverPhone() %></td> --%>
		<td>${purchase.receiverPhone}</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<%-- <td><%= purchase.getDlvyAddr() %></td> --%>
		<td>${purchase.dlvyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<%-- <td><%= purchase.getDlvyRequest() %></td> --%>
		<td>${purchase.dlvyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<%-- <td><%= purchase.getDlvyDate() %></td> --%>
		<td>${purchase.dlvyDate}</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>