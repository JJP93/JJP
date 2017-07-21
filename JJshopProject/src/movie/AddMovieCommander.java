package movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddMovieCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		
		
		try {
			req.setCharacterEncoding("UTF-8");

			String mvName = req.getParameter("mvName");
			String mvArea = req.getParameter("mvArea");
			String mvTime = req.getParameter("mvTime");
			String mvDir = req.getParameter("mvDir");
			String mvG = req.getParameter("mvG");
			String mvAc = req.getParameter("mvAc");
			String mvImg  = req.getParameter("mvImg");
			String mvDate = req.getParameter("mvDate");
			String mvSeat = req.getParameter("mvSeat");

			
			MovieInfoDao dao = new MovieInfoDao();
			
			
			MovieInfoDto dto = new MovieInfoDto(mvName, mvArea, mvTime, mvDir, mvG, mvAc, mvImg, mvDate, mvSeat);
			System.out.println(dto.getMvImg());
		dao.addMovie(dto);
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "mvindex.jsp";
	}

}
