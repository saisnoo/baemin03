package com.mvc.action.joinShop;

import javax.servlet.http.*;

import com.baemin.shop.ShopDAO;
import com.mvc.action.CommandAction;

public class IdCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");
		System.out.println("- - - - IdCheckAction - - - - ");
		///////////////// 이 아래에 내용 넣으세요 /////////////////////////
		String shopID = request.getParameter("id");

		System.out.println("shopID=" + shopID);

		ShopDAO dao = ShopDAO.getInstance();
		int result = dao.idCheck(shopID);
		
		System.out.println("result=" + result);
		//
		request.setAttribute("result", result);
		///////////////// 이 위에 내용 넣으세요 /////////////////////////
		return "/joinShop/IdCheck.jsp";
	}

}
