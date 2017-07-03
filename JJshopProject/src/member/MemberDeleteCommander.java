package member;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MemberDao.MemberDao;


public class MemberDeleteCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		String[] idcheck = req.getParameterValues("rowcheck");
		MemberDao dao = new MemberDao();
	

		try {
			for(int i =0; i<idcheck.length; i++){
				System.out.println(idcheck[i]+"È¸¿ø Å»Åð...");
				dao.memberDelete(idcheck[i]);
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return "member/memberManagement.jsp";
	}

}
