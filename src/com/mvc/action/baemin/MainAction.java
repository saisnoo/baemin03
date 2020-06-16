package com.mvc.action.baemin;

import javax.servlet.http.*;
import com.baemin.member.*;
import com.mvc.action.CommandAction;

public class MainAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - MainAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();
        Object no_ob = session.getAttribute("no");

        int memberNo = Integer.parseInt(no_ob + "");

        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO dto = dao.getDTO(memberNo);

        request.setAttribute("dto", dto);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/Main.jsp";
    }

}
