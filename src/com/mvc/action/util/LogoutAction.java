package com.mvc.action.util;

import javax.servlet.http.*;
import com.mvc.action.CommandAction;

public class LogoutAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - LogoutAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////
        //
        HttpSession session = request.getSession();
        session.invalidate();

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/util/Logout.jsp";
    }

}
