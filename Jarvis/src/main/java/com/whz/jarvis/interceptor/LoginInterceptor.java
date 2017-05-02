package com.whz.jarvis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.whz.jarvis.controller.JarvisController;
import com.whz.jarvis.model.JarvisUser;
/**
 * 拦截器
 * @author Joe
 *
 * 2017年5月2日
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	//定义忽略拦截的路径
	private static final String[] IGNORE_URI = {"/login.jsp", "/jarvis/user/login","/goto/login","/jarvis/user/exit"};
	 
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean flag = false;
        String url = request.getRequestURL().toString();
        for (String s : IGNORE_URI) {
            if (url.contains(s)) {
                flag = true;
                break;
            }
        }
        if (!flag) {
            JarvisUser user = JarvisController.getLoginUser(request);
            if (user != null){
            	flag = true;
            }else{
            	response.sendRedirect(request.getContextPath()+"/goto/login");
            	flag=false;
            }
        }
        return flag;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
