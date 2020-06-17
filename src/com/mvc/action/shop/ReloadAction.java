package com.mvc.action.shop;

import javax.servlet.http.*;

import com.baemin.orderlist.OrderListDAO;
import com.mvc.action.CommandAction;

public class ReloadAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ReloadAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        
        HttpSession session = ((HttpServletRequest) request).getSession();
        Object no=session.getAttribute("no");
        int shopNo=Integer.parseInt(no+""); 
        OrderListDAO orderlistdao=OrderListDAO.getInstance();
        int result = orderlistdao.getMaxNoOfShop_No(shopNo);
        System.out.println("reload = >"+result);
        
        request.setAttribute("result",new Integer(result));
        request.setAttribute("shopNo",new Integer(shopNo));
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/Reload.jsp";
    }

}
