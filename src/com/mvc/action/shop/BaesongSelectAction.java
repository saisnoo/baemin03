package com.mvc.action.shop;

import javax.servlet.http.*;

import com.baemin.orderlist.OrderListDAO;
import com.mvc.action.CommandAction;

public class BaesongSelectAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - BaesongSelectAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        int no = Integer.parseInt(request.getParameter("no"));
        OrderListDAO dao = OrderListDAO.getInstance();
        int result = dao.updateStatusTo2(no);
        
        request.setAttribute("result",new Integer(result));
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/BaesongSelect.jsp";
    }

}
