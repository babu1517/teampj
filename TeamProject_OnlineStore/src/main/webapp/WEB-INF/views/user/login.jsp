<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	margin: 0 auto;
}
</style>
<meta name="viewport" content="width=device-width,initial-scale=1"
	charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- ������ ���ó�¥ ���� -->
<script type="text/javascript">
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("todayin");
		bir.value = today;
	}
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	//īī���α���
	function kakaoLogin() {

		$.ajax({
			url : '/shop/user/getKakaoAuthUrl',
			type : 'get',
			async : false,
			dataType : 'text',
			success : function(res) {
				location.href = res;
			}
		});

	}

	$(document).ready(
			function() {

				var kakaoInfo = '${kakaoInfo}';

				if (kakaoInfo != "") {
					var data = JSON.parse(kakaoInfo);

					alert("īī���α��� ���� \n accessToken : " + data['accessToken']);
					alert("user : \n" + "email : " + data['email']
							+ "\n nickname : " + data['nickname']);
				}
			});
</script>
<title>�α���</title>
</head>

<body>
	<form name="ff" action="loginCheck" method="post">
		<input type="datetime" name="nowtime" id="nowtime" readonly> <br>
		<br> <br> <br>
		<table width="400" align="center">
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="userid" id="id"></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="userpw" id="pw"></td>
			</tr>
			<tr>
				<td></td>
				<td align="center" colspan="2"><input type="submit" value="�α���">
					&emsp; <input type="reset" value="���"></td>
			</tr>
			<tr>
				<td colspan="3"><a href="loginn">ȸ������</a>&emsp;&emsp; <a
					href="/shop/seller/index">�Ǹ��� �α���</a></td>
			</tr>
		</table>
		<ul>
			<li onclick="kakaoLogin();"><a href="javascript:void(0)"> <span>īī��
						�α���</span>
			</a></li>
		</ul>
	</form>
</body>
</html>