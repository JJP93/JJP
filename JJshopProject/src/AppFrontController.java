import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AppFrontController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
													throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=EUC-KR");
		req.setCharacterEncoding("EUC-KR");
		
		String uri = req.getRequestURI();			//전체경로
		String path = req.getContextPath();		//시작경로
		String cmd = uri.substring(path.length()); //구하고자 하는 이름
		String nextPage = null;
		
		if (cmd.equals("/member.app")){
			nextPage = "member_index.member";	//servlet페이지로 이동
		}else if (cmd.equals("/loginForm.app")){
			nextPage = "loginForm.member";							//실제페이지로 이동
		}else if (cmd.equals("/board.app")){
			nextPage = "list.board";						//servlet페이지로 이동
		}else if (cmd.equals("/join.app")){
			nextPage = "join.member";						//servlet페이지로 이동
		}else if (cmd.equals("/joinForm.app")){
			nextPage = "joinForm.member";						//servlet페이지로 이동
		}else if (cmd.equals("/logoutAction.app")){
			nextPage = "logout.member";						//servlet페이지로 이동
		}else if (cmd.equals("/login.app")){
			nextPage = "login.member";						//servlet페이지로 이동
		}else if (cmd.equals("/loginsuccess.app")){
			nextPage = "loginsuccess.member";						//servlet페이지로 이동
		}else if (cmd.equals("/memberManagement.app")){
			nextPage = "memberManagement.member";						//servlet페이지로 이동
		}else if (cmd.equals("/memberDelete.app")){
			nextPage = "memberDelete.member";						//servlet페이지로 이동
		}else if (cmd.equals("/shopMain.app")){
			nextPage = "shopMain.shop";						//servlet페이지로 이동
		}else if (cmd.equals("/pdJoinView.app")){
			nextPage = "pdJoinView.shop";						//servlet페이지로 이동
		}else if (cmd.equals("/pdJoin.app")){
			nextPage = "pdJoin.shop";						//servlet페이지로 이동
		}else if (cmd.equals("/order.app")){
			nextPage = "orderInsert.order";						//servlet페이지로 이동
		}else if (cmd.equals("/shop.app")){
			nextPage = "shop.shop";						//servlet페이지로 이동
		}else if (cmd.equals("/orderlist.app")){
			nextPage = "orderlist.order";						//servlet페이지로 이동
		}else if (cmd.equals("/orderManagement.app")){
			nextPage = "orderManagement.order";						//servlet페이지로 이동
		}else if (cmd.equals("/order_delete.app")){
			nextPage = "order_delete.order";						//servlet페이지로 이동
		}else if (cmd.equals("/movieList.app")){
			nextPage = "list.movie";						//servlet페이지로 이동
		}else if (cmd.equals("/addMovie.app")){
			nextPage = "addMovie.movie";						//servlet페이지로 이동
		}else if (cmd.equals("/addMovieView.app")){
			nextPage = "addMovieView.movie";						//servlet페이지로 이동
		}else if (cmd.equals("/movieMain.app")){
			nextPage = "main.movie";						//servlet페이지로 이동
		}else if (cmd.equals("/mvrelist.app")){
			nextPage = "mvrelist.mvReserve";
		}
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
	
}











