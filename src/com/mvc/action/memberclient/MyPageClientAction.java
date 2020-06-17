package com.mvc.action.memberclient;

import javax.servlet.http.*;
import com.baemin.member.*;
import com.mvc.action.CommandAction;

public class MyPageClientAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - MyPageClientAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        HttpSession session = request.getSession();//getSession() 메소드 호출
        
		Object no_ob = session.getAttribute("no");
		int no = Integer.parseInt(no_ob + "");
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getDTO(no);
        //
		request.setAttribute("dto", dto);
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/memberClient/MyPageClient.jsp";
    }

}
