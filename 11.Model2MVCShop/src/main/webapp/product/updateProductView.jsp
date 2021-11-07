<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<html>
<head>
	<meta charset="EUC-KR">
	
	<title>��ǰ��������</title>
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	<!-- DatePicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
 	<!-- <link rel="stylesheet" href="/resources/demos/style.css">  -->
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  
	<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>  -->
	<!-- <script type="text/javascript" src="../javascript/calendar.js"></script>  -->
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        
        div h3, div h5 {text-align: center;}
        
        label {
        	color : #6593A6;
        }
        
     </style>
    
<script type="text/javascript">

	function fncupdateProduct(){
		
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		
		if(name == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է����ּ���.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		
		$("form").attr("method","POST").attr("action","/product/updateProduct").submit();
		
	}
	

/* 	$(function() {
		 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
			fncupdateProduct();
		});
	});	
	$(function(){
		$("td.ct_btn01:contains('���')").click(function(){
			history.go(-1);
		});
	}) */
	
	$(function(){
			//alert("hell...")
			$("button.btn.btn-primary").click(function(){
				//alert(${product.prodNo})
				//self.location="/product/updateProduct?prodNo=${product.prodNo}"
				fncupdateProduct();
			});
		});
		
	$(function() {
		 $( "a[href='#']" ).click( function() {
			 history.go(-1);
		});
	});	
	
	$( function() {
	    $( "#manuDate" ).datepicker({
	      showOn: "button",
	      buttonImage: "/images/calendar.gif",
	      buttonImageOnly: true,
	      buttonText: "Select date", 
	      dateFormat : 'yy-mm-dd', 
	      
	      showButtonPanel: true,
	      closeText : "�ݱ�",
          prevText : "������",
          nextText : "������",
          currentText : "����",
          changeMonth: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ�
          changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ�
          monthNames : [ "1��", "2��", "3��", "4��", "5��", "6��", "7��", "8��", "9��", "10��", "11��", "12��" ],
          monthNamesShort : [ "1��", "2��", "3��", "4��", "5��", "6��", "7��", "8��", "9��", "10��", "11��", "12��" ],
          dayNames : [ "�Ͽ���", "������", "ȭ����", "������", "�����", "�ݿ���", "�����" ],
          dayNamesShort : [ "��", "��", "ȭ", "��", "��", "��", "��" ],
          dayNamesMin : [ "��", "��", "ȭ", "��", "��", "��", "��" ],
          weekHeader : "��",
	    });
	    
	  } );


</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	

<%-- <input type="hidden" name="prodNo" value="<%=vo.getProdNo() %>"/> --%>
	<form name="detailForm" method="post">
	<input type="hidden" name="prodNo" value="${product.prodNo}"/>

	
	<div class="container">

	<div class="page-header" >
	       <h3 class="text-info">�� ǰ �� ��</h3>
	       <h5 class="text-muted">��ǰ ������ <strong class="text-danger">����</strong>�� �ּ���.</h5>
	</div>
	
	<div class="form-horizontal">
	
	<div class="form-group">
	    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
	    <div class="col-sm-4">
		    <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
	    </div>
	</div>
			
	<hr/>
	
	<div class="form-group">
		<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		</div>
	</div>
			
	<hr/>
	
	<div class="form-group">
	    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
	    <div class="col-sm-4">
	      <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}">
	    </div>
	</div>
	
	<hr/>
	
	<div class="form-group">
	    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">����</label>
	    <div class="col-sm-4">
	      <input type="text" class="form-control" id="price" name="price" value="${product.price}">
	    </div>
	  </div>
	
	<hr/>
	
	<div class="form-group">
	    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
	    <div class="col-sm-4">
	      <input type="text" class="form-control" id="fileName" name="fileName" value="${product.fileName}">
	    </div>
	  </div>
	
	<hr/>
	
	<div class="form-group">
	    <div class="col-sm-offset-4  col-sm-4 text-center">
	      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
		  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
	    </div>
	</div>

	</div>
	</div>
	</form>

</body>
</html>