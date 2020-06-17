package com.mvc.action.memberclient;

import javax.servlet.http.*;

import com.baemin.member.MemberDAO;
import com.baemin.member.MemberDTO;
import com.mvc.action.CommandAction;

public class UpdateClientProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - UpdateClientProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        HttpSession session = request.getSession();
        
        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO dto = new MemberDTO();

        int no = Integer.parseInt(session.getAttribute("no")+"");
        String tel = request.getParameter("tel");
        String pw = request.getParameter("password");

        System.out.println("no :" + no);
        System.out.println("tel :" + tel);
        System.out.println("pw :" + pw);

        dto.setNo(no);
        dto.setTel(tel);
        dto.setPw(pw);

        int result = dao.changeInfo(dto);
        //
        request.setAttribute("result", result);
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/memberClient/UpdateClientPro.jsp";
    }

}
