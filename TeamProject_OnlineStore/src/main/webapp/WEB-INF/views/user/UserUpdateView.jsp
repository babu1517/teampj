<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#mar {
  margin: 0 auto;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<section id= mar>
<form action="UserUpdate" method="post">

<table>

<label class="control-label" for="userpw">��й�ȣ</label>
<input  type="password" id="userpw" name="userpw"/> <br>

<label class="control-label" for="uname">�г���</label>
<input  type="text" id="uname" name="uname"/> <br>

<label class="control-label" for="uzlpcode1">�����ȣ1</label>
<input  type="text" id="uzlpcode1" name="uzlpcode1"/>

<label class="control-label" for="uaddress1">�ּ�1</label>
<input type="text" id="uaddress1" name="uaddress1"/> <br>


<label class="control-label" for="uzlpcode2">�����ȣ2</label>
<input type="text" id="uzlpcode2" name="uzlpcode2"/>

<label class="control-label" for="uaddress2">�ּ�2</label>
<input type="text" id="uaddress2" name="uaddress2"/> <br>


<label class="control-label" for="uzlpcode3">�����ȣ3</label>
<input  type="text" id="uzlpcode3" name="uzlpcode3"/>


<label class="control-label" for="uaddress3">�ּ�3</label>
<input type="text" id="uaddress3" name="uaddress3"/> <br>


<label class="control-label" for="uemail">�̸���</label>
<input type="text" name="umail1" id="umail1">@
				<select name="umail2" id="uamil2" title="�̸��� �ּ� ����" onchange="selectEmail(this)">
						<option value="1">�����Է�</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
				</select> <br>


<label class="control-label" for="umobile">��ȭ��ȣ</label>
<input type="text" id="umoblie" name="umobile"/> <br>



<button class="btn btn-success" type="submit" id="submit">ȸ����������</button>
<button class="cencle btn btn-danger" type="button">���</button>
</table>
</form>

</section>
</body>
</html>