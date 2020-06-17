package com.mvc.action.admin;

import javax.servlet.http.*;

import com.baemin.notice.NoticeDAO;
import com.baemin.notice.NoticeDTO;
import com.mvc.action.CommandAction;

public class NoticeInputProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - NoticeInputProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////        
     
        request.setCharacterEncoding("utf-8");
        System.out.println("------NoticeInputPro.jsp");
        
//        <jsp:useBean id="dto" class="com.baemin.notice.NoticeDTO">
//          <jsp:setProperty name="dto" property="*" />
//        </jsp:useBean>
        NoticeDTO dto = new NoticeDTO();
        
        dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setStartDate(request.getParameter("startDate"));
		dto.setEndDate(request.getParameter("endDate"));
		
        NoticeDAO dao=NoticeDAO.getInstance();
        dao.writeNotice(dto);
        //response.sendRedirect("NoticeList.jsp");        

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/admin/NoticeInputPro.jsp";
    }

}
