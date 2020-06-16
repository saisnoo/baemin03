package com.mvc.action.shop;

import javax.servlet.http.*;

import com.baemin.orderlist.OrderListDAO;
import com.mvc.action.CommandAction;

public class MainAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - MainAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();
        Object no = session.getAttribute("no");
        int shopNo = Integer.parseInt(no + "");
        request.setCharacterEncoding("UTF-8");
        System.out.println("------ Main.jsp --- ");
        OrderListDAO orderlistdao = OrderListDAO.getInstance();
        int max_no = orderlistdao.getMaxNoOfShop_No(shopNo);
        
        request.setAttribute("max_no", new Integer(max_no));
        request.setAttribute("shopNo", new Integer(shopNo));
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/Main.jsp";
    }

}
