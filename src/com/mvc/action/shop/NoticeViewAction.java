package com.mvc.action.shop;

import javax.servlet.http.*;

import com.baemin.notice.NoticeDAO;
import com.baemin.notice.NoticeDTO;
import com.mvc.action.CommandAction;

public class NoticeViewAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - NoticeViewAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

    	request.setCharacterEncoding("UTF-8");
    	System.out.println("------ NoticeView.jsp --- ");

    	int no = Integer.parseInt(request.getParameter("no"));
    	NoticeDAO dao = NoticeDAO.getInstance();
    	NoticeDTO dto = dao.viewNotice(no);
    	System.out.println(dto.toString());
    	
    	request.setAttribute("dto", dto);
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/NoticeView.jsp";
    }

}
