package mvReserve;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/mvReserve/InitCommander")
public class InitCommander extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MvReDAO dao = new MvReDAO();
		dao.init();
		
		response.setContentType("text/html; charset=euc-kr"); //한글이 인코딩
		   PrintWriter out = response.getWriter(); //선언
		   
		   String str="";
		   str = "<script language='javascript'>";
		   str += "history.go(-1)";  //오프너 새로고침
		 
		    str += "</script>";
		   out.print(str);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	

	

}

