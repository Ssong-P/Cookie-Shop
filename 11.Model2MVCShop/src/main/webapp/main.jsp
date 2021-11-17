<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
        
        body {
        height: 100vh;
        background-image: "/images/uploadFiles/back1";
        background-repeat : no-repeat;
        background-size : cover;
      }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>



	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
  
     <!--  <!-- Main jumbotron for a primary marketing message or call to action -->
<!--       <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <hr style="border: solid 1px grey" width="73%"  align="left">
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework </br> Mini-Project</p>
     </div>
    </div> -->


<!-- 	<div class="container">
		<div class="col-md-4" align= "center">
	        <h3>JAVA Core</h3>
	        <p>J2SE JDBC Servlet&JSP</p>
        </div>
        
        <div class="col-md-4" align= "center">
	  	 	<h3>Framework</h3>
	        <p>MyBatis Spring</p>
        </div>

        <div class="col-md-4" align= "center">
	  	 	<h3>Web UI</h3>
	        <p>HTML5 JavaScript CSS&JSP</p>
		</div>

  	 </div>  -->
  	 
  	 <div class="container">
<!-- 	    <div class="jumbotron">
		  <h1>Hello, world!</h1>
		  <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
		</div> -->
		
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		  <!--   <li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		  
		    <div class="item active">
		      <img src="./images/uploadFiles/123456.jpg" width="1140" height="500" alt="First slide">
		    </div>
		   
		    
		    <div class="item">
		      <img src="./images/uploadFiles/1235.jpg" width="1140" height="500" alt="Second slide">
		    </div>


		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		</div>
		
		      	<br/><hr/><br/>
	</div>    


	<div class="container">
	
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="glyphicon glyphicon-triangle-right"></i>
					Contacts
				</h3>
			</div>
			<ul class="list-group">
				<li class="list-group-item"><a href="https://www.cookierun-kingdom.com/ko/">Homepage</a></li>
				<li class="list-group-item"><a href="https://twitter.com/CRKingdomKR?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor">twitter</a></li>
			</ul>
			</div>
			<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="glyphicon glyphicon-triangle-right"></i>
					Download
				</h3>
			</div>
			<ul class="list-group">
				<li class="list-group-item"><a href="https://play.google.com/store/apps/details?id=com.devsisters.ck">Google Play</a></li>
				<li class="list-group-item"><a href="https://apps.apple.com/kr/app/id1509450845">Apple App Store</a></li>
				<li class="list-group-item"><a href="https://m.onestore.co.kr/mobilepoc/apps/appsDetail.omp?prodId=0000751155&scYn=Y">One Store</a></li>
				<li class="list-group-item"><a href="https://galaxystore.samsung.com/detail/com.devsisters.ck">Galaxy Store</a></li>
			</ul>
			</div>
		</div>
	

		<div class="col-md-9">
	  		<h1>10억 감사제 EVENT</h1>
	  		<br></hr>
	  		<p>감사제는 게임 내 이벤트 창을 통해 참여할 수 있으며, 매일 달라지는 경품에 응모하면 5월 3일부터 매주 1번씩 당첨자를 발표한다. 또 7일 연속으로 응모할 경우 스페셜 선물인 '황금 용쿠 30돈'에 자동 응모된다. 해당 피규어는 순금 30돈으로 제작되어 소장가치를 더한 점이 특징이며, 당첨자는 10명으로 총 300돈의 황금 용감한 쿠키를 지급한다.</p>
		</div>
	</div>

	
	</div>
	

</body>

</html>