package com.mvc.action.shop;

import javax.servlet.http.*;

import com.baemin.orderlist.OrderListDAO;
import com.mvc.action.CommandAction;

public class CheckOrderProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - CheckOrderProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        request.setCharacterEncoding("UTF-8");
        System.out.println("------CheckOrderPro.jsp");
        int no = Integer.parseInt(request.getParameter("no"));
        int minute = Integer.parseInt(request.getParameter("minute"));
        OrderListDAO dao = OrderListDAO.getInstance();
        int result = dao.updateStatusTo1(no, minute);
        
        request.setAttribute("result",new Integer(result));
         ///////////////// 이 위에 내용 넣으세요 /////////////////////////
          return "/shop/CheckOrderPro.jsp";
    }

}
