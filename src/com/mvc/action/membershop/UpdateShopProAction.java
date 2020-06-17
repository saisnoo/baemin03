package com.mvc.action.membershop;

import javax.servlet.http.*;

import com.baemin.shop.ShopDAO;
import com.baemin.shop.ShopDTO;
import com.mvc.action.CommandAction;

public class UpdateShopProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - UpdateShopProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        HttpSession session = request.getSession();
        
        ShopDAO dao = ShopDAO.getInstance();
        ShopDTO dto = new ShopDTO();

        int no = Integer.parseInt(session.getAttribute("no")+"");
        String shopTel = request.getParameter("shopTel");
        String pw = request.getParameter("password");

        System.out.println("no :" + no);
        System.out.println("shopTel :" + shopTel);
        System.out.println("pw :" + pw);

        dto.setNo(no);
        dto.setShopTel(shopTel);
        dto.setPw(pw);

        int result = dao.changeShopInfo(dto);
        //
        request.setAttribute("result", result);
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/memberShop/UpdateShopPro.jsp";
    }

}
