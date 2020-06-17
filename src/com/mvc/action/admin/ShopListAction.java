package com.mvc.action.admin;

import java.util.List;

import javax.servlet.http.*;

import com.baemin.shop.ShopDAO;
import com.baemin.shop.ShopDTO;
import com.mvc.action.CommandAction;

public class ShopListAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ShopListAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        
    	request.setCharacterEncoding("utf-8");
    	System.out.println("------ ShopListAll.jsp --- ");

    	ShopDAO dao=ShopDAO.getInstance();
    	List<ShopDTO> list = dao.getListAll();
    	request.setAttribute("list", list);    	

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/admin/ShopList.jsp";
    }

}
