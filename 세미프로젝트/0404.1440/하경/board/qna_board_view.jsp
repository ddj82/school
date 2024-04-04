<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_notice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_notice article = (Mc_notice)request.getAttribute("article");
Mc_notice article2 = (Mc_notice)request.getAttribute("article2");
Mc_notice article3 = (Mc_notice)request.getAttribute("article3");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>

 	.mdl{
 		text-align: center;
 	}
	
	h2 {
		text-align: center;
	}
	
	#basicInfoArea {
		position: relative;
		height: 40px;
		text-align: center;
	}
	
	#articleContentArea {
/* 		background: orange; */
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto;
	}
	

	
	p {
		position: absolute;  

/*         margin-left: 40px; */
    }
    
     body{ 
     	margin: 0; 
     } 
    
     table{ 
     	position: relative; 
       	width: 	95%;  
     	border-collapse: collapse; 
     	margin: 0 auto;
     	margin-top: 50px;  

     } 
     
     .tb{ 
      	margin-top: 250px;   

     } 
    
    table th:first-child,
	table td:first-child {
	border-left: 0;
	}
	table th:last-child,
	table td:last-child {
	border-right: 0;
	}
    
     th, td{
    border: 1px solid black;
    padding: 10px;
    text-align: left;
    }
    
     th{
     background-color: #ddd;	
     width: 10%;
     }
    
 
</style>
</head>
<body>
<%-- 	<%@ include file="../navbar.jsp"%> --%>

	<br><br>
	<header>
		<h1>공지사항</h1>
	</header>

<div style="background-color: white; width: 100%; margin: 0 auto;">
	<section id="articleForm">
		<h2>공지 글</h2>

		        <table>
            <tr>
                <th>제목</th>
                <td colspan="5"><%=article.getNt_title()%></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td style="width:30%"><%=article.getNt_writer()%></td>
                <th>공지번호</th>
                <td style="width:20%"><%=article.getNt_no() %></td>
                <th>등록일</th>
                <td style="width:20%"><%=article.getNt_date()%></td>
            </tr>
        </table>
        
        </section>
        	<div class="cont">
                <p >
                <%=article.getNt_content()%>
				</p>        
                <br><br><br><br>
       		</div>
<%
if (article2 == null ) {%>
	<table class="tb">
	<tr>
	<th>이전글</th>
	<td></td>
	</tr>
	<tr>
	<th>다음글</th>
	<td><a href="boardDetail.mc?nt_no=<%=article3.getNt_no() %>&page=${page }"><%=article3.getNt_title()%></a></td>
	</tr>
	</table>
<%} else if (article3 == null) {%>
	<table class="tb">
	<tr>
	<th>이전글</th>
	<td><a href="boardDetail.mc?nt_no=<%=article2.getNt_no() %>&page=${page }"><%=article2.getNt_title()%></a></td>
	</tr>
	
	<tr>
	<th>다음글</th>
	<td></td>
	</tr>
	</table>
<%} else {%>
	<% if(article2.getNt_no() > 0 || article2.getNt_no() < article3.getNt_no()){%>
        <table class="tb">
        <tr>
        <th>이전글</th>
        <td><a href="boardDetail.mc?nt_no=<%=article2.getNt_no() %>&page=${page }"><%=article2.getNt_title()%></a></td>
        </tr>
        <tr>
        <th>다음글</th>
        <td><a href="boardDetail.mc?nt_no=<%=article3.getNt_no() %>&page=${page }"><%=article3.getNt_title()%></a></td>
        </tr>
        </table>
       <%  }%>
        
<% }%>
        
		<%if (session.getAttribute("id") == null) {%>
		
			<div class="mdl"><a href="boardList.mc?page=${page }"> 목록 </a>&nbsp;&nbsp;</div>
			<%} else if(session.getAttribute("id").equals("admin")){%>
			<div class="mdl">
			<a href="boardModifyForm.mc?nt_no=<%=article.getNt_no() %>&page=${page }"> 수정 </a>
			<a href="boardDeleteForm.mc?nt_no=<%=article.getNt_no() %>&page=${page }"> 삭제 </a>
			<a href="boardList.mc?page=${page }"> 목록 </a>&nbsp;&nbsp;
			</div>
		<%} else {%>
			<div class="mdl">
			<a href="boardList.mc?page=${page }"> 목록 </a>&nbsp;&nbsp;
			</div>
		<%} %>
		


	
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</div>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>