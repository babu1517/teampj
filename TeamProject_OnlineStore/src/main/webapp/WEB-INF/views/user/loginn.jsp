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
<meta charset="EUC-KR">
<meta charset="UTF-8">
<script type="text/javascript">
/*
$(document).ready(function() {
	//�̸��� ��ȿ��
	$("#umail3").change(function(){
        $("#umail2").val( $("#umail3").val());
    });
	$("#input").on('click',function(){
		inputchk();
	})
});

	function inputchk() {
		var f = document.form;

		//���̵� ��ȿ��
		var vid = /^[A-Za-z0-9]{4,12}$/;
		var cid = f.userid.value;
		if (cid == "") {
			alert("���̵�� ������ �� �����ϴ�.");
			f.userid.select();
			return false;
		}
		if (!vid.test(cid)) {
			alert("���̵�� �����ڿ� �������� 4~12�ڸ��� �Է��ؾ��մϴ�.");
			f.userid.select();
			return false;
		}

		//�н����� ��ȿ��
		var vpw = /^[A-Za-z0-9]{6,12}$/;
		var cpw = f.userpw.value;
		if (cpw == "") {
			alert("��й�ȣ�� ������ �� �����ϴ�.");
			f.userpw.select();
			return false;
		}
		if (!vpw.test(cpw)) {
			alert("��й�ȣ�� �����ڿ� ���� 6~12�ڸ��� �Է��ؾ��մϴ�.");
			f.userpw.select();
			return false;
		}

		//��й�ȣȮ��
		var p1 = f.userpw.value;
		var p2 = f.userpw2.value;
		if (p1 != p2) {
			alert("��й�ȣ�� ��ġ ���� �ʽ��ϴ�");
			return false;
		}
		//��ȭ��ȣ ��ȿ��
		var vmobile = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		var cmobile = f.umobile.value;
		if (!vmobile.test(cmobile)) {
			alert("��ȭ��ȣ �Է� ������ �����ּ���.");
			f.umobile.select();
			return false;
		}
		//���̵� �ߺ�üũ ��ȿ��
		var cchk = f.chk.value;
		if(cchk != 0){
			alert("���̵� �ߺ� Ȯ�� �� ���� �����մϴ�.");
			f.chk.select();
			return false;
		}
		if(cchk == ""){
			alert("���̵� �ߺ� Ȯ�� �� ���� �����մϴ�.");
			f.chk.select();
			return false;
		}
		//�̸���
		
		
		var vemail = /^[A-Za-z0-9]{4,12}$/;
		var cemail = f.umail1.value;
		if (cemail == "") {
			alert("�̸����� ������ �� �����ϴ�.");
			f.umail1.select();
			return false;
		}
		if (!vemail.test(cemail)) {
			alert("�̸����� �����ڿ� ���� 4~12�ڸ��� �Է��ؾ��մϴ�.");
			f.umail1.select();
			return false;
		}
		var cemail2 = f.umail2.value;
		if (cemail2 == "") {
			alert("�����ּҸ� �������ּ���.");
			f.umail2.select();
			return false;
		}
		var umail1 = $('#umail1').val();
		var umail2 = $('#umail2').val();
		var umail = umail1 + '@' + umail2;
		$('#umail1').val(umail);		
		
		f.submit();
}
*/	

</script>
<title>ȸ������</title>
</head>
<body>

	<form name="form" action="loginnsave" method="post" name = "form">
		<table align="center">
	
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="userid" id="userid">
					<button type="button" id="idCheck" value="N" onclick="idCheck();">�ߺ�üũ</button>
				</td>
			</tr>
			<tr>
				<th>�н�����</th>
				<td><input type="password" name="userpw" id="userpw" style="margin-right: 59px;"></td>
			</tr>
			<tr>
				<th>�н����� Ȯ��</th>
				<td><input type="password" name="userpw2" id="userpw2" style="margin-right: 59px;"></td>
			</tr>
				<tr>
				<th>�г���</th>
				<td><input type="text" name="uname" id="uname" style="margin-right: 59px;"></td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td><input type="text" name="umail1" id="umail1">@
				<select name="umail2" id="uamil2" title="�̸��� �ּ� ����" onchange="selectEmail(this)">
						<option value="1">�����Է�</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
				</select> <input type="hidden" name="uemail"></td>
			</tr>
			<tr>
				<th>����ó</th>
				<td><input type="text" name="umobile"
					placeholder="ex) 010-1234-5678" style="margin-right: 59px;"></td>
			</tr>
			<tr>
			<th>�����ȣ1</th>
			<td><input type="text" name="uzlpcode1" style="margin-right: 59px;"></td>
			</tr>
				<tr>
			<th>�ּ�1</th>
			<td><input type="text" name="uaddress1" style="margin-right: 59px;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="submit" id="signup_btn" name="signup_btn">ȸ������</button>
			</tr>
		</table>
	</form>
</body>
</html>