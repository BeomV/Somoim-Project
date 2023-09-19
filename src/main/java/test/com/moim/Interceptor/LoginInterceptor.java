package test.com.moim.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle()....");
		
		String sPath = request.getServletPath();
		log.info("preHandle()....{}",sPath);
		
		String user_id = (String) session.getAttribute("user_id");
		log.info("preHandle()....user_id : {}",user_id);
		
		
		if(sPath.equals("/selectAll.do")
				|| sPath.equals("/selectOne.do")
				|| sPath.equals("/point_selectAll.do")) {

			if(user_id == null) {
				response.sendRedirect("login.do");
				return false;
			}
		}
		
		return true;
	}
	
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		log.info("postHandle()....");
//	}
	
}