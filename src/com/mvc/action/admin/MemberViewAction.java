package com.mvc.action.admin;

import javax.servlet.http.*;

import com.baemin.member.MemberDAO;
import com.baemin.member.MemberDTO;
import com.mvc.action.CommandAction;

public class MemberViewAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - MemberViewAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        
        request.setCharacterEncoding("utf-8");
        int memberNo = Integer.parseInt(request.getParameter("memberNo"));

        MemberDAO dao=MemberDAO.getInstance();
        MemberDTO dto=dao.getDTO(memberNo);
        request.setAttribute("dto", dto);        

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/admin/MemberView.jsp";
    }

}
