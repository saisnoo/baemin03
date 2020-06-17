package com.mvc.action.joinClient;

import javax.servlet.http.*;

import com.baemin.member.MemberDAO;
import com.baemin.member.MemberDTO;
import com.mvc.action.CommandAction;

public class JoinClientProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - JoinClientProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        String id = request.getParameter("id").trim();
    	String pw = request.getParameter("pw").trim();
    	String name = request.getParameter("name").trim();

    	String tel1 = request.getParameter("tel1").trim();
    	String tel2 = request.getParameter("tel2").trim();
    	String tel3 = request.getParameter("tel3").trim();

    	String tel = tel1 + "-" + tel2 + "-" + tel3;

    	String addr = request.getParameter("addr").trim();
    	String addr2 = request.getParameter("addr2").trim();

    	String memberX_ = request.getParameter("memberX").trim();
    	String memberY_ = request.getParameter("memberY").trim();

    	double memberX = Double.parseDouble(memberX_);
    	double memberY = Double.parseDouble(memberY_);

    	System.out.println("id=" + id);
    	System.out.println("pw=" + pw);
    	System.out.println("name=" + name);
    	System.out.println("tel=" + tel);
    	System.out.println("addr=" + addr);
    	System.out.println("addr2=" + addr2);
    	System.out.println("memberX=" + memberX);
    	System.out.println("memberY=" + memberY);

    	MemberDTO dto = new MemberDTO();

    	dto.setId(id);
    	dto.setPw(pw);
    	dto.setName(name);
    	dto.setTel(tel);
    	dto.setAddr(addr);
    	dto.setAddr2(addr2);
    	dto.setMemberX(memberX);
    	dto.setMemberY(memberY);

    	MemberDAO dao = MemberDAO.getInstance();
    	int result = dao.insertMember(dto);
        //
    	request.setAttribute("result", result);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/joinClient/JoinClientPro.jsp";
    }

}
