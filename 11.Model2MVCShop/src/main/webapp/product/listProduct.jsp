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
      
      img {
      	width: auto; height: auto;
	    max-width: 300px;
	    max-height: 300px;
      }
      
      .cookie {
      width: auto; height: auto;
      	width: 300px;
		  height: 300px;
		  object-fit: cover;
		  margin: 0px auto;
		  
      }
      
    </style>
<script type="text/javascript">

	var menu = $("input[name='menu']").val();

	
	//�˻� ��ư�� ������ detailform���� submit��
	function fncGetUserList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/product/listProduct").submit();
	}
	
	$(function() {
		 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( "button.btn.btn-default" ).on("click" , function() {
		fncGetUserList(1);
		});
	 });
	
	
	
	
	//ProdName ��ǰ��������
	$(function(){
	
		$(".ct_list_pop td:nth-child(2)").click(function(){
			//alert("�ȳ�")
			self.location="/product/getProduct?prodNo="+$(this).find("input[name=prodNo]").val()+"&menu=${param.menu}";
		});
		
	});
	
	
	
	$(function(){

/* 		$("td.ct_btn01:contains('�˻�')").click(function(){
			alert("���ư���")
			fncGetUserList(1);
		});
			 */
		
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
						
						var displayValue = "<h6>"
										+ "<img src='/images/uploadFiles/"+JSONData.fileName+"'/></br></br></br></br>"
										+ "��ǰ��ȣ : "+JSONData.prodNo+"</br>"
										+ "��ǰ�� : "+JSONData.prodName+"</br>"
										+ "��ǰ������ : "+JSONData.prodDetail+"</br>"
										+ "�������� : "+JSONData.manuDate+"</br>"
										+ "���� : "+JSONData.price+"</br>"
										+ "</h6>";	
						
						//alert(displayValue);		
						$("h6").remove();
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


					<c:if test= "${param.menu == 'manage'}">
						<%--<c:set var="title" value="��ǰ����"/>  --%>
						<div class="page-header text-info">
	      					<h3>��Ű ����</h3>
	   					</div>
					</c:if>
					
					<c:if test= "${param.menu == 'search'}">
						<%-- <c:set var="title" value="��ǰ�����ȸ"/>  --%>
						<div class="page-header text-info">
	      					<h3>��Ű �˻�</h3>
	   					</div>
					</c:if>
					
							${title}

		
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
	<c:if test= "${param.menu == 'manage'}">		
	<table class="table table-hover table-striped" >
      
    <thead>
		<tr class="active">
			<td class="ct_list_b" width="100" align="center"><strong>No</strong></td>
			<td class="ct_list_b" width="400" align="center"><strong>��ǰ��</strong></td>
			<td class="ct_list_b" align="center"><strong>����</strong></td>
			<td class="ct_list_b" align="center"><strong>�����</strong></td>	
			<td class="ct_list_b" align="center"><strong>��ǰ����</strong></td>	
			<td class="ct_list_b" width="300" align="center"><strong>�������</strong></td>	
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
			<td align="center">
					<c:choose>
						<c:when test="${user.role eq 'admin'}"> 
							<c:choose >
								<c:when test="${product.proTranCode eq null }">
									�Ǹ� ��
								</c:when>
								<c:when test="${product.proTranCode eq '001'}">
									����
									<a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=002">����ϱ�</a>
								</c:when>
								<c:when test="${product.proTranCode eq '002'}">
									��� ��
								</c:when>
								<c:when test="${product.proTranCode eq '003'}">
									��ۿϷ�
								</c:when>
							</c:choose>
						</c:when>
					
						<c:when test="${user.role eq 'user'}"> 
							<c:choose>
								<c:when test="${product.proTranCode eq null }">
									�Ǹ� ��
								</c:when>
								<c:otherwise>
									�Ǹ� �Ϸ�
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
			</td>
			<td align="center" title="Click : ��ǰ���� Ȯ��">
				<i class="glyphicon glyphicon-search" id= "${product.prodNo}"></i>
				<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}">
			</td>
		</tr>
	 </c:forEach>
	 </tbody>
	 
	</table>
	</c:if>
	
	
	<c:if test= "${param.menu == 'search'}">

		<div class="row">
		<c:set var="i" value="0" />
	 		<c:forEach var="product" items="${list}">
	 	<c:set var="i" value="${i+1}"/>
			
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
		    	<div class = "cookie" align="center">
		      <img src="/images/uploadFiles/${product.fileName}">
		      </div>
		      <div class="caption">
		        <h4>${product.prodName}</h4>
		        <p>${product.price}</p>
		        <p><a href="/purchase/addPurchase?prodNo=${product.prodNo}" class="btn btn-primary" role="button">��Ű����</a> 
		        <a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}" class="btn btn-default" role="button">
		        ������</a></p>
		      </div>
		    </div>
		  </div>

		
	 </c:forEach>
		</div>

	
	</c:if>
	
			<jsp:include page="../common/pageNavigator_new.jsp"/>


	</form>
	</div>

</body>
</html>
