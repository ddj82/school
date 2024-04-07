<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<title>공지사항</title>
<style type="text/css">
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f3f3f3;
    }

    #writeForm {
/*         max-width: 600px; */
/*         margin: 0 auto; */
/*         padding: 20px; */
/*         background-color: #fff; */
/*         border-radius: 5px; */
/*         box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1); */
  margin: 20px auto;
    width: 50%;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
    }

    table {
        margin: auto;
        width: 100%;
    }

    .th_left {
        width: 30%;
        background: rgb(242 231 220);
        padding: 10px;
        color: black;
    }

    .td_right {
        width: 70%;
        background: rgb(255 250 250);
        padding: 10px;
    }

    textarea, input[type="text"] {
        width: calc(100% - 20px); 
        padding: 10px;
        border-radius: 5px;
        border: 3px solid #ccc;
        margin-bottom: 10px;
    }

    textarea {
 
      resize: none;
      height: 300px;
}
    	
        height: 150px;
    }

    #commandCell {
        text-align: center;
    }

/*     #commandCell input[type="submit"], */
/*     #commandCell input[type="reset"] { */
/*         padding: 10px 20px; */
/*         background-color: #4CAF50; */
/*         color: white; */
/*         border: none; */
/*         border-radius: 5px; */
/*         cursor: pointer; */
/*         transition: background-color 0.3s; */
/*     } */

form input[type="submit"],
form input[type="button"],
form input[type="reset"] {
   color: black;
   background-color: rgb(232, 221, 210);
   border: none;
   padding: 10px 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 30px;
}

/*     #commandCell input[type="submit"]:hover, */
/*     #commandCell input[type="reset"]:hover { */
/*         background-color: #45a049; */
/*     } */

form input[type="submit"]:hover,
form input[type="button"]:hover,
form input[type="reset"]:hover {
    opacity: 0.8;
}


    p {
        text-align: right;
        margin-right: 20px;
    }
    hr{
    	width:50%;
    }
    #nt_content{
    	margin-bottom : 0px;
    }

/*     @media only screen and (max-width: 768px) { */
/*         .td_left, .td_right { */
/*             width: 100%; */
/*         } */
/*     } */
</style>
</head>
<body>

<div class="body-wrapper">
        <h2>공지사항 글등록</h2>
        <hr><br><br>
    <section id="writeForm">
        <form action="boardWritePro.mc" method="post" enctype="multipart/form-data" name="boardform">
            <table>
                <tr>
                    <th class="th_left" style= "border-radius: 20px 0 0 0;"><label for="BOARD_NAME">글쓴이</label></th>
                    <td class="td_right"><input type="text" name="nt_writer" id="nt_writer" value="관리자" required readonly></td>
                </tr>

                <tr>
                    <th class="th_left"><label for="nt_title">제 목</label></th>
                    <td class="td_right"><input name="nt_title" type="text" id="nt_title" required></td>
                </tr>
                <tr>
                    <th class="th_left" style= "border-radius: 0 0 0 20px;"><label for="nt_content">내 용</label></th>
                    <td><textarea id="nt_content" name="nt_content" cols="40" rows="15" required></textarea></td>
                </tr>
            </table>
            <section id="commandCell">
                <input type="submit" value="등록">&nbsp;&nbsp;
                <input type="reset" value="다시쓰기" >
            </section>
        </form>
    </section>
    <br><br>
      </div>
</body>
</html>
