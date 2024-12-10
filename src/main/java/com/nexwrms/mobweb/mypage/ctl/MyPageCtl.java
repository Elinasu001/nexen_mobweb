package com.nexwrms.mobweb.mypage.ctl;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nexwrms.cfo.com.cm.svc.FileService;
import com.nexwrms.cfo.com.cm.vo.AfileVo;
import com.nexwrms.cfo.com.cm.vo.PageVo;
import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.cfo.com.mypage.svc.MypageSvc;
import com.nexwrms.cfo.com.mypage.vo.MyCouponSearchVo;
import com.nexwrms.cfo.com.mypage.vo.MypageSearchVo;
import com.nexwrms.cfo.com.mypage.vo.OrderReviewVo;
import com.nexwrms.cfo.util.JsPrinter;
import com.nexwrms.core.context.AppContext;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;
import com.nexwrms.nextlevel.com.cm.svc.CommonCodeService;
import com.nexwrms.nextlevel.com.cm.svc.RentalFileService;
import com.nexwrms.nextlevel.com.cm.vo.AttfileVo;
import com.nexwrms.nextlevel.com.cm.vo.RTCM0050SearchVo;
import com.nexwrms.nextlevel.com.cm.vo.RTCM0050Vo;
import com.nexwrms.nextlevel.com.login.vo.ReRentalVo;
import com.nexwrms.nextlevel.com.mypage.svc.OrderReviewSvc;
import com.nexwrms.nextlevel.com.mypage.svc.QuestionSvc;
import com.nexwrms.nextlevel.com.mypage.vo.OrderPerReviewVo;
import com.nexwrms.nextlevel.com.mypage.vo.QuestionSearchVo;
import com.nexwrms.nextlevel.com.mypage.vo.QuestionVo;
import com.nexwrms.nextlevel.com.mypage.vo.ZeroServiceListVO;
import com.nexwrms.nextlevel.com.mypage.vo.engineOilServiceListVO;
import com.nexwrms.nextlevel.com.order.svc.RentalOrderSvc;
import com.nexwrms.nextlevel.com.order.vo.RentalOrderVo;


/**
 * @class Name : MyPageCtl.java
 * @Description : FO mypage
 * @RequestMapping
 * @Modification Informat ion
 * @
 * @ Date            Author       Description
 * @ -------------  -----------  -------------
 * @ 2019. 11. 13.    주영완		  최초 생성
 *
 */
@RequestMapping("/mypageOrg")
@Controller
public class MyPageCtl {
	private static final Logger logger = LoggerFactory.getLogger(MyPageCtl.class);

    @Autowired
	@Qualifier("com.nexwrms.cfo.com.mypage.svc.MypageSvc")
	private MypageSvc mypageSvc;

    @Autowired
	@Qualifier("com.nexwrms.nextlevel.com.mypage.svc.OrderReviewSvc")
	private OrderReviewSvc orderReviewSvc;

    @Autowired
	@Qualifier("com.nexwrms.nextlevel.com.cm.svc.RentalFileService")
	private RentalFileService rentalFileService;

    @Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.FileService")
	private FileService fileService;

	@Autowired
	@Qualifier("com.nexwrms.nextlevel.com.order.svc.RentalOrderSvc")
	RentalOrderSvc rentalOrderSvc;

    @Autowired
    private CommonCodeService commonCodeService;

    @Autowired
    private QuestionSvc questionSvc;

