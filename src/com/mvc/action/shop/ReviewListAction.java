package com.mvc.action.shop;

import java.util.List;

import javax.servlet.http.*;

import com.baemin.review.ReviewDAO;
import com.baemin.review.ReviewDTO;
import com.baemin.shop.ShopDAO;
import com.baemin.shop.ShopDTO;
import com.mvc.action.CommandAction;

public class ReviewListAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - reviewListAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

    	request.setCharacterEncoding("UTF-8");
    	System.out.println("------reviewList.jsp");
    	HttpSession session = ((HttpServletRequest) request).getSession();
    	Object no=session.getAttribute("no");
    	int shopNo=Integer.parseInt(no+""); 
    	
    	ReviewDAO dao = ReviewDAO.getInstance();
    	List<ReviewDTO> reviewList=dao.getListByShop(shopNo,100);
    	
    	ShopDAO shopdao = ShopDAO.getInstance();
    	ShopDTO shopdto = shopdao.getShopInfo(shopNo);
    	
    	request.setAttribute("shopdto", shopdto);
    	request.setAttribute("reviewList", reviewList);
    	request.setAttribute("shopNo", new Integer(shopNo));
        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/shop/ReviewList.jsp";
    }

}
