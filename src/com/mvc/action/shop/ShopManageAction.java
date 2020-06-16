package com.mvc.action.shop;

import java.util.List;

import javax.servlet.http.*;

import com.baemin.menu.MenuDAO;
import com.baemin.menu.MenuDTO;
import com.baemin.shop.ShopDAO;
import com.baemin.shop.ShopDTO;
import com.mvc.action.CommandAction;

public class ShopManageAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ShopManageAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        //자바 구문
        request.setCharacterEncoding("UTF-8");
        System.out.println("------ShopManage.jsp");

        HttpSession session = ((HttpServletRequest) request).getSession();
        Object no=session.getAttribute("no");


        int shopNo=Integer.parseInt(no+""); 
        System.out.println("shopmanage = " + shopNo);
        MenuDAO menudao=MenuDAO.getInstance();
        ShopDAO shopdao=ShopDAO.getInstance();
        ShopDTO shopdto=shopdao.getShopInfo(shopNo);
        List<MenuDTO> list=menudao.getListByShopNoStatusDesc(shopNo); 

        ShopDTO shopdto2=shopdao.getShopInfo(shopNo);

        request.setAttribute("shopdto", shopdto);
        request.setAttribute("list", list);
        request.setAttribute("shopdto2", shopdto2);
        request.setAttribute("shopNo", new Integer(shopNo));
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/ShopManage.jsp";
    }

}
