package board;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Criteria;
import util.PageMaker;

public class ListCommand implements CommandIf{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setCharacterEncoding("UTF-8");
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			int perPageNum = Integer.parseInt(req.getParameter("perPageNum"));
			Criteria cri = new Criteria();
			BoardDataBean dao = new BoardDataBean();
			cri.setPage(pageNum);
			cri.setPerPageNum(perPageNum);
			List<BoardDBBean> list = dao.listBoard(cri);
			req.setAttribute("boardList", list);
			
			int totalCount = dao.totalBoard();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(totalCount);
			req.setAttribute("pageMaker", pageMaker);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		return "board/list.jsp";
	}

}
