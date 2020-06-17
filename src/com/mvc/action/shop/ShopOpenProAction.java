package com.mvc.action.shop;

import javax.servlet.http.*;

import com.baemin.shop.ShopDAO;
import com.mvc.action.CommandAction;

public class ShopOpenProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ShopOpenProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        System.out.println("------CancelOrderPro.jsp");
        int no = Integer.parseInt(request.getParameter("shopNo"));
        int status = Integer.parseInt(request.getParameter("shopstatus"));
        System.out.println("openpro_no = " + no);
        System.out.println("openpro_status = " + status);
        int result=0;
        ShopDAO shopdao=ShopDAO.getInstance();
        if(status==0){
        result = shopdao.shopOpen(no);
        }
        if(status==1){
        result = shopdao.magam(no); 
        }
        request.setAttribute("result",new Integer(result));

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/ShopOpenPro.jsp";
    }

}
