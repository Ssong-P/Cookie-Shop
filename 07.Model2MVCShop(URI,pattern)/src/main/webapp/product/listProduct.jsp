<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<%@page import="com.model2.mvc.common.util.CommonUtil"%>
<%@ page import="com.model2.mvc.common.*" %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="java.util.*" %>
   
<%
	List<Product> list = (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
	System.out.println("listproduct"+resultPage);
	
	//menu�� ���� �޾Ƽ� -> Search or Update�� ����
	String menu = request.getParameter("menu");
	String title = "��ǰ����";
	if(menu.equals("search")){
		title = "��ǰ�����ȸ";
	}
%>
 --%>
<!-- manage -> update / search -> get -->

<%-- 
	--- �̷����ϸ� ���ο� ���� ���� ---
	<c:set var="title" value="��ǰ����"/>
	<c:set var = "menu" value="search"/>

	--- �Ķ���Ͱ� �޾ƿ��� ---
	request.getParameter("menu")
	= ${param.menu}

--%>

<c:if test= "${param.menu == 'manage'}">
	<c:set var="title" value="��ǰ����"/>
</c:if>


<c:if test= "${param.menu == 'search'}">
	<c:set var="title" value="��ǰ�����ȸ"/>
</c:if>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

<!-- 
	//�˻� ��ư�� ������ detailform���� submit��
	function fncGetUserList(currentPage){
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
-->

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<!-- Post ��� & menu�� ���� value��(search, update)�� �ޱ�  -->
<form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
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
				<%-- 
					<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
					<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
					<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
				--%>
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
						<a href="javascript:fncGetUserList('1');">�˻�</a>
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
		<td class="ct_list_b" width="150">��ǰ��</td>
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
	
	<!-- ������ �� ���� -->
	<%--
	<%
		for(int i=0; i<list.size(); i++) {
			Product vo = list.get(i);
	%>	
	<tr class="ct_list_pop">
		<td align="center"><%= i+1 %></td>
		<td></td>
		
				<td align="left">
					<a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>&menu=<%=menu%>"><%=vo.getProdName() %></a>
				</td>
		
		<td></td>
		<td align="left"><%=vo.getPrice() %></td>
		<td></td>
		<td align="left"><%=vo.getManuDate() %></td>
		<td></td>
		<td align="left"><%=vo.getProTranCode() %></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>

	<% } %>
	 --%>
	 
	 <c:set var="i" value="0" />
	 <c:forEach var="product" items="${list}">
	 	<c:set var="i" value="${i+1}"/>
		<tr class="ct_list_pop">
			<td align="center">${i}</td>
			<td></td>
			<td align="left">
				 <%-- <a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a> --%>
				 <a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
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
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	 </c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<%-- 
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>
			--%>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>