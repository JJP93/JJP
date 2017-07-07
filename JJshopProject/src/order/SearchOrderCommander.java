package order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchOrderCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = new OrderDTO();
		ArrayList<OrderDTO> dtos = new ArrayList<OrderDTO>();
		String search = req.getParameter("search");
		String searchList = req.getParameter("searchList");
		
		dtos = dao.getOrderSearch(search, searchList);
		
		req.setAttribute("vv", dtos);
		
		
		return "order/searchResult.jsp";
	}

}
