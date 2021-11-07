<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	var menu = $("input[name='menu']").val();

	
	//�˻� ��ư�� ������ detailform���� submit��
	function fncGetUserList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/product/listProduct").submit();
	}
	
	$(function(){

		$("td.ct_btn01:contains('�˻�')").click(function(){
			alert("���ư���")
			fncGetUserList(1);
		});
			
		
		$(".ct_list_pop td:nth-child(3)").click(function(){
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
										+ "��ǰ��ȣ : "+JSONData.prodNo+"</br>"
										+ "��ǰ�� : "+JSONData.prodName+"</br>"
										+ "��ǰ�̹��� : "+JSONData.fileName+"</br>"
										+ "��ǰ������ : "+JSONData.prodDetail+"</br>"
										+ "�������� : "+JSONData.manuDate+"</br>"
										+ "���� : "+JSONData.price+"</br>"
										+ "</h3>";	
						
						//alert(displayValue);		
						$("h3").remove();
						$("#"+prodNo+"").html(displayValue);
					}
				});		
		
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "blue");
		$("h7").css("color" , "blue");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");

		
	});

	
	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<!-- Post ��� & menu�� ���� value��(search, update)�� �ޱ�  -->
<form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post">
<input type="hidden" id="menu" name="menu" value="${param.menu}">


<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
					<c:if test= "${param.menu == 'manage'}">
						<c:set var="title" value="��ǰ����"/>
					</c:if>
					
					
					<c:if test= "${param.menu == 'search'}">
						<c:set var="title" value="��ǰ�����ȸ"/>
					</c:if>
					
							${title}
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>

	<%-- if�� 3�� �����ڷ� �ٲٱ� --%>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				
				<option value="0" ${!empty search.searchCondition && searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${!empty search.searchCondition && searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${!empty search.searchCondition && searchCondition==2 ? "selected" : "" }>��ǰ����</option>
		 
			</select>
			<%-- <input 	type="text" name="searchKeyword"  value="<%= searchKeyword %>" --%>
			<input 	type="text" name="searchKeyword"  value="${!empty serach.searchKeyword ? serach.searchKeyword : "" }" 
							class="ct_input_g" style="width:200px; height:19px" >
		</td>

		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:fncGetUserList('1');">�˻�</a>  -->
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>

	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		<%-- ��ü <%= resultPage.getTotalCount() %> �Ǽ�, ���� <%=resultPage.getCurrentPage() %> ������ --%>
		��ü ${ resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��<br>
			<h7 >(��ǰ�� click:������)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	 
	 <c:set var="i" value="0" />
	 <c:forEach var="product" items="${list}">
	 	<c:set var="i" value="${i+1}"/>
		<tr class="ct_list_pop">
			<td align="center">${i}</td>
			<td></td>
			<td align="left">
				 <%-- <a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a> --%>
				 <!-- <a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>  -->
				${product.prodName} 
				<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}">
				
			</td>
			<td></td>
				<td align="left">${product.price}</td>
			<td></td>
				<td align="left">${product.manuDate}</td>
			<td></td>
				<td align="left">null</td>
			<td></td>
		</tr>
		<tr>
			<!-- <td colspan="11" bgcolor="D6D7D6" height="1"></td>  -->
			<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	 </c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>

			
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
