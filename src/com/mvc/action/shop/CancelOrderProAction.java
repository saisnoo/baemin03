package com.mvc.action.shop;

import javax.servlet.http.*;

import com.baemin.orderlist.OrderListDAO;
import com.mvc.action.CommandAction;

public class CancelOrderProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - CancelOrderProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

      //자바 구문
      request.setCharacterEncoding("UTF-8");
      System.out.println("------CancelOrderPro.jsp");
      int no = Integer.parseInt(request.getParameter("no"));
      String whyCancel = request.getParameter("whyCancel");
      System.out.println("no: "+no+" why : "+whyCancel);
      OrderListDAO dao = OrderListDAO.getInstance();
      int result = dao.orderCancel(no, whyCancel);
      System.out.println(" result :"+result);

      request.setAttribute("result",new Integer(result));
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
      return "/shop/CancelOrderPro.jsp";
    }

}
