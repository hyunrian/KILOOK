package com.kh.teampro.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.user.info.UserVo;


public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		//로그인 되어있지 않다면
		if(userVo == null) {
			String uri = request.getRequestURI();
//			System.out.println("uri:" + uri);
			String queryString = request.getQueryString();
//			System.out.println("queryString:" + queryString);
			String targetLocation = uri + "?" + queryString;
			session.setAttribute("targetLocation", targetLocation);
			System.out.println("targetLocation:" + targetLocation);
			//로그인 페이지로 이동
			response.sendRedirect("/loginUser/login");
			return false; // 요청 처리를 하지 않음
		}
		return true; // 요청 처리를 함
	}
}
