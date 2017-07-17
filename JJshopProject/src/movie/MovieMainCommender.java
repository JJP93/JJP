package movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.MovieInfoDao;
import movie.MovieInfoDto;

public class MovieMainCommender implements CommandIf{
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		MovieInfoDto dto = new MovieInfoDto();
		MovieInfoDao dao = new MovieInfoDao();
		
		String id = req.getParameter("mvnum");
		try {
			dto = dao.getMVList(id);
			req.setAttribute("mv", dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "movie/movieMain.jsp?mvnum="+id;
	}
}
