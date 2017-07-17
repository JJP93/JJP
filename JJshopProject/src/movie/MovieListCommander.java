package movie;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieListCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		MovieInfoDao dao = new MovieInfoDao();
	List<MovieInfoDto> dto;
		try {
			dto = dao.moveListAll();
			System.out.println("ss");
			req.setAttribute("mvlist", dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return "movie/movieList.jsp";
	}

}
