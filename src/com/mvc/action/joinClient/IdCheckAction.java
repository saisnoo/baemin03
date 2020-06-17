package com.mvc.action.joinClient;

import javax.servlet.http.*;

import com.baemin.member.MemberDAO;
import com.mvc.action.CommandAction;

public class IdCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");
		System.out.println("- - - - IdCheckAction - - - - ");
		// /////////////// 이 아래에 내용 넣으세요 /////////////////////////
		String id = request.getParameter("id");

		System.out.println("id=" + id);

		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.idCheck(id);
		
		System.out.println("result=" + result);
		//
		request.setAttribute("result", result);
		// /////////////// 이 위에 내용 넣으세요 /////////////////////////
		return "/joinClient/IdCheck.jsp";
	}

}
