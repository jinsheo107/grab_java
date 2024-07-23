<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    
    <meta charset="UTF-8">
    <meta name="description" content="Deerhost Template">
    <meta name="keywords" content="Deerhost, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DEERHOST | Template</title>


    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="폰트.css">
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/common/hospital_id_search1.css" type="text/css">
</head>
<body>
    <%@ include file="../include/hospital_nav.jsp" %>
        <div>
            <p><strong>회원정보에 등록한 본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</strong></p>
        </div>
        <div class="signup-content">
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" class="form-control" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="auth-code">인증번호</label>
                <input type="text" class="form-control" id="auth-code" placeholder="인증번호 6자리 숫자 입력">
                <button type="button" class="btn btn-outline-secondary" id="verifycodeButton">확인</button>
            </div>
            <div class="description">
                <a href="#" id="show-description">인증번호가 오지 않았나요? [?]</a>
            </div>
            <div class="description-box" id="description-box">
                <p>‘여기아파’가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요. 스팸 메일함에서 메일이 없다면, 다시 한 번 ‘인증번호 받기’를 눌러주세요.</p>
            </div>
            <button type="button" class="signup-button" onclick="checkAgreement">다음</button>
        </div>
        </form>

    </div>
    <%@ include file="../include/footer.jsp" %>
   <!-- Js Plugins -->
   <script src="../../resources/js/jquery-3.7.1.js"></script>
    <script src="../../resources/js/bootstrap.min.js"></script>
    <script src="../../resources/js/jquery.slicknav.js"></script>
    <script src="../../resources/js/owl.carousel.min.js"></script>
    <script src="../../resources/js/main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('show-description').addEventListener('click', function (e) {
                e.preventDefault();
                document.getElementById('description-box').style.display = 'block';
            });
        });
        
        
        $('#verifyCodeButton').click(function(){
        	var email = $('#email').val();
        	var code = $('#auth-code').val();
        	$.post('verifyCode', {email : email, auto-code : code}, function(data){
        		if(data.startsWith('success:')) {
        			var userId = data.split(' : ')[1];
        			$('#result').text('아이디 :' + userId);
        		} else {
        			alert(data.split(':')[1]);
        		}
        	});
        });
     });
        
        function checkAgreement(){
        	document.getElementById('myForm').submit();
        }
    </script>
</body>
</html>