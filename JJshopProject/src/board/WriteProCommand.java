package board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class WriteProCommand implements CommandIf{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		
		MultipartRequest mr = null;
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("board/files");
		int len = 10*1024*1024;
		try{
			req.setCharacterEncoding("utf-8");
			mr = new MultipartRequest(req, upPath, len, "utf-8");
			//mr객체가 만들어지면, 파일업로드 성공!!, 객체 실패시 IOException 발생!!
		}catch(IOException e){
			System.err.println("파일 업로드 중 실패!!");
		}
		BoardDBBean dto = new BoardDBBean();
		BoardDataBean dao = new BoardDataBean();
		
		
		if(mr.getParameter("re_level").equals("0")){
			dto.setRe_level(Integer.parseInt(dao.maxNum()));
		}else if(!mr.getParameter("re_level").equals("0")){
			dto.setRe_level(Integer.parseInt(mr.getParameter("re_level"))); //그룸 아이디
		}
	

		if(mr.getParameter("re_renum").equals("new")){
			dto.setRe_renum(0);
			System.out.println("no실행"+mr.getParameter("re_renum"));
		}else if(!mr.getParameter("re_renum").equals("new")){
			int rss = Integer.parseInt(mr.getParameter("re_renum"));
			System.out.println("aaat실행"+Integer.parseInt(mr.getParameter("re_renum")));
			dto.setRe_renum(Integer.parseInt(mr.getParameter("re_renum"))); //한 그룹안에서의 숫자 아이디
		}
		
	
		
		
		
		
		if(mr.getParameter("re_step").equals("0")){
			dto.setRe_step(Integer.parseInt(mr.getParameter("re_step")));  //답글 수만큼 들여쓰기

		}else if(!mr.getParameter("re_step").equals("0")){
			dto.setRe_step(Integer.parseInt(mr.getParameter("re_step"))+1);  //답글 수만큼 들여쓰기
		}
		
		
		
		dto.setWriter(mr.getParameter("writer"));
		dto.setEmail(mr.getParameter("email"));
		dto.setSubject(mr.getParameter("subject"));
		dto.setContent(mr.getParameter("content"));
		dto.setPasswd(mr.getParameter("passwd"));
		dto.setIp(req.getRemoteAddr());
		dto.setFilename(mr.getFilesystemName("filename"));
		int filesize = 0;
		File file = mr.getFile("filename");
		if (file != null){
			filesize = (int)file.length();
		}
		dto.setFilesize(filesize);
		
		
		int res = 0;
		if(mr.getParameter("re_level").equals("0") ){
			res = dao.insertBoard(dto);
			System.out.println("일반추가");
		}else if( !mr.getParameter("re_level").equals("0")){
			res=dao.replyBoard(dto);
			System.out.println("리플추가");

		}
		String msg = null, url = null;
		if (res>0){
			msg = "게시글 등록 성공!! 글목록페이지로 이동합니다";
			url = "board.app?pageNum=1&perPageNum=10";
		}else {
			msg = "게시글 등록 실패!! 글등록페이지로 이동합니다.";
			url = "write_form.board";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}










