<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%! 
    int x=0, y=0,z=0,w=0;
    
%>

  


<%

String s = request.getParameter("author");
if(s==null){
	out.print("Please Select One Option ");
	response.sendRedirect("index.html");
}

else{
	//System.out.print("s" +" " + s);
	try{
	Class.forName("com.mysql.jdbc.Driver");
	//Step 1: Allocate a database Connection object
	Connection conn = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/test", "root", "root");

	//Step 2: Allocate a Statement object within the Connection
	String query1 = "Select * from Author"; 

	PreparedStatement preparedStmt1 = conn.prepareStatement(query1);
	ResultSet   re =  preparedStmt1.executeQuery();
	while(re.next()){
		 x =  re.getInt(1);
		 y =  re.getInt(2);
	     z =  re.getInt(3);
		 w =  re.getInt(4);
		
	}

if("Miguel_de_Cervantes".equals(s)){
	int  m = 0;
	 m=m+1;
	x = x+m;
	//System.out.print("m" +" " + m);
}
else if("charles_DicKens".equals(s)){
	int c=0;
	c=c+1;
	y = y+c;
	//System.out.print("c" +" " +c);
}

else if("JRR_Tolkien".equals(s)){
   int j =0;
   j=j+1;	
   z = z+j;
   //System.out.print("j" +" " +j);
}

else if("Antoine_de_Saint_Exuper".equals(s)){
	int a =0;
	a =a+1;
	w = w+a;
	//System.out.print("a" +" " +a);
}


out.println("votes for Miguel de Cervantes" +" "+ x);out.print("<br/>");out.print("<br/>");
out.println("votes for charles DicKens" +"  " + y);out.print("<br/>");out.print("<br/>");
out.println("votes for J.R.R. Tolkien" +"  " + z);out.print("<br/>");out.print("<br/>");
out.println("votes for Antoine de Saint-Exuper" +"  " + w);out.print("<br/>");out.print("<br/>");



		
String query = " insert into Author(Miguel_de_Cervantes, charles_DicKens, JRR_Tolkien, Antoine_de_Saint_Exuper)"
        + " values (?, ?, ?,?)";

PreparedStatement preparedStmt = conn.prepareStatement(query);
preparedStmt.setInt(1, x);
preparedStmt.setInt(2, y);
preparedStmt.setInt(3,z);
preparedStmt.setInt(4, w);
preparedStmt.execute();
  
conn.close();
}
catch(Exception E){
	System.out.print(E);
}
}
%>
</body>
</html>