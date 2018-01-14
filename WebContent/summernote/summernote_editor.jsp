<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta charset="uft-8" />
	<title>summernote</title>
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="./dist/summernote.css" rel="stylesheet">
	<script src="./dist/summernote.js"></script>
	<script type="text/javascript">
	 	function sendFile(file, editor) {
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	   $.ajax({
	 	        data : data,
	 	        type : "POST",
	 	        url : "./summernote_imageUpload.jsp",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) {
	 	        	$(editor).summernote('editor.insertImage', data.url);
	 	        }
	 	    });
	 	}
	</script>
</head>
<body>
	<h1>summernote</h1>
	<form name="editorForm" action="./summernote_editor.jsp" method="post">
		<table style="width:1000px;">
			<colgroup>
				<col width="10%" />
				<col width="90%" />
			</colgroup>
			<tbody>
				<tr style="height:30px;">
					<th style="text-align:center;">제목</th>
					<td><input type="text" name="" id="" style="width:100%;" /></td>
				</tr>
				<tr>
					<th style="text-align:center;">내용</th>
					<td>
						<textarea id="summernote">Hello Summernote</textarea>
						<script>
							$(document).ready(function() {
								$('#summernote').summernote({
									height: 400,
									callbacks: {
						          		onImageUpload: function(files, editor, welEditable) {
						              		sendFile(files[0], this);
						          		}
					        		}
								});
							});
						</script>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<img id="imgTest" src="/upload/3-221.jpg" />
</body>
</html>