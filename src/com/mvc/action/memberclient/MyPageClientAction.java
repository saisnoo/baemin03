package com.mvc.action.memberclient;

import javax.servlet.http.*;
import com.mvc.action.CommandAction;

public class MyPageClientAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - MyPageClientAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        //

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return " aaaaa ";
    }

}
