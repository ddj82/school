

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_rooms"%>
<%
    Mc_rooms room = (Mc_rooms)request.getAttribute("room");
//     String page = (String)request.getAttribute("page"); // 이전 페이지 번호를 가져옴
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<script type="text/javascript">
//     function modifymoca(){
//         modifyform.submit();
//     }
</script>
<style type="text/css">
    #registForm{ 
        width: 500px; 
        height: 600px; 
        border : 1px solid red;  
        margin:auto;  
    }    
    h2{ 
        text-align: center; 
    } 
    table{ 
        margin:auto; 
        width: 450px;        
    } 
    .td_left{ 
        width: 150px; 
        background:orange; 
    } 
    .td_right{ 
        width: 300px; 
        background:skyblue; 
    } 
    #commandCell{ 
        text-align: center; 
      
    } 
</style>
</head>
<body>
<section id="insertformArea">
    <form name="insertRoom" action="mocaModifyPro.mc" method="post" enctype="multipart/form-data">
        <input type = "hidden" name = "page" value = "${page }">
        <table>
            <tr>
                <td colspan="2">
                    <h1>방 수정</h1>
                </td>
            </tr>
            <tr>
                <td><label for="R_NO">룸 번호 : </label></td>
                <td><input type="text" name="R_NO" id="R_NO" value="<%= room.getR_no() %>" readonly/></td>
            </tr>
            <tr>
                <td><label for="R_NAME">룸 이름 : </label></td>
                <td><input type="text" name="R_NAME" id="R_NAME" value="<%= room.getR_name() %>"/></td>
            </tr>
            <tr>
                <td><label for="R_MAX">수용인원 : </label></td>
                <td><input type="text" name="R_MAX" id="R_MAX" value="<%= room.getR_max() %>"/></td>
            </tr>
            <tr>
                <td><label for="R_DESC">룸 설명 : </label></td>
                <td><input type="text" name="R_DESC" id="R_DESC" value="<%= room.getR_desc() %>"/></td>
            </tr>
            <tr>
                <td><label for="R_FILE">룸 사진 : </label></td>
                <td><input type="file" name="R_FILE" id = "R_FILE" value="<%= room.getR_file() %>"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="수정">
<!--                     <input type="submit" value="수정" onClick="javascript:modifymoca()"> -->
                    <input type="reset" value="다시쓰기" >
                </td>
            </tr>
        </table>
    </form>
</section>
<section>
    <a href="javascript:history.go(-1)">[뒤로가기]</a>
</section>
</body>
</html>