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
	</form>
</body>
</html>