<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page errorPage = "exceptionNoBookId.jsp"%>

<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">
<title>영화 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>

</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">영화정보</h1>
        <p class="col-md-8 fs-4">MovieInfo</p>      
      </div>
    </div>
	
	<%
		String id = request.getParameter("id");
	    BookRepository dao = BookRepository.getInstance();
	    Book book = dao.getBookById(id);
	%>
	 <div class="row align-items-md-stretch">	 	
	 		<div class="col-md-5">
				<img src="./resources/images/<%=book.getFilename()%>" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3><b><%=book.getName()%></b></h3>
				<p><%=book.getDescription()%>
				<p><b>영화번호 : </b><span class="badge text-bg-danger"> <%=book.getBookId()%></span>							
				<p><b>감독</b> : <%=book.getAuthor()%>	
				<p><b>영화배급</b> : <%=book.getPublisher()%>	
				<p><b>영화상영일</b> : <%=book.getReleaseDate()%>					
				<p><b>영화장르</b> : <%=book.getCategory()%>
				<p><b>영화관객수</b> : <%=book.getUnitsInStock()%>
				<h4><%=book.getUnitPrice()%>분</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=book.getBookId()%>" method="post"><a href="#" class="btn btn-info" onclick="addToCart()"> 영화주문 &raquo;</a> 
				    <a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>				
					<a href="./books.jsp" class="btn btn-secondary"> 영화목록 &raquo;</a>
					</form>
			</div>
		</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
