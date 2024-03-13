<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
int pageCount = 0;
void addCount() {
	pageCount++;
}

void resetCount() {
	pageCount = 0;
	System.out.println("출력");
}
%>
<%
addCount();

// int pageCount = 0;
// pageCount++;
// 지역변수이기 때문에 브라우저에서 새로고침 할때마다 재선언 됨
// 선언태그에서 선언된 변수를 실행태그에서 사용 가능
// 실행태그에서 선언된 변수를 선언태그에서 사용 불가
%>
<p> 이 사이트 방문은 <%= pageCount %>번째 입니다.</p>
