<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%
 int pagePerCnt = 30; 
 int pageNo = Integer.parseInt(request.getParameter("pageNo"));
 int offSet = pageNo * pagePerCnt;
 
 System.out.println("pageNo=" + pageNo);
 
List<Map<String, String>> list = new ArrayList<Map<String, String>>(); //dao.getList(offset, pagePerCnt);
for(int i = 0; i < pagePerCnt ; i++){
	Map<String, String> data = new HashMap<String, String>();
	data.put("cardSeq",""+i);
	data.put("imgSrc","http://naver.github.io/egjs-experiment/infiniteGridService/demo/img/" + (((offSet + i) % 60) + 1) + ".jpg");
	data.put("imgProfile","images/profile00.png");
	data.put("postTitle","포스트제목");
	data.put("postDesc","포스트내용요약");
	data.put("imgHanger","images/hanger_red_white.png");
	list.add(data);
}

String retJsonStr = "[";
for (int i = 0; i < list.size(); i++) {
	Map<String, String> data = list.get(i);
	
	retJsonStr += "{";
	retJsonStr += "\"cardSeq\": \"" + data.get("cardSeq")  +"\",";
	retJsonStr += "\"imgSrc\": \"" + data.get("imgSrc")  +"\",";
	retJsonStr += "\"imgHanger\" : \"" + data.get("imgHanger")  +"\",";	
	retJsonStr += "\"imgProfile\": \"" + data.get("imgProfile")  +"\",";
	retJsonStr += "\"postTitle\" : \"" + data.get("postTitle")  +"\",";
	retJsonStr += "\"postDesc\" : \"" + data.get("postDesc")  +"\"}";
	if ( i < (list.size()-1) ) {
		retJsonStr += ",";
	}
}
retJsonStr += "]";

%>
<%= retJsonStr %>