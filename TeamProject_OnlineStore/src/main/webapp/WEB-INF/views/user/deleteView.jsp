<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
		$(document).ready(function(){
		
			$("#deletee").on("click", function(){
				
				if($("#userpw").val()==""){
					alert("��й�ȣ�� �Է����ּ���");
					$("#userpw").focus();
					return false
				}
				
				if($("#userpw2").val()==""){
					alert("��й�ȣ Ȯ���� �Է����ּ���");
					$("#userpw2").focus();
					return false
				}
				
				if(confirm("Ż���Ͻðڽ��ϱ�?")){
					   document.deleteForm.submit();
					}
			});
		})
	</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="delete" method="post" id="deleteForm" name="deleteForm">
                       <input type="hidden" id="userid" name="userid" value="${login.userid}">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">ȸ��Ż�� �Ϸ��� ��й�ȣ�� �Է����ּ���.</p>
                <div class="form-group">
                    <input type="password" id = "userpw" name="userpw" class="form-control form-control-inline text-center" placeholder="��й�ȣ" />
                </div>
                <div class="form-group">
                    <input type="password" id="userpw2" name="userpw2"  class="form-control form-control-inline text-center" placeholder="��й�ȣ Ȯ��" />
                </div>
                <button type="button" id="deletee" name="delete" class="btn btn-primary">ȸ��Ż��</button> <a href="home" class="btn btn-default">���</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>