	/**
	 * 마이페이지 > 주문리스트(구매,렌탈)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/orderList")
	public String orderList(HttpServletRequest request, Model model, MypageSearchVo vo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/orderList");
			rUrl = "/login/userLogin";
		} else {
			rUrl = "/mypage/orderList";
			Map<String, Object> selectPrdMap = mypageSvc.selectOrderList(clientVo, vo);

			model.addAttribute("searchMonth", vo.getSearchMonth());
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("custNo", userVo.getCustNo());
			model.addAttribute("selectPrdList",    	selectPrdMap.get("myOrdList"));
			model.addAttribute("selectPrdListCnt",    	selectPrdMap.get("myOrdListCnt"));
		}
		return rUrl;
	}


	/**
	 * 마이페이지 > 주문리스트(구매,렌탈) > 주문상세
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/orderDetail")
	public String orderDetail(HttpServletRequest request, Model model, MypageSearchVo vo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/orderList");
			rUrl = "/login/userLogin";
		} else {
			Map<String, Object> selectPrdMap = mypageSvc.selectOrderDetail(clientVo, vo);
			if("O".equals(vo.getOrdergbn())){
				rUrl = "/mypage/orderPoDetail";
				model.addAttribute("myOrdDetailInfo",    	selectPrdMap.get("myOrdDetailInfo"));
			}else if("R".equals(vo.getOrdergbn())){
				rUrl = "/mypage/orderRenDetail";
			}else{
				rUrl = "/main";
			}
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("myOrdDetail",    	selectPrdMap.get("myOrdDetail"));
		}
		return rUrl;
	}


	/**
	 * 마이페이지 > 주문리스트(구매,렌탈) > 방문장착 레이어 팝업 데이터 호출
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectVisitCondition")
	@ResponseBody
	public Map<String, Object> selectVisitCondition(HttpServletRequest request, @RequestBody  MypageSearchVo vo) throws Exception {

		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap = mypageSvc.selectVisitCondition(vo);


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("visitCond", resultmap.get("visitCond"));
		map.put("visitAttFList", resultmap.get("visitAttFList"));
		return map;
	}

	/**
	 * 마이페이지 > 주문리스트(구매,렌탈) > 픽업앤 딜리버리 레이어 팝업 데이터 호출
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectPickAndDel")
	@ResponseBody
	public Map<String, Object> selectPickAndDel(HttpServletRequest request, @RequestBody  MypageSearchVo vo) throws Exception {

		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap = mypageSvc.selectPickAndDel(vo);


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pickDel", resultmap.get("pickDel"));
		map.put("pickDelAttFList", resultmap.get("pickDelAttFList"));
		return map;
	}

	/**
	 * 마이페이지 > 주문후기(구매,렌탈)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/orderRivew")
	public String orderRivew(HttpServletRequest request, Model model) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		String bdojSeq = request.getParameter("bdojSeq");
		String usePsNo = request.getParameter("usePsNo");

		logger.debug("::::::::::bdojSeq:::::::::::::"+bdojSeq);
		logger.debug(":::::::::::usePsNo::::::::::::"+usePsNo);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/orderList");
			rUrl = "/login/userLogin";
		} else {
			rUrl = "/mypage/orderRivew";

			model.addAttribute("ordNo",request.getParameter("ordNo"));
			model.addAttribute("dpNo",request.getParameter("dpNo"));
			model.addAttribute("pattenCd", request.getParameter("pattenCd"));
			model.addAttribute("reviewGbn", request.getParameter("reviewGbn"));
			model.addAttribute("userId", clientVo.getCustId());
		}
		return rUrl;
	}

	/**
	 * 마이페이지 > 주문후기(구매,렌탈) 수정용
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/orderRivewUpdate")
	public String orderRivewUpdate(HttpServletRequest request, Model model, OrderReviewVo vo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/orderList");
			rUrl = "/login/userLogin";
		} else {
			rUrl = "/mypage/orderRivewUpd";

			OrderReviewVo review = mypageSvc.orderRivewView(vo);
			
			String classNm = vo.getClassNm();
			String dispSize = request.getParameter("dispSize");

			model.addAttribute("custNo", clientVo.getCustNo());
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("reviewGbn", vo.getSystemGbn());
			model.addAttribute("review", review);
			model.addAttribute("classNm", classNm);
			model.addAttribute("dispSize", dispSize);
		}
		return rUrl;
	}




	/**
	 * 마이페이지 > 렌탈 상품후기 등록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertRentReview" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> insertRentReview(MultipartHttpServletRequest mRequest, Model model) throws Exception {
		Map<String, Object> rtn = new HashMap<String, Object>();
		mRequest.setCharacterEncoding("UTF-8");

		try {
			OrderReviewVo orderReview = new OrderReviewVo();
			String title = mRequest.getParameter("title");
			title = new String(title.getBytes("8859_1"),"utf-8");

			String cont = mRequest.getParameter("cont");
			cont = new String(cont.getBytes("8859_1"),"utf-8");

			orderReview.setTitle(title);
			orderReview.setqCont(cont);
			String grdpt = mRequest.getParameter("manjok1");
			int grdptint = Integer.parseInt(grdpt);
			orderReview.setGrdPt(grdptint);
			orderReview.setPatternCd(mRequest.getParameter("patternCd"));
			orderReview.setBdojSeq(mRequest.getParameter("bdojSeq"));
			orderReview.setUpdateGbn(mRequest.getParameter("updateGbn"));

			//첨부이미지
			List<MultipartFile> mfl = mRequest.getFiles("bizFiles");
			List<AttfileVo> list = new ArrayList<AttfileVo>();

			try {
				list = rentalFileService.upload(mfl, WebConstants.RENTAL_FILE_PATH_ATFILE);
			} catch (Exception e) {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
				return rtn;
			}

			String rs = orderReviewSvc.insertRentReview(list, orderReview);
			if("S".equals(rs)) {
				//성공일 때 리턴 형식
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			}else {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
		} catch(Exception e) {
			//실패일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rtn;
	}


	/**
	 * 마이페이지 > 구매 상품후기 등록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertO2oReview" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> insertO2oReview(MultipartHttpServletRequest mRequest, Model model) throws Exception {
		Map<String, Object> rtn = new HashMap<String, Object>();
		mRequest.setCharacterEncoding("UTF-8");

		try {
			OrderPerReviewVo orderPerReviewVo = new OrderPerReviewVo();
			String title = mRequest.getParameter("title");
			title = new String(title.getBytes("8859_1"),"utf-8");

			String cont = mRequest.getParameter("cont");
			cont = new String(cont.getBytes("8859_1"),"utf-8");

			orderPerReviewVo.setTitle(title);
			orderPerReviewVo.setqCont(cont);
			String grdpt1 = mRequest.getParameter("manjok1");
			String grdpt2 = mRequest.getParameter("manjok2");
			String grdpt3 = mRequest.getParameter("manjok3");

			String ordNo = mRequest.getParameter("ordNo");
			String dpPrNo = mRequest.getParameter("dpPrNo");
			String updateGbn = mRequest.getParameter("updateGbn");
			String usePsNo = mRequest.getParameter("usePsNo");


			orderPerReviewVo.setGrdPt1(grdpt1);
			orderPerReviewVo.setGrdPt2(grdpt2);
			orderPerReviewVo.setGrdPt3(grdpt3);
			orderPerReviewVo.setOrdNo(ordNo);
			orderPerReviewVo.setDpPrNo(dpPrNo);
			orderPerReviewVo.setUsePsNo(usePsNo);

			orderPerReviewVo.setPatternCd(mRequest.getParameter("patternCd"));
			orderPerReviewVo.setUpdateGbn(updateGbn);

			//첨부이미지
			List<MultipartFile> mfl = mRequest.getFiles("bizFiles");
			List<AfileVo> list = new ArrayList<AfileVo>();

			try {
				list = fileService.uploadReviewImg(mfl);
			} catch (Exception e) {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
				return rtn;
			}

			String rs = mypageSvc.insertO2oReview(list, orderPerReviewVo);
			if("S".equals(rs)) {
				//성공일 때 리턴 형식
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			}else {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
		} catch(Exception e) {
			//실패일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rtn;
	}

	/**
	 * @param orderVo	- 상품후기 리뷰
	 */
	@RequestMapping("/orderRivewView")
	public String orderRivewView(HttpServletRequest request, Model model, OrderReviewVo vo) throws Exception {

		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/orderList");
			rUrl = "/login/userLogin";
		} else {
			rUrl = "/mypage/orderRivewView";
			OrderReviewVo review = mypageSvc.orderRivewView(vo);

			String classNm = vo.getClassNm();
			String dispSize = request.getParameter("dispSize");
			
			model.addAttribute("custNo", clientVo.getCustNo());
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("systemGbn", vo.getSystemGbn());
			model.addAttribute("review", review);
			model.addAttribute("classNm", classNm);
			model.addAttribute("dispSize", dispSize);
		}
		return rUrl;
	}


	/**
	 * 상품 후기 삭제
	 */
	@RequestMapping("/orderRivewDel")
	public String orderRivewDel(HttpServletRequest request, Model model, OrderReviewVo vo) throws Exception {

		String rUrl = "";
		String delSucc = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/orderList");
			rUrl = "/login/userLogin";
		} else {
			rUrl = "/mypage/orderList";
			try{
				delSucc = mypageSvc.orderRivewDel(vo);
			}catch(Exception e){
				rUrl = "/main";
			}
		}
		return "redirect:"+rUrl;
	}

	/**
	 * 마이페이지 > 서비스신청 > 걱정제로 서비스 신청화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zeroServiceCreate")
	public String zeroServiceCreate(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);



		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/zeroServiceCreate");
			rUrl = "/login/userLogin";
		} else {

			rUrl = "/mypage/zeroServiceCreate";
			/* 걱정제로 서비스용 고객정보 조회  */
			ReRentalVo custInfo = mypageSvc.CusContView(clientVo);

			/*휴일 정보 가져 오기*/
			List<RentalOrderVo> hDayList = rentalOrderSvc.selectHDayList();

			/*타이어 서비스 본수 목록*/
			RTCM0050SearchVo searchVO = new RTCM0050SearchVo();
			searchVO.setsCdGrpCd("S089");  // 제조사
			searchVO.setsUseYn("Y");  // 사용여부
			List<RTCM0050Vo> zeroCdList = commonCodeService.selectCommonCodeList(searchVO);

			clientVo.setCustNo(custInfo.getCustNo());
			 /*걱정제로서비스 리스트 데이터 */
			List<ZeroServiceListVO> zeroServiceInsertList  = mypageSvc.zeroServiceInsertList(clientVo);

			//시도 조회
			List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

			if(zeroServiceInsertList.size() == 0){
				StringBuilder returnPath = new StringBuilder();
				returnPath.append("/main");
				JsPrinter.replace(response, returnPath.toString(), "렌탈 계약 고객에게 제공하는 서비스입니다.");
			}else{
				model.addAttribute("userVo", userVo);			// 고객정보
				model.addAttribute("custInfo", custInfo);			// 고객정보
				model.addAttribute("zeroCdList", zeroCdList);	// 타이어본수
				model.addAttribute("hDayList", hDayList);			// 휴일 목록
				model.addAttribute("selectSiDoList", selectSiDoList);	//시도 조회
				model.addAttribute("zeroServiceInsertList", zeroServiceInsertList);// 주문정보
			}
		}
		return rUrl;
	}

	/**
	 * 마이페이지 > 걱정제로 서비스 신청 > 등록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zeroServiceInsertProc")
	@ResponseBody
	public Map<String, Object> zeroServiceInsertProc(HttpServletRequest request, @RequestBody  ZeroServiceListVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String path;
		vo.setDlvrDay(format.format(now));
		try{
			ZeroServiceListVO zvo = mypageSvc.saveZeroServiceInsertProc(vo);
			map.put("successCode", zvo.getSuccessCode());
			map.put("returnMessage", zvo.getReturnMessage());
			map.put("errortext", zvo.getErrortext());

		}catch(Exception e){
			map.put("successCode", -1);
			map.put("returnMessage", "신청중에 오류가 났습니다. 고객센터에 문의바랍니다.");
		}
		return map;
	}

	/**
	 * 마이페이지 > 걱정제로 서비스 신청 > 상세 수정
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zeroServiceUpdateProc")
	@ResponseBody
	public Map<String, Object> zeroServiceUpdateProc(HttpServletRequest request, @RequestBody  ZeroServiceListVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String path;
		vo.setDlvrDay(format.format(now));
		ZeroServiceListVO zvo = mypageSvc.saveZeroServiceInsertProc(vo);

		map.put("successCode", zvo.getSuccessCode());
		map.put("returnMessage", zvo.getReturnMessage());
		map.put("errortext", zvo.getErrortext());

		return map;
	}

	/**
	 * 마이페이지 > 서비스신청 > 걱정제로 서비스  상세화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zeroServiceUpdate")
	public String zeroServiceUpdate(HttpServletRequest request, Model model, HttpServletResponse response, ZeroServiceListVO vo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/myRentalList");
			rUrl = "/login/userLogin";
		} else {

			rUrl = "/mypage/zeroServiceUpdate";

			/*vo.setOrdNo("D15000001294");*/
			/* 주문정보 조회  */
			ZeroServiceListVO zvo = mypageSvc.zeroServiceDetail(vo);

			/*휴일 정보 가져 오기*/
			List<RentalOrderVo> hDayList = rentalOrderSvc.selectHDayList();

			/*타이어 서비스 본수 목록*/
			RTCM0050SearchVo searchVO = new RTCM0050SearchVo();
			searchVO.setsCdGrpCd("S089");  // 제조사
			searchVO.setsUseYn("Y");  // 사용여부
			List<RTCM0050Vo> zeroCdList = commonCodeService.selectCommonCodeList(searchVO);

			//시도 조회
			List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

			model.addAttribute("userVo", userVo);			// 고객정보
			model.addAttribute("zeroCdList", zeroCdList);	// 타이어본수
			model.addAttribute("hDayList", hDayList);			// 휴일 목록
			model.addAttribute("selectSiDoList", selectSiDoList);	//시도 조회
			model.addAttribute("resultMap", zvo);	// 주문정보
		}
		return rUrl;
	}

	/**
	 * 마이페이지 > 걱정제로 서비스 신청 > 상세 삭제
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zeroServiceCancel")
	@ResponseBody
	public Map<String, Object> zeroServiceCancel(HttpServletRequest request, @RequestBody  ZeroServiceListVO vo) throws Exception {

		String resultGoList = "N";
		Map<String, Object> map = new HashMap<String, Object>();

		/* 재조회를 해서
		 * 신청취소 가능 여부 확인
		 * */
		ZeroServiceListVO zvo = mypageSvc.zeroCheckList(vo);
		zvo.setDlvStat("03");
		// 접수요청 상태가 아닐 시 취소요청 미승인 리스트로 보낸다.
		if(!"01".equals(zvo.getDlvStat())) {
			resultGoList = "Y";
			map.put("resultGoList", resultGoList);
		}else{
			// 삭제
			ZeroServiceListVO rvo = mypageSvc.saveZeroServiceInsertProc(vo);
			map.put("successCode", zvo.getSuccessCode());
			map.put("returnMessage", zvo.getReturnMessage());
			map.put("errortext", zvo.getErrortext());
		}

		return map;
	}

	/**
	 * 마이페이지 > 서비스신청 > 엔진오일 서비스 신청화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/engineServiceCreate")
	public String engineServiceCreate(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/engineServiceCreate");
			rUrl = "/login/userLogin";
		} else {

			rUrl = "/mypage/oilServiceCreate";

			/*엔진오일 서비스대상자 정보조회*/
			ReRentalVo custInfo = mypageSvc.CusContView(clientVo);


			/*대상자가 있으면 custno를 넣어준다.*/
			if(!"".equals(custInfo) && custInfo != null){
				clientVo.setCustNo(custInfo.getCustNo());
			}
			 /*엔진오일 서비스 리스트 데이터 */
			List<engineOilServiceListVO> oilServiceInsertList  = mypageSvc.oilServiceInsertList(clientVo);


			if(oilServiceInsertList.size() == 0){
				StringBuilder returnPath = new StringBuilder();
				returnPath.append("/main");
				JsPrinter.replace(response, returnPath.toString(), "렌탈 계약 고객에게 제공하는 서비스입니다.");
			}

			/*휴일 정보 가져 오기*/
			List<RentalOrderVo> hDayList = rentalOrderSvc.selectHDayList();

			/*유종코드 목록*/
			RTCM0050SearchVo searchVO1 = new RTCM0050SearchVo();
			searchVO1.setsCdGrpCd("C020");
			searchVO1.setsUseYn("Y");
			List<RTCM0050Vo> oliCdList = commonCodeService.selectCommonCodeList(searchVO1);

			/*연식코드 목록*/
			RTCM0050SearchVo searchVO2 = new RTCM0050SearchVo();
			searchVO2.setsCdGrpCd("C021");
			searchVO2.setsUseYn("Y");
			List<RTCM0050Vo> yearCdList = commonCodeService.selectCommonCodeList(searchVO2);

			/*배기량코드 목록*/
			RTCM0050SearchVo searchVO3 = new RTCM0050SearchVo();
			searchVO3.setsCdGrpCd("C022");
			searchVO3.setsUseYn("Y");
			List<RTCM0050Vo> dispCdList = commonCodeService.selectCommonCodeList(searchVO3);

			/*배송지 구분 목록*/
			RTCM0050SearchVo searchVO4 = new RTCM0050SearchVo();
			searchVO4.setsCdGrpCd("C023");
			searchVO4.setsUseYn("Y");
			List<RTCM0050Vo> dlvCdList = commonCodeService.selectCommonCodeList(searchVO4);

			/*시도 조회*/
			List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

			model.addAttribute("userVo", userVo);				/*고객정보*/
			model.addAttribute("custInfo", custInfo);			/*고객정보*/
			model.addAttribute("hDayList", hDayList);			/*휴일 목록*/
			model.addAttribute("oliCdList", oliCdList);			/*유종코드 목록*/
			model.addAttribute("yearCdList", yearCdList);	/*연식코드 목록*/
			model.addAttribute("dispCdList", dispCdList);		/*배기량코드 목록*/
			model.addAttribute("dlvCdList", dlvCdList);		/*배송지 구분 목록*/
			model.addAttribute("selectSiDoList", selectSiDoList);	//시도 조회
			model.addAttribute("oilServiceInsertList", oilServiceInsertList);// 주문정보
		}
		return rUrl;
	}

	/**
	 * 마이페이지 > 엔진오일 서비스 신청 > 등록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/oilServiceWriteProc")
	@ResponseBody
	public Map<String, Object> oilServiceWriteProc(HttpServletRequest request, @RequestBody  engineOilServiceListVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String path;
		vo.setDlvrDay(format.format(now));
		engineOilServiceListVO zvo = mypageSvc.saveOilServiceInsertProc(vo);

		map.put("successCode", zvo.getSuccessCode());
		map.put("returnMessage", zvo.getReturnMessage());
		map.put("errortext", zvo.getErrortext());

		return map;
	}

	/**
	 * 마이페이지 > 서비스신청 > 엔진오일 서비스 상세 및 수정화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/engineServiceUpdate")
	public String engineServiceUpdate(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		engineOilServiceListVO vo = new engineOilServiceListVO();

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/engineServiceUpdate");
			rUrl = "/login/userLogin";
		} else {
			// 상세내용 조회를 위한 조회조건 세팅
			vo.setOrdNo(request.getParameter("ordNo"));		//계약번호
			vo.setDlvrDay(request.getParameter("dlvrDay"));	//엔진오일신청일자
			vo.setDlvrSeq(request.getParameter("dlvrSeq"));	//엔진오일신청순번

/*			vo.setOrdNo("D15000001294");		//계약번호
			vo.setDlvrDay("20191206");	//엔진오일신청일자
			vo.setDlvrSeq("1");	//엔진오일신청순번
*/

			rUrl = "/mypage/oilServiceUpdate";

			/*엔진오일 서비스대상자 정보조회*/
			ReRentalVo custInfo = mypageSvc.CusContView(clientVo);


			/*엔진오일 고객정보*/
			engineOilServiceListVO oilServiceList = mypageSvc.oilServiceList(vo);

			/*휴일 정보 가져 오기*/
			List<RentalOrderVo> hDayList = rentalOrderSvc.selectHDayList();

			/*유종코드 목록*/
			RTCM0050SearchVo searchVO1 = new RTCM0050SearchVo();
			searchVO1.setsCdGrpCd("C020");
			searchVO1.setsUseYn("Y");
			List<RTCM0050Vo> oliCdList = commonCodeService.selectCommonCodeList(searchVO1);

			/*연식코드 목록*/
			RTCM0050SearchVo searchVO2 = new RTCM0050SearchVo();
			searchVO2.setsCdGrpCd("C021");
			searchVO2.setsUseYn("Y");
			List<RTCM0050Vo> yearCdList = commonCodeService.selectCommonCodeList(searchVO2);

			/*배기량코드 목록*/
			RTCM0050SearchVo searchVO3 = new RTCM0050SearchVo();
			searchVO3.setsCdGrpCd("C022");
			searchVO3.setsUseYn("Y");
			List<RTCM0050Vo> dispCdList = commonCodeService.selectCommonCodeList(searchVO3);

			/*배송지 구분 목록*/
			RTCM0050SearchVo searchVO4 = new RTCM0050SearchVo();
			searchVO4.setsCdGrpCd("C023");
			searchVO4.setsUseYn("Y");
			List<RTCM0050Vo> dlvCdList = commonCodeService.selectCommonCodeList(searchVO4);

			/*시도 조회*/
			List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

			model.addAttribute("userVo", userVo);				/*고객정보*/
			model.addAttribute("custInfo", custInfo);
			model.addAttribute("hDayList", hDayList);			/*휴일 목록*/
			model.addAttribute("oliCdList", oliCdList);			/*유종코드 목록*/
			model.addAttribute("yearCdList", yearCdList);	/*연식코드 목록*/
			model.addAttribute("dispCdList", dispCdList);		/*배기량코드 목록*/
			model.addAttribute("dlvCdList", dlvCdList);		/*배송지 구분 목록*/
			model.addAttribute("selectSiDoList", selectSiDoList);	//시도 조회
			model.addAttribute("oilServiceList", oilServiceList);// 엔진오일 상세
		}

		return rUrl;
	}

	/**
	 * 마이페이지 > 엔진오일 서비스 신청 > 상세 수정
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/engineServiceUpdateProc")
	@ResponseBody
	public Map<String, Object> engineServiceUpdateProc(HttpServletRequest request, @RequestBody  engineOilServiceListVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

		vo.setDlvrDay(format.format(now));
		engineOilServiceListVO zvo = mypageSvc.saveOilServiceInsertProc(vo);

		map.put("successCode", zvo.getSuccessCode());
		map.put("returnMessage", zvo.getReturnMessage());
		map.put("errortext", zvo.getErrortext());

		return map;
	}


	/**
	 * 마이페이지 > 엔진오일 서비스 신청 > 상세 삭제
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/engineServiceCancel")
	@ResponseBody
	public Map<String, Object> engineServiceCancel(HttpServletRequest request, @RequestBody  engineOilServiceListVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		engineOilServiceListVO zvo = mypageSvc.saveOilServiceInsertProc(vo);
		map.put("successCode", zvo.getSuccessCode());
		map.put("returnMessage", zvo.getReturnMessage());
		map.put("errortext", zvo.getErrortext());

		return map;
	}

	/*********************************************** 믿음 추가 ****************************************************************/

	/**
	 * 마이페이지 > 문의 리스트
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/questionList")
	public String questionList(HttpServletRequest request, Model model) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/questionList");
			rUrl = "/login/userLogin";
		} else {
			UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

			if(userVo != null) {
				model.addAttribute("userVo", userVo);
			}

			// header Css 추가
			model.addAttribute("headerCss" , "");
			model.addAttribute("viewGbn", "H");

			rUrl = "/mypage/questionList";
		}

		return rUrl;
	}

	//1:1문의 리스트
	@RequestMapping("/selectQuestionList")
	@ResponseBody
	public Map<String, Object> selectQuestionList(HttpServletRequest request, Model model, @RequestBody QuestionSearchVo vo) throws Exception {
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		vo.setLoginId(userVo.getLoginId());

		PageVo pageVo = new PageVo();
		pageVo.setTotalCount(questionSvc.selectQuestionListCnt(vo));
		pageVo.setPageNo(vo.getPageNo());
		pageVo.setPageSize(5);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("selectQuestionList", questionSvc.selectQuestionList(vo));
		map.put("pageCommon", pageVo);

		//성공일 때 리턴 형식 - 질문 목록 조회는 무조건 성공응로 한다.
		// 이유 : 조회가 1건이든, 0건이든 성공이기 맞는 의미이기 때문.
		map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

		return map;
	}

	/**
	 * 마이페이지 > 문의 상세
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/questionDetail")
	public String questionDetail(HttpServletRequest request, Model model, @RequestParam(required = true) String bdojSeq) throws Exception {
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		QuestionSearchVo searchVo = new QuestionSearchVo();
		searchVo.setBdojSeq(bdojSeq);

		if(userVo != null) {
			model.addAttribute("userVo", userVo);
		}

		QuestionVo questionDetailVo = questionSvc.selectQuestionDetail(searchVo);
		
		if(!questionDetailVo.getWritId().equals(userVo.getLoginId())) {
			logger.debug("---------Controller 사용자 권한 검증 실패!!--------");
			throw new Exception("권한이 없습니다.");
		}
		
		questionDetailVo.setqCont(questionDetailVo.getqCont().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		if(!StringUtils.isEmpty(questionDetailVo.getrCont())) {
			questionDetailVo.setrCont(questionDetailVo.getrCont().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		}
		model.addAttribute("questionDetailVo", questionDetailVo);
		model.addAttribute("qImgPath", AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL) + "/" + WebConstants.RENTAL_FILE_PATH_ATFILE+"/");

		return "/mypage/questionDetail";
	}

	/**
	 * 마이페이지 > 문의 등록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/questionRegister")
	public String questionRegister(HttpServletRequest request, Model model) throws Exception {
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

		if(userVo != null) {
			model.addAttribute("userVo", userVo);
		}

		return "/mypage/questionRegister";
	}

	/**
	 * 마이페이지 > 신규 문의 등록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertQuestion" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> insertQuestion(MultipartHttpServletRequest mRequest, Model model) throws Exception {
		Map<String, Object> rtn = new HashMap<String, Object>();
		mRequest.setCharacterEncoding("UTF-8");

		try {
			QuestionVo questionVo = new QuestionVo();
			String title = mRequest.getParameter("title");
			title = new String(title.getBytes("8859_1"),"utf-8");

			String cont = mRequest.getParameter("cont");
			cont = new String(cont.getBytes("8859_1"),"utf-8");

			questionVo.setTitle(title);
			questionVo.setqCont(cont);
			questionVo.setQustClsCd(mRequest.getParameter("qustClsCd"));

			//첨부이미지
			List<MultipartFile> mfl = mRequest.getFiles("bizFiles");
			List<AttfileVo> list = new ArrayList<AttfileVo>();

			try {
				list = rentalFileService.upload(mfl, WebConstants.RENTAL_FILE_PATH_ATFILE);
			} catch (Exception e) {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
				return rtn;
			}

			String rs = questionSvc.insertQuestion(list, questionVo);
			if("S".equals(rs)) {
				//성공일 때 리턴 형식
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			}else {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
		} catch(Exception e) {
			//실패일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rtn;
	}

	/**
	 * 마이페이지 > 신규 문의 등록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteQuestion")
	@ResponseBody
	public Map<String, Object> deleteQuestion(@RequestBody QuestionVo vo) throws Exception {
		Map<String, Object> rtn = new HashMap<String, Object>();
		String filePath = AppContext.getString(WebConstants.FileDir.UPLOAD_RENTAL_FILE_DIR) + "/" + WebConstants.RENTAL_FILE_PATH_ATFILE + "/";

		try {
			String rs = questionSvc.deleteQuestion(vo, filePath);
			if("S".equals(rs)) {
				//성공일 때 리턴 형식
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} else {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
		} catch(Exception e) {
			//실패일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rtn;
	}

	/**
	 * 마이페이지 > 나의 쿠폰 목록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/couponList")
	public String couponList(HttpServletRequest request, Model model) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/couponList");
			rUrl = "/login/userLogin";
		} else {
			UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

			if(userVo != null) {
				model.addAttribute("userVo", userVo);
			}

			rUrl = "/mypage/couponList";
		}

		return rUrl;
	}

	//1:1문의 리스트
	@RequestMapping("/selectMyCouponList")
	@ResponseBody
	public Map<String, Object> selectMyCouponList(HttpServletRequest request, Model model, @RequestBody MyCouponSearchVo searchVo) throws Exception {


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selectMyCouponList", mypageSvc.selectMyCouponList(searchVo));

		//성공일 때 리턴 형식 - 질문 목록 조회는 무조건 성공응로 한다.
		// 이유 : 조회가 1건이든, 0건이든 성공이기 맞는 의미이기 때문.
		map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

		return map;
	}

	//1:1문의 리스트
	@RequestMapping("/selectMyCouponDispList")
	@ResponseBody
	public Map<String, Object> selectMyCouponDispList(@RequestBody MyCouponSearchVo searchVo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selectMyCouponDispList", mypageSvc.selectMyCouponDispList(searchVo));

		//성공일 때 리턴 형식 - 질문 목록 조회는 무조건 성공응로 한다.
		// 이유 : 조회가 1건이든, 0건이든 성공이기 맞는 의미이기 때문.
		map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

		return map;
	}

	/*********************************************** 믿음 추가 ****************************************************************/
	
	/**
	 * 마이페이지 > 주문리스트(구매,렌탈)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/myRecommend")
	public String myRecommend(HttpServletRequest request, Model model, MypageSearchVo vo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		
		model.addAttribute("searchMonth", "");
		model.addAttribute("userId", "");
		model.addAttribute("custNo", "");
		model.addAttribute("selectPrdList",    	"");
		model.addAttribute("selectPrdListCnt",  "");
		rUrl = "/mypage/myRecommend";
		
/*
		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/myRecommend");
			rUrl = "/login/userLogin";
		} else {
			rUrl = "/mypage/myRecommend";
			Map<String, Object> selectPrdMap = mypageSvc.selectOrderList(clientVo, vo);

			model.addAttribute("searchMonth", vo.getSearchMonth());
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("custNo", userVo.getCustNo());
			model.addAttribute("selectPrdList",    	selectPrdMap.get("myOrdList"));
			model.addAttribute("selectPrdListCnt",    	selectPrdMap.get("myOrdListCnt"));
		}
		*/
		return rUrl;
	}
}
