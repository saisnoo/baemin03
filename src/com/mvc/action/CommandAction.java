﻿package com.mvc.action;

import javax.servlet.http.*;

public interface CommandAction {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;

}// interface end
