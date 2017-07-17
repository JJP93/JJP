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
	
		try {
			ArrayList<MovieInfoDto> dto = (ArrayList<MovieInfoDto>) dao.moveListAll();
			System.out.println("µÎ¹øÂ° : " +dto.get(2).getMvNum());
			req.setAttribute("mvlist", dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return "movie/movieList.jsp";
	}

}
