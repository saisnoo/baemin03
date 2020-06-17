package com.mvc.action.admin;

import javax.servlet.http.*;

import com.baemin.notice.NoticeDAO;
import com.mvc.action.CommandAction;

public class NoticeDeleteProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - NoticeDeleteProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        
        //자바 구문
        request.setCharacterEncoding("UTF-8");
        System.out.println("------NoticeDeletePro.jsp");

        int no=Integer.parseInt(request.getParameter("no"));
    
        NoticeDAO dao=NoticeDAO.getInstance();
  
        int result = dao.deleteNotice(no);
  
        System.out.println(result);
//      response.sendRedirect("NoticeList.jsp");     

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/admin/NoticeDeletePro.jsp";
    }

}
