package com.mvc.action.memberclient;

import javax.servlet.http.*;

import com.baemin.member.MemberDAO;
import com.baemin.member.MemberDTO;
import com.mvc.action.CommandAction;

public class UpdateClientFormAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - UpdateClientFormAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        HttpSession session = request.getSession();
		Object no_ob = session.getAttribute("no");
		int no = Integer.parseInt(no_ob + "");
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getDTO(no);
        //
		request.setAttribute("dto", dto);
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/memberClient/UpdateClientForm.jsp";
    }

}
