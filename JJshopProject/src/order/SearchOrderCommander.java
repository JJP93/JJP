package order;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchOrderCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html;charset=UTF-8");
			OrderDAO dao = new OrderDAO();
			OrderDTO dto = new OrderDTO();
			ArrayList<OrderDTO> dtos = new ArrayList<OrderDTO>();
			String search = (String)req.getParameter("search");
			String searchList = req.getParameter("searchList");
			
			dtos = dao.getOrderSearch(search, searchList);
			
			req.setAttribute("vv", dtos);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return "order/searchResult.jsp";
	}

}
