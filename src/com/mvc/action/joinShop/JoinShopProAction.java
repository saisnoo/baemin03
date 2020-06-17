package com.mvc.action.joinShop;

import javax.servlet.http.*;

import com.baemin.shop.ShopDAO;
import com.baemin.shop.ShopDTO;
import com.mvc.action.CommandAction;

public class JoinShopProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");
		System.out.println("- - - - joinShopProAction - - - - ");
		// /////////////// 이 아래에 내용 넣으세요 /////////////////////////
		ShopDAO dao = ShopDAO.getInstance();
		
		ShopDTO dto = new ShopDTO();
		
		String id = request.getParameter("shopID");
		System.out.println(id);
		String pw = request.getParameter("shopPW");
		String shopName = request.getParameter("shopName");
		String shopEx = request.getParameter("shopEx");

		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");

		String shopTel = tel1 + "-" + tel2 + "-" + tel3;

		String shopAddr = request.getParameter("shopAddr");
		String shopAddr2 = request.getParameter("shopAddr2");

		String shopX_ = request.getParameter("shopX").trim();
		String shopY_ = request.getParameter("shopY").trim();

		double shopX = Double.parseDouble(shopX_);
		double shopY = Double.parseDouble(shopY_);

		String[] shopCategory_ = request.getParameterValues("shopCategory");
		String shopCategory = "";
		
		System.out.println(" shopCategory_.length="+ shopCategory_.length);
		System.out.println(" shopCategory_.length="+ shopCategory_.length);
		System.out.println(" shopCategory_.length="+ shopCategory_.length);

		for (int i = 0; i < shopCategory_.length; i++) {
			shopCategory += shopCategory_[i] + ", ";
			System.out.println(shopCategory);
		}
		shopCategory += ",";
		shopCategory = shopCategory.replaceAll(", ,", "");
		System.out.println(shopCategory);
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setShopName(shopName);
		dto.setShopCategory(shopCategory);
		dto.setShopEx(shopEx);
		dto.setShopAddr(shopAddr);
		dto.setShopAddr2(shopAddr2);
		dto.setShopTel(shopTel);
		dto.setShopX(shopX);
		dto.setShopY(shopY);
		
		int result = dao.insertShop(dto);
		//
		request.setAttribute("result", result);
		// /////////////// 이 위에 내용 넣으세요 /////////////////////////
		return "/joinShop/JoinShopPro.jsp";
	}

}
