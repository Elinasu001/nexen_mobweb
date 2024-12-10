package com.nexwrms.mobweb.main.ctl;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nexwrms.cfo.com.cm.svc.ExceptionSvc;
import com.nexwrms.cfo.com.cm.svc.NoticeSvc;
import com.nexwrms.cfo.com.cm.vo.NoticeVo;
import com.nexwrms.cfo.com.cm.vo.PageVo;
import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.cfo.com.main.svc.MainBannerSvc;
import com.nexwrms.cfo.com.main.vo.MainBannerSearchVo;
import com.nexwrms.cfo.com.main.vo.MainBannerVo;
import com.nexwrms.cfo.com.mypage.svc.MypageSvc;
import com.nexwrms.cfo.util.CookieUtil;
import com.nexwrms.core.context.AppContext;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;
import com.nexwrms.core.util.StringUtil;

@Controller
public class MainCtl {
	private static final Logger logger = LoggerFactory.getLogger(MainCtl.class);

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.NoticeSvc")
	private NoticeSvc noticeSvc;
	
	@Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.ExceptionSvc")
	private ExceptionSvc exceptionSvc;
	
	@Autowired
	private MainBannerSvc mainBannerSvc;
	
	@Autowired
	@Qualifier("com.nexwrms.cfo.com.mypage.svc.MypageSvc")
	private MypageSvc mypageSvc;
	
	@Autowired
	private CookieUtil cookieUtil;

	@RequestMapping("/main")
	public String goMain(HttpServletResponse response , Model model , @RequestParam(required = false) String utm_source) throws Exception {
		UsrVo usrVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		if (usrVo != null) {
			if(!StringUtil.isEmpty(usrVo.getLoginId())){
				model.addAttribute("loginId", usrVo.getLoginId());
			}			
		}
		//수현 추가 
		model.addAttribute("reViewList", mypageSvc.selectMainReviewList());
		
		//Cookie 생성
		if(StringUtil.isNotEmpty(utm_source)){
			cookieUtil.getInstance().newAddCookie(response, "ifwChnCookie", utm_source);
		}
		
		//Main page 이용후기 고도화New
		model.addAttribute("reViewListNew", mypageSvc.mainReviewListNew());
		model.addAttribute("mainReviewAtflList", mypageSvc.mainReviewAtflList());
				
		// Main popup창 조회
		MainBannerSearchVo bvo = new MainBannerSearchVo();
		bvo.setImgPrposSeCd("20"); // 모바일값
//		int popupCnt = mainBannerSvc.selectPopupCnt(bvo.getImgPrposSeCd());
//		model.addAttribute("popupCnt", popupCnt);
		model.addAttribute("mainPopupImg", mainBannerSvc.selectPopupImg(bvo));
		
		// Main Banner 조회
		model.addAttribute("mainImg", mainBannerSvc.selectMainImg(bvo));
		
		if(utm_source != null && utm_source != "" && utm_source.equals("coupang")) {
			return "/ib/cpFindSizeModal";
		} else {
			//10233006 GA title tag 동적 변경
			model.addAttribute("title", "메인 | NEXT LEVEL");
			return "/main/main";
		}
		
	}

	@RequestMapping("/mainTest")
	public String mainTest() {
		System.out.println("mainTest!!!!!!");
		return "/main/maintest";
	}



//	@RequestMapping(value=UrIUtil.termsURI)
//	public ModelAndView terms(ModelAndView mv){
//		mv.setViewName("menu/terms");
//		return mv;
//	}

	@RequestMapping(value="/error/error{error_code}")
    public ModelAndView error(HttpServletRequest request, @PathVariable String error_code) {
		logger.debug("/error/error"+error_code);
        ModelAndView mv = new ModelAndView("/error/error");
        String msg = (String) request.getAttribute("javax.servlet.error.message");
        String uriPath = (String) request.getAttribute("javax.servlet.error.request_uri");

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("STATUS_CODE", request.getAttribute("javax.servlet.error.status_code"));
        map.put("REQUEST_URI", uriPath);
        map.put("EXCEPTION_TYPE", request.getAttribute("javax.servlet.error.exception_type"));
        map.put("EXCEPTION", request.getAttribute("javax.servlet.error.exception"));
        map.put("SERVLET_NAME", request.getAttribute("javax.servlet.error.servlet_name"));

     // 로그를 남겨보자 
        String usrId = "NoLogIn";
        UsrVo usrVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
        if(usrVo != null) {
			if(!StringUtil.isEmpty(usrVo.getLoginId())){
				usrId = usrVo.getLoginId();
			}
        }
		
        String serverIp = "";
		try {
			serverIp = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			serverIp = "";
		}

		String remoteAddr = "";
		if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }

