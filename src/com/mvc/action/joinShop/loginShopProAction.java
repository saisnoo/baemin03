package com.mvc.action.joinShop;

import javax.servlet.http.*;
import com.baemin.shop.*;
import com.mvc.action.CommandAction;

public class LoginShopProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - LoginShopProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        String shopID = request.getParameter("shopID");
        String shopPW = request.getParameter("shopPW");
        System.out.println("shopID=" + shopID);
        System.out.println("shopPW=" + shopPW);

        ShopDAO dao = ShopDAO.getInstance();
        ShopDTO dto = dao.login(shopID, shopPW);

        System.out.println(dto.toString());

        int no = dto.getNo();

        System.out.println("no=" + no);

        HttpSession session = ((HttpServletRequest) request).getSession();

        if (no > 0) {
            System.out.println(" !!! shop id=" + shopID);
            session.setAttribute("no", no);
            session.setAttribute("id", dto.getId());
            session.setAttribute("grade", 2);
            session.setAttribute("name", dto.getShopName());
            request.setAttribute("result", 1111111111);
        } else {
            System.out.println(" !!! shop null");
            request.setAttribute("result", -1);
        }
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/joinShop/LoginShopPro.jsp";
    }
}
