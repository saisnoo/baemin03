package com.mvc.action.shop;

import javax.servlet.http.*;

import com.baemin.menu.MenuDAO;
import com.mvc.action.CommandAction;

public class MenuStatusProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - MenuStatusProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        int no = Integer.parseInt(request.getParameter("menuno"));
        int menuStatus = Integer.parseInt(request.getParameter("menustatus"));

        System.out.println("menustatuspro:"+no);
        System.out.println("menustatuspro:"+menuStatus);
        MenuDAO dao=MenuDAO.getInstance();
        int result=dao.updateStatus(no,menuStatus);

        request.setAttribute("result",new Integer(result));
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/MenuStatusPro.jsp";
    }

}