            if("0:0:0:0:0:0:0:1".equalsIgnoreCase(remoteAddr)){
            	remoteAddr = serverIp;
            }
        }
		
		HashMap expMap = new HashMap();
		expMap.put("SYS_CD", "MOB");
		expMap.put("URL_PATH", uriPath);
		expMap.put("CLIENT_IP_ADDR", remoteAddr);
		expMap.put("SERVER_IP_ADDR", serverIp);
		expMap.put("USR_ID", usrId);
		expMap.put("EXEP_MSG", msg);

		String recvMsg = "";
		if(msg.contains("%")) {
			if(msg.indexOf("[") > 0) { 
				recvMsg = msg.substring(msg.indexOf("["),msg.indexOf("%"));
				String tbCmExepMngStr = msg.substring(msg.indexOf("%") + 1);
				
				try {
					Map<String, Object> errMap = new ObjectMapper().readValue(tbCmExepMngStr, HashMap.class);
					expMap.put("ERR_TP", errMap.get("errTp"));
					expMap.put("CUST_NM", errMap.get("custNm"));
					expMap.put("HP_NO", errMap.get("mobNo"));
					expMap.put("ORD_NO", errMap.get("ordNo"));
				} catch (JsonParseException e) {
					e.printStackTrace();
				} catch (JsonMappingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(!uriPath.contains(".ico") && !uriPath.contains(".png") 
		   && !uriPath.contains(".txt") && !uriPath.contains(".map")
		   && !uriPath.contains(".css") && !uriPath.contains("Spoqa")) 
		{
			exceptionSvc.newInsertException(expMap);			
		}
		
		
        try {
            int status_code = Integer.parseInt(error_code);
            switch (status_code) {
            case 400: msg = "잘못된 요청입니다."; break;
            case 403: msg = "접근이 금지되었습니다."; break;
            case 404: msg = "페이지를 찾을 수 없습니다."; break;
            case 405: msg = "요청된 메소드가 허용되지 않습니다."; break;
            case 500: msg = "서버에 오류가 발생하였습니다."; break;
            case 503: msg = "서비스를 사용할 수 없습니다."; break;
            default: msg = "알 수 없는 오류가 발생하였습니다."; break;
            }
        } catch(Exception e) {
        	if(!StringUtils.isEmpty(recvMsg))
            	msg = recvMsg;
            else
            	msg = "기타 오류가 발생하였습니다.";;
        } finally {
            map.put("MESSAGE", msg);
        }

        mv.addObject("error", map);
        return mv;
    }

	@RequestMapping("/main/noticeList")
	public @ResponseBody Map<String, Object> noticeList(HttpServletRequest request, @RequestBody NoticeVo searchVo) throws Exception{
		Map<String, Object> rtn = new HashMap<String, Object>();

		List<NoticeVo> noticeList = null;
		PageVo pageVo = new PageVo();

		//Exception 생성(cfnRequestErrorCallback)
		//if(condMap.isEmpty() || condMap.size() == 0){
		//    throw BizExceptionFactoryBean.getInstance().createBizException("CMA0351", new String[]{"condMap"}, "ko"); //{0}은/는 필수 입력 항목입니다.
		//}

		searchVo.setListFixYn("N");



		noticeList = noticeSvc.selectList(searchVo);
		pageVo.setTotalCount(noticeSvc.selectListCount(searchVo));
		pageVo.setPageNo(searchVo.getPageNo());


		//spring_context_{server_mode}.properties 파일에서 값 읽어오기
		AppContext.getString(WebConstants.FileDir.IMGFILE_URL);


		//cfnRequestSuccessCallback
		if(noticeList == null || noticeList.size() == 0){
			//실패일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}
		else{
			//성공일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			rtn.put("list", noticeList);
			rtn.put("pageCommon", pageVo);

		}

		return rtn;
	}
	
	@RequestMapping("/main/mainBannerImg")
	@ResponseBody
	public Map<String, Object> selectBannerImg(HttpServletRequest request, @RequestBody MainBannerSearchVo vo,Model model)throws Exception{
		
		MainBannerVo bvo = new MainBannerVo();
		vo.setImgPrposSeCd("20");
		String imgPrposSeCd = request.getParameter("param");
		//imgPrposSeCd = vo.getImgPrposSeCd();
		System.out.println("imgPrposSeCd ::::: "+imgPrposSeCd);
		Map<String, Object> map = new HashMap<String, Object>();
		int bannerCnt = mainBannerSvc.selectBannerCnt(vo.getImgPrposSeCd());
		bvo.setTotalCnt(bannerCnt);
		System.out.println("bannerCnt :: "+bannerCnt);
		
		model.addAttribute("bannerCnt", bannerCnt);
		
		map.put("selectMainBannerImg", mainBannerSvc.selectBannerImg(vo));
		
		/* 23/07 10233006 추현욱 동영상 노출 동적 처리 개발 */
		map.put("selectMainVideos", mainBannerSvc.selectMainVideo(vo));
		
		map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		
		return map;
	}
	
	@RequestMapping("/nexFindSizeModal")
	public String nexFindSizeModal(HttpServletResponse response , Model model , @RequestParam(required = false) String utm_source) throws Exception {
		return "/ib/nexFindSizeModal";
	}
	
	@RequestMapping("/nexFindSizeModalNew")
	public String nexFindSizeModalNew(HttpServletResponse response , Model model , @RequestParam(required = false) String utm_source) throws Exception {
		return "/ib/nexFindSizeModalNew";
	}
	
	@RequestMapping("/cpFindSizeModal")
	public String cpFindSizeModal(HttpServletResponse response , Model model , @RequestParam(required = false) String utm_source) throws Exception {
		return "/ib/cpFindSizeModal";
	}
	
	@RequestMapping("/main/gmCar")
	public String gmCar() throws Exception {
		return "/ib/gmCar";
	}
	
	@RequestMapping("/main/gmSize")
	public String gmSize() throws Exception {
		return "/ib/gmSize";
	}
	
	@RequestMapping("/main/gmNum")
	public String gmNum() throws Exception {
		return "/ib/gmNum";
	}

}
