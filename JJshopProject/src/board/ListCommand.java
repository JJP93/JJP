package board;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;

public class ListCommand implements CommandIf{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setCharacterEncoding("UTF-8");
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			int perPageNum = Integer.parseInt(req.getParameter("perPageNum"));
			Paging pg = new Paging();
			pg.setStartRow(pageNum, perPageNum);
			int startData = pg.getStartRow();
			BoardDataBean dao = new BoardDataBean();
			List<BoardDBBean> list = dao.listBoard(startData, perPageNum);
			req.setAttribute("boardList", list);
	

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		return "board/list.jsp";
	}

}
