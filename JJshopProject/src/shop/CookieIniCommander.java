package shop;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieIniCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		Cookie[] c = req.getCookies();
		
		if(c != null){
			for(int i = 0; i < c.length; i++){
				c[i].setMaxAge(0);
				resp.addCookie(c[i]);
			}
			
		}
		
		

		
		return "index.jsp";
	}

}
