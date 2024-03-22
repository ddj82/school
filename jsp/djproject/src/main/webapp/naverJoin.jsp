<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 : 회원가입</title>
<style>
    * {box-sizing: border-box;}

    /* 전체 중앙배치 */
    div, form[name=rogo] {
        width: 450px;
        margin: 0 auto;
    }
    
    /* 버튼 */
    button#end {
        border: none;
        border-radius: 5px;
        background-color: #24a724;
        color: white;
        font-size: 18px;
        font-weight: bold;
        position: fixed;
        bottom: 20px;
        width: 450px;
    }
    
    /* 셀렉트 옵션 크기(글자크기로 조정해야함) */
    option {font-size: 15px;}
    
    /* 네이버 로고 */
    input.rogo {border: none; width: 100px; height: 20px;}
    form[name=rogo] {padding: 15px 0;}
    
    
    /* 항목 테두리, 크기 */
    input, select, button, div.did, div.dgen, div.dage, div.dpaw, div.bdRe3 {
        width: 100%;
        height: 50px;
        border: 1px solid #ccc;
        border-bottom: none;
        font-size: 15px;
    }
    
    /* 아이디입력창만 크기가 다름 */
    div.did input {width: 80%; display: inline-block; border: none;}
    div.did div.com {width: 20%; margin: 0; display: inline-block;}


    /* 테두리 디테일(하단테두리)*/
    div.demail, div.dtel, div.demail input, div.dtel input, div.emtel, div.bdRe2 {
        border: 1px solid #ccc;
        border-radius: 0 0 5px 5px;
    }

    /* 테두리 디테일(상단테두리)*/
    div.did, div.dname, div.did input, div.dname input, div.bdRe1 {
        border: 1px solid #ccc;
        border-radius: 5px 5px 0 0;
        color: gray;
        border-bottom: none;
    }
    
    /* 라디오타입 체크박스 없애기 */
    input[type="radio"] {display: none;}

    /* 라벨 디테일 */
    label {
        border: 1px solid #ccc;
        vertical-align: middle;
        display: inline-block;
        padding: 7px 53px;
        color: #a1a1a1;
        font-size: 13px;
        margin: 8px 0;
    }
    div.dgen {text-align: center;}
    label.le {border-radius: 5px 0 0 5px;}
    label.ri {border-radius: 0 5px 5px 0;}
    input:checked + label {border: 1px solid rgb(0, 220, 0); color: rgb(0, 220, 0);}

    /* li(안내문구) 설정 */
    ul {
        margin: 10px 0;
        padding-left: 20px;
        color: red;
    }
    li#litxt {
        display: none;
    }


    div#divMain input {
        height: 100%;
    }
    div {height: 50px;}
    
    select#nation {outline: none;}
    
    /* border_return id,paw,name,age 하단테두리 삭제 */
    .border_return {
        border-bottom: none;
    }
    
    /* border_green bdGreen */
    div.bdGreen {border: 2px solid rgb(0, 220, 0);}
    
    /* border_green bdRed */
    div.bdRed {border: 2px solid red;}
    
    .phred::placeholder {
        color: red;
        text-decoration: underline;
    }
</style>
<script src="./jquery/jquery-3.6.4.js"></script>
</head>

<body>
    <form name="rogo" action="https://www.naver.com/" method="post" autocomplete="off">
        <input class="rogo" type="image" src="./img/naverLogo.png" title="네이버 홈페이지로">
    </form>
    <br><br>
    <div id="divMain">
