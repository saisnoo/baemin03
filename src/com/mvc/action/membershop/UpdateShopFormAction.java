package com.mvc.action.membershop;

import javax.servlet.http.*;

import com.baemin.shop.ShopDAO;
import com.baemin.shop.ShopDTO;
import com.mvc.action.CommandAction;

public class UpdateShopFormAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - UpdateShopProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        HttpSession session = request.getSession();
        
		Object no_ob = session.getAttribute("no");
		int no = Integer.parseInt(no_ob + "");
		ShopDAO dao = ShopDAO.getInstance();
		ShopDTO dto = dao.getShopInfo(no);
        //
		request.setAttribute("dto", dto);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/memberShop/UpdateShopForm.jsp";
    }

}
