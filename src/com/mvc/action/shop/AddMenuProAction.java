package com.mvc.action.shop;

import javax.servlet.http.*;

import com.baemin.menu.MenuDAO;
import com.baemin.menu.MenuDTO;
import com.mvc.action.CommandAction;

public class AddMenuProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - AddMenuProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        HttpSession session = ((HttpServletRequest) request).getSession();
        Object no=session.getAttribute("no");
        
        int shopNo=Integer.parseInt(no+""); 
        String menuName=request.getParameter("menuName");
        String menuCategory= request.getParameter("menuCategory");
        String menuEx= request.getParameter("menuEx");
        int menuPrice= Integer.parseInt(request.getParameter("menuPrice"));

        MenuDTO menudto= new MenuDTO();
        menudto.setShop_no(shopNo);
        menudto.setMenuName(menuName);
        menudto.setMenuCategory(menuCategory);
        menudto.setMenuEx(menuEx);
        menudto.setMenuPrice(menuPrice);

        MenuDAO menudao=MenuDAO.getInstance();
        int result=menudao.insertMenu(menudto);
        
        request.setAttribute("result",new Integer(result));
        request.setAttribute("shopNo",new Integer(shopNo));
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/AddMenuPro.jsp";
    }

}