<!--         <form action="e.jsp" method="post" onsubmit="return checkForm()" name="formJoin" class="formClass"> -->
        <form action="naverJoinProcess.jsp" method="post" onsubmit="return checkForm()" name="formJoin" class="formClass">
            <div class="did ok"><input onclick="" id="uid" type="text" name="id" pattern="[a-zA-Z0-9_\-]+" minlength="5" maxlength="20" placeholder="아이디" ><div class="com">@naver.com</div></div>

            <div class="dpaw ok"><input onclick="" type="password" id="upaw" name="pw" pattern="[a-zA-Z0-9~!@#$%^&\*_]+" minlength="8" maxlength="16" placeholder="비밀번호" ></div>

            <div class="demail"><input onclick="" class="email" type="email" id="uemail" name="email" pattern="[a-zA-Z0-9_]+[@]+[a-zA-Z]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" placeholder="[선택] 이메일주소 (비밀번호 찾기 등 본인 확인용)"></div>

            <ul id="error1">
                <small><li id="litxt" class='did'>아이디: 필수 정보입니다.</li></small>
                <small><li id="litxt" class='dpaw'>비밀번호: 필수 정보입니다.</li></small>
            </ul>

            <div class="dname ok"><input onclick="" type="text" id="uname" name="name" pattern="[가-힣a-zA-Z\s]+" placeholder="이름" ></div>

            <div class="dage ok"><input onclick="" type="text" id="uage" name="birth" pattern="[0-9]+" minlength="8" maxlength="8" placeholder="생년월일 8자리" ></div>
        
            <div class="dgen ok"><input type="radio" id="m" name="ugen" value="male"><label class="le" for="m">남자</label><input type="radio" id="w" name="ugen" value="female"><label class="cen" for="w">여자</label><input type="radio" id="n" name="ugen" value="none"><label class="ri" for="n">선택안함</label></div>

            <div class="dnation">
                <select id="nation" name="nation">
                    <option selected>대한민국 +82</option>
                    <option>네팔 +977</option>
                    <option>브라질 +55</option>
                    <option>콩고 +242</option>
                </select>
            </div>

            <div class="dtel ok"><input onclick="" type="tel" id="utel" name="utel" placeholder="휴대전화번호" pattern="(010)[0-9]{4}[0-9]{4}"></div>
            <ul id="error2">
                <small><li id="litxt" class='dname'>이름: 필수 정보입니다.</li></small>
                <small><li id="litxt" class='dage'>생년월일: 필수 정보입니다.</li></small>
                <small><li id="litxt" class='dtel'>휴대전화번호: 필수 정보입니다.</li></small>
            </ul>
            
            <button type="submit" id="end">회원가입</button>
        </form>
    </div>

    <script>
        $(function(){
            $(".formClass div").not(".dgen").children("input").css({"border": "none", "outline": "none"});
        });

        function checkForm() {
            var check = false;
            var check1 = false;
            var cnt = 0;
            var cnt1 = 0;
            $("div.ok").not("div.dgen.ok").each(function(index, value){
                if ($(value).children("input").val() == "" ) {
                    $(".formClass input").blur();
                } else {
                    cnt++;
                }
            });
            let radios = $("input[type=radio]");
            for (let i = 0; i < radios.length; i++) {
                if ($(radios[i]).prop("checked")) {
                // if ($(radios[i]).is(":checked")) {
                    cnt1++;
                }
            }

            if (cnt >= 5) {
                check = true;
            }
            if (cnt1 > 0) {
                check1 = true;
            }
            return check && check1;
        }

        $(".formClass input").focus(function(e){
            let i = e.target;
            let iClass = $(i).parent().attr("class");
            if (iClass.split(" ")[2] != "bdRed") {
                $(i).parent().removeClass("bdRe1");
                $(i).parent().removeClass("bdRe2");
                $(i).parent().removeClass("bdRe3");
                $(i).parent().removeClass("bdRed");
                $(i).parent().addClass("bdGreen");
                $(i).removeClass("phred");
            } else {
                $(i).parent().removeClass("bdRe1");
                $(i).parent().removeClass("bdRe2");
                $(i).parent().removeClass("bdRe3");
                $(i).parent().removeClass("bdGreen");
                $(i).parent().not(".demail").addClass("bdRed");
                $(i).addClass("phred");
            }
        });

        $(".formClass input").blur(function(e){
            let i = e.target;
            let iClass = $(i).parent().attr("class");
            if (i.value == "") {
                $(i).parent().removeClass("bdRe1");
                $(i).parent().removeClass("bdRe2");
                $(i).parent().removeClass("bdRe3");
                $(i).parent().removeClass("bdGreen");
                $(i).parent().not(".demail").addClass("bdRed");
                
                if (iClass.split(" ")[0] == "did") {
                    $(".formClass ul").find(".did").show();
                    $(i).addClass("phred");
                    
                } else if (iClass.split(" ")[0] == "dpaw") {
                    $(".formClass ul").find(".dpaw").show();
                    $(i).addClass("phred");
                    
                } else if (iClass.split(" ")[0] == "dname") {
                    $(".formClass ul").find(".dname").show();
                    $(i).addClass("phred");
                    
                } else if (iClass.split(" ")[0] == "dage") {
                    $(".formClass ul").find(".dage").show();
                    $(i).addClass("phred");
                    
                } else if (iClass.split(" ")[0] == "dtel") {
                    $(".formClass ul").find(".dtel").show();
                    $(i).addClass("phred");
                }
            } else {
                $(i).removeClass("phred");
                if (iClass.split(" ")[0] == "did" || iClass.split(" ")[0] == "dname") {
                    $(i).parent().removeClass("bdGreen");
                    $(i).parent().removeClass("bdRed");
                    $(i).parent().addClass("bdRe1");
                    if (iClass.split(" ")[0] == "did") {
                        $(".formClass ul").find(".did").hide();
                    } else if (iClass.split(" ")[0] == "dname") {
                        $(".formClass ul").find(".dname").hide();
                    }
                } else if (iClass.split(" ")[0] == "demail" || iClass.split(" ")[0] == "dtel") {
                    $(i).parent().removeClass("bdGreen");
                    $(i).parent().removeClass("bdRed");
                    $(i).parent().not(".demail").addClass("bdRe2");
                    if (iClass.split(" ")[0] == "dtel") {
                        $(".formClass ul").find(".dtel").hide();
                    }
                } else if (iClass.split(" ")[0] == "dpaw" || iClass.split(" ")[0] == "dage") {
                    $(i).parent().removeClass("bdGreen");
                    $(i).parent().removeClass("bdRed");
                    $(i).parent().addClass("bdRe3");
                    if (iClass.split(" ")[0] == "dpaw") {
                        $(".formClass ul").find(".dpaw").hide();

                    } else if (iClass.split(" ")[0] == "dage") {
                        $(".formClass ul").find(".dage").hide();
                    }
                }
            }

        });
    </script>
</body>
</html>