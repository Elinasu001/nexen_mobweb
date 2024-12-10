package com.nexwrms.mobweb.com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.core.constants.CoreConstants;
import com.nexwrms.core.context.AppContext;
import com.nexwrms.core.exception.BizExceptionFactoryBean;
import com.nexwrms.core.guid.DefaultGuidManager;
import com.nexwrms.core.guid.Guid;
import com.nexwrms.core.session.SessionInfo;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.session.support.DefaultSessionInfo;
import com.nexwrms.core.session.vo.ClientVo;
import com.nexwrms.core.session.vo.UserVo;
import com.nexwrms.core.util.HttpUtil;
import com.nexwrms.core.util.SessionUtil;
//import com.nexwrms.mapi.cm.com.svc.LoginSvc;
//import com.nexwrms.mapi.cm.com.vo.LoginVo;


public class LoginCheckInterceptor extends HandlerInterceptorAdapter {


    private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

//    @Autowired
//    @Qualifier("com.nexwrms.mapi.cm.com.svc.LoginSvc")
//    private LoginSvc loginSvc;

    /**
     * This implementation always returns {@code true}.
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

    	MDC.put("jsessionKey", request.getSession().getId());
    	
        setSessionInfo(request, response, handler);

        return true;
    }

    private void setSessionInfo(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	System.out.println("LoginCheckInterceptor setSessionInfo !!");
    	request.setCharacterEncoding("UTF-8");
        SessionInfo sessionInfo = new DefaultSessionInfo();

        SessionInfoUtil.register(sessionInfo);

        String sysName = AppContext.getString("sys.name");

        // Set Client 세션
        ClientVo client = new ClientVo();

        UsrVo user = null;
        String wasId = System.getProperty(CoreConstants.WAS_ID_NAME);

        client.setClientIp(HttpUtil.getRemoteAddr(request));

        

        SessionInfoUtil.setClientVo(client);


        Guid guid = SessionInfoUtil.getGuid();
        if (guid == null) {
            guid = DefaultGuidManager.getInstance().getGuid();
        }
        SessionInfoUtil.setGuid(guid);

        MDC.put("guid", guid.getGuidString());
        
        user = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
        String uri = request.getRequestURI();
             
        logger.debug("uri : " + uri);
        if (user == null) { //세션이 없으면
        	if(uri.indexOf("/order/") > 0 
    			|| uri.indexOf("/mypage/") > 0                  
        		)
        	{
        		//구매일 경우(렌탈제외) 세션체크 제외
        		if(uri.indexOf("/orderPurchase") > 0 
        				||    
        			uri.indexOf("/selectOrdNo") > 0 
        				||    
        			uri.indexOf("/o2oStock") > 0 
        				||    
        			uri.indexOf("/o2oTmsStock") > 0 
        				||    
        			uri.indexOf("/o2oList") > 0 
        				||    
        			uri.indexOf("/openKcpPayment") > 0 
        				||    
        			uri.indexOf("/getKcpPaymentResult") > 0 
        				||    
        			uri.indexOf("/orderComplete") > 0 
        				||    
        			uri.indexOf("/openKakaoPayment") > 0 
        				||    
        			uri.indexOf("/getKkoPaymentResult") > 0 
        				||    
        			uri.indexOf("/kakaoComplate") > 0 
        				||    
        			uri.indexOf("/processOrdCncl") > 0  
        				||
        			uri.indexOf("/processOrdKkoCncl") > 0 
    					||    
    				uri.indexOf("/getKkoPaymentFail") > 0 
    					||    
    				uri.indexOf("/getKkoPaymentCncl") > 0 
    					||    
        			uri.indexOf("/getNPaymentResult") > 0
        				||    
        			uri.indexOf("/npayComplate") > 0
    					||    
    				uri.indexOf("/selectSiGunGu") > 0 
    					||    
    				uri.indexOf("/stock") > 0 
    					||    
    				uri.indexOf("/selectSetTimeList") > 0 
    					||    
    				uri.indexOf("/selectTmsSetTimeList") > 0 
    					||    
    				uri.indexOf("/selectShopTimeList") > 0 
    					||    
    				uri.indexOf("/selectChkVersion") > 0 
    				    ||    
    				uri.indexOf("/orderList") > 0 
    				    ||    
    				uri.indexOf("/orderDetail") > 0 
    					||    
    				uri.indexOf("/orderRivewView") > 0 
    					||    
    				uri.indexOf("/orderRivewUpdate") > 0 
//    					||
//					uri.indexOf("/freeDamageSrvJoin") > 0 
//					    ||
//				    uri.indexOf("/earlyAbrasionSrvJoin") > 0 
				        ||
    				uri.indexOf("ordAuthMob") > 0
    					||    
        			uri.indexOf("/rentalPriceSimulation") > 0
						||    
        			uri.indexOf("/questionList") > 0
    				){
        			logger.debug("non-customer order");
        		}else{
        			ModelAndView mav = new ModelAndView();
            		mav.setViewName("/login/userLogin");
            		logger.debug("user null and error");
            		throw new ModelAndViewDefiningException(mav);
        		}
        	}
        	
        	//url로 접근하는 경우 old 마모파손보증서비스 화면 block처리
        	if(uri.indexOf("/freeDamageSrvJoin") > 0 
					    ||
			   uri.indexOf("/earlyAbrasionSrvJoin") > 0
			   ||
			   uri.indexOf("/freeDamageSrvCreUpload") > 0){
        	   ModelAndView mav = new ModelAndView();
        	   mav.setViewName("/login/userLogin");
        	   logger.debug("user null and error");
        	   throw new ModelAndViewDefiningException(mav);
        	}
        	
        	System.out.println("session null");
        	SessionUtil.setAttribute(SessionInfoUtil.SESSION_DUMMY, null);
        	
        }else{ //세션이 있으면
        	// Set User 세션
        	logger.debug("user ok");
			SessionInfoUtil.setSessionInfo(SessionInfoUtil.SESSION_INFO_USR_VO, user);
        }
		

	    
    }

	   

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);

        SessionInfoUtil.clear();
    }

}
