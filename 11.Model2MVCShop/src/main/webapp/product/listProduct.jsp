<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<title>��ǰ �����ȸ</title>

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

	
	//�˻� ��ư�� ������ detailform���� submit��
	function fncGetUserList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/product/listProduct").submit();
	}
	
	
	//ProdName ��ǰ��������
	$(function(){
	
		$(".ct_list_pop td:nth-child(2)").click(function(){
			//alert("�ȳ�")
			self.location="/product/getProduct?prodNo="+$(this).find("input[name=prodNo]").val()+"&menu=${param.menu}";
		});
		
	});
	
	
	
	$(function(){

		$("td.ct_btn01:contains('�˻�')").click(function(){
			alert("���ư���")
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
		
		//$( ".ct_list_pop td:nth-child(3)" ).css("color" , "blue");
		//$("h7").css("color" , "blue");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");

		
	});

	
	
	
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
	<!-- Post ��� & menu�� ���� value��(search, update)�� �ޱ�  -->
	<form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post">
	<input type="hidden" id="menu" name="menu" value="${param.menu}">
	
		<div class="page-header text-info">
	       <h3>��ǰ�����ȸ</h3>
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
						<%--<c:set var="title" value="��ǰ����"/>  --%>
						<div class="page-header text-info">
	      					<h3>��ǰ����</h3>
	   					</div>
					</c:if>
					
					<c:if test= "${param.menu == 'search'}">
						<%-- <c:set var="title" value="��ǰ�����ȸ"/>  --%>
						<div class="page-header text-info">
	      					<h3>��ǰ�����ȸ</h3>
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
		

				<br>
	<table class="table table-hover table-striped" >
      
    <thead>
		<tr class="active">
			<td class="ct_list_b" width="100" align="center"><strong>No</strong></td>
			<td class="ct_list_b" width="500" align="center"><strong>��ǰ��</strong></td>
			<td class="ct_list_b" align="center"><strong>����</strong></td>
			<td class="ct_list_b" align="center"><strong>�����</strong></td>	
			<td class="ct_list_b" align="center"><strong>��ǰ����</strong></td>	
			<td class="ct_list_b" align="center"><strong>�������</strong></td>	
		</tr>
	</thead>

	<tbody>
		<c:set var="i" value="0" />
	 		<c:forEach var="product" items="${list}">
	 	<c:set var="i" value="${i+1}"/>
		<tr class="ct_list_pop">
			<td align="center">${i}</td>
			<td align="center" title="Click : ��ǰ����">${product.prodName}
				<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}">
			</td>
			<td align="center">${product.price}</td>
			<td align="center">${product.manuDate}</td>
			<td align="center">�غ���</td>
			<td align="center" title="Click : ��ǰ���� Ȯ��">
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
