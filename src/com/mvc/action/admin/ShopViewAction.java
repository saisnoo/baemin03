package com.mvc.action.admin;

import javax.servlet.http.*;

import com.baemin.shop.ShopDAO;
import com.baemin.shop.ShopDTO;
import com.mvc.action.CommandAction;

public class ShopViewAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ShopViewAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        // 


        request.setCharacterEncoding("utf-8");
        
        int shopNo = Integer.parseInt(request.getParameter("shopNo"));
        
        ShopDAO dao=ShopDAO.getInstance();
        ShopDTO dto=dao.getShopInfo(shopNo);
        request.setAttribute("dto", dto);
        System.out.println(dto.toString());


        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/admin/ShopView.jsp";
    }

}
