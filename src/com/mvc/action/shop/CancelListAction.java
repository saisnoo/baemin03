package com.mvc.action.shop;

import java.util.List;

import javax.servlet.http.*;

import com.baemin.orderlist.OrderListDAO;
import com.baemin.orderlist.OrderListDTO;
import com.mvc.action.CommandAction;

public class CancelListAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - CancelListAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

      //자바 구문
      request.setCharacterEncoding("UTF-8");
      System.out.println("------CancelList.jsp");

      HttpSession session = ((HttpServletRequest) request).getSession();
      Object no=session.getAttribute("no");
      System.out.println(no);
      int shopNo=Integer.parseInt(no+""); 
      System.out.println(request.getParameter("shopNo"));
      OrderListDAO dao= OrderListDAO.getInstance();

      List<OrderListDTO> orderList = dao.getListOfCancel(shopNo);
      System.out.println(shopNo);
      
      request.setAttribute("orderList", orderList);
      request.setAttribute("shopNo",new Integer(shopNo));

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/CancelList.jsp";
    }

}
