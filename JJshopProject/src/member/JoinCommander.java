package member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MemberDao.MemberDao;

public class JoinCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		String viewpage = null;
		try {
			req.setCharacterEncoding("utf-8");
			
			
				String name = req.getParameter("name");
				String id = req.getParameter("id");
				String password = req.getParameter("password");
				String Email = req.getParameter("Email");
				String gender = req.getParameter("gender");
				String addr = req.getParameter("addr");
				
				String ck = req.getParameter("checkuse");
				MemberDao dao = new MemberDao();
				
				String a = dao.idCheck(id);
				if(a.equals("1")){
					dao.join(name, id, password,Email,gender,addr);
					
					resp.setContentType("text/html; charset=UTF-8");
					
				viewpage = "member/joinSuccess.jsp";
				}
				else if(a.equals("2")){
					resp.setContentType("text/html; charset=UTF-8");
					PrintWriter out = resp.getWriter();
					out.println("<script>alert('가입 실패'); history.go(-1);</script>");
					out.flush();
					
				}else{
					viewpage = "/index.jsp";

				}
				
			
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewpage;
	}

}
