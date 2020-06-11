package com.mvc.action;

import javax.servlet.http.*;
import com.mvc.command.CommandAction;

public class NoticeWriteAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - NoticeWriteAction - - - - ");

        // TM_DIRECTORY
        // C:\Users\swsw1005\OneDrive\Dev\Workspace\baemin03\src\com\mvc\action
        // TM_FILEPATH
        // C:\Users\swsw1005\OneDrive\Dev\Workspace\baemin03\src\com\mvc\action\NoticeWriteAction.java
        // WORKSPACE_NAME
        // baemin03
        return " aaaaa ";
    }

}
