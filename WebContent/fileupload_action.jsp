<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uploadPath = "D:/08_Develop/reference/WYSIWYG_EDITOR_FILEUPLOAD/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WYSIWYG_EDITOR_FILEUPLOAD/upload";
	//String uploadPath = request.getRealPath("upload"); // 업로드할 경로
	int size = 10 * 1024 * 1024; // 업로드 사이즈 제한 10M 이하
	
	
	String subject = "";
	String fileName = "";
	
	try{
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement(); 
		fileName = multi.getFilesystemName(file); 
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	String imageName = fileName;
%>
<html>
	<body>
		이미지 : <%=imageName %><br />
		<img src="./upload/<%=imageName %>" /><br />
		<a href="./fileupload_form.jsp?imageName=<%=imageName %>">뒤로가기</a>
	</body>
</html>
