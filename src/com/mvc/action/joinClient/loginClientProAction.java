package com.mvc.action.joinClient;

import javax.servlet.http.*;
import com.baemin.member.*;
import com.mvc.action.CommandAction;

public class LoginClientProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");
		System.out.println("- - - - LoginClientProAction - - - - ");
		// /////////////// 이 아래에 내용 넣으세요 /////////////////////////

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("id=" + id);
		System.out.println("pw=" + pw);

		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.login(id, pw);

		System.out.println(dto.toString());

		int no = dto.getNo();

		System.out.println("no=" + no);

		HttpSession session = ((HttpServletRequest) request).getSession();

		if (no > 0) {
			System.out.println(" !!! member id=" + id);
			session.setAttribute("no", no);
			session.setAttribute("id", dto.getId());
			session.setAttribute("grade", dto.getGrade());
			session.setAttribute("memberX", dto.getMemberX());
			session.setAttribute("memberY", dto.getMemberY());
			request.setAttribute("result", 1111111111);
		} else {
			System.out.println(" !!! member null");
			request.setAttribute("result", -1);
		}
		// /////////////// 이 위에 내용 넣으세요 /////////////////////////
		return "/joinClient/LoginClientPro.jsp";

	}
}
