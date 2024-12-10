package com.nexwrms.mobweb.mypage.ctl;

import java.io.IOException;
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
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nexwrms.cfo.com.cm.svc.AbstractCfoSvc;
import com.nexwrms.cfo.com.cm.svc.AlTalkSendSvc;
import com.nexwrms.cfo.com.cm.svc.AlTalkTemplateSvc;
import com.nexwrms.cfo.com.cm.svc.CmCdSvc;
import com.nexwrms.cfo.com.cm.svc.FileService;
import com.nexwrms.cfo.com.cm.vo.AfileVo;
import com.nexwrms.cfo.com.cm.vo.PageVo;
import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.cfo.com.cm.vo.req.RefCd1RequestVO;
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.cfo.com.cp.constants.CpConstants;
import com.nexwrms.cfo.com.mypage.dao.MyPageDao;
import com.nexwrms.cfo.com.mypage.svc.MypageSvc;
import com.nexwrms.cfo.com.mypage.vo.MyCouponSearchVo;
import com.nexwrms.cfo.com.mypage.vo.MyCouponVo;
import com.nexwrms.cfo.com.mypage.vo.MypageSearchVo;
import com.nexwrms.cfo.com.mypage.vo.MypageVo;
import com.nexwrms.cfo.com.mypage.vo.OrderReviewVo;
import com.nexwrms.cfo.com.order.svc.IvtDtlSvc;
import com.nexwrms.cfo.com.order.svc.OrderSvc;
import com.nexwrms.cfo.com.order.svc.OrderTMS2Svc;
import com.nexwrms.cfo.com.order.svc.SvcBhfSvc;
import com.nexwrms.cfo.com.order.svc.SvcTmapApiCallSvc;
import com.nexwrms.cfo.com.order.vo.ItemTMS2Vo;
import com.nexwrms.cfo.com.order.vo.ItemVo;
import com.nexwrms.cfo.com.order.vo.OrderVo;
import com.nexwrms.cfo.com.order.vo.ReplaceOrderWorkReturnVo;
import com.nexwrms.cfo.com.order.vo.SvcBhfVo;
import com.nexwrms.cfo.com.order.vo.SvcOpertAsignVo;
import com.nexwrms.cfo.com.order.vo.TravelInfoForTourJsonStringParamVo;
import com.nexwrms.cfo.com.order.vo.TravelInfoForTourJsonStringReturnVo;
import com.nexwrms.cfo.com.sv.svc.SvcCpHldySndSvc;
import com.nexwrms.cfo.com.sv.vo.SvcHolidayInfoVo;
import com.nexwrms.cfo.com.tms.dao.TmsOrdDao;
import com.nexwrms.cfo.com.tms.svc.TmsApiSvc;
import com.nexwrms.cfo.com.tms.svc.TmsApiTMS2Svc;
import com.nexwrms.cfo.com.tms.svc.TmsBpStockSvc;
import com.nexwrms.cfo.com.tms.svc.TmsOrdSvc;
import com.nexwrms.cfo.com.tms.svc.TmsOrdTMS2Svc;
import com.nexwrms.cfo.com.tms.svc.TmsWrhMngSvc;
import com.nexwrms.cfo.com.tms.vo.TmsBpStockVo;
import com.nexwrms.cfo.com.tms.vo.TmsChangePndRequestTMS2Vo;
import com.nexwrms.cfo.com.tms.vo.TmsChangeRequestTMS2Vo;
import com.nexwrms.cfo.com.tms.vo.TmsPndRequestTMS2Vo;
import com.nexwrms.cfo.com.tms.vo.TmsPndRequestVo;
import com.nexwrms.cfo.com.tms.vo.TmsRequestTMS2Vo;
import com.nexwrms.cfo.com.tms.vo.TmsRequestVo;
import com.nexwrms.cfo.com.tms.vo.res.PndResponseTMS2Vo;
import com.nexwrms.cfo.com.tms.vo.res.PndResponseVo;
import com.nexwrms.cfo.com.tms.vo.res.ResponseTMS2Vo;
import com.nexwrms.cfo.com.tms.vo.res.ResponseVo;
import com.nexwrms.cfo.com.tms.vo.res.ResultDataBestTMS2Vo;
import com.nexwrms.cfo.com.tms.vo.res.VehicleScheduleListTMS2Vo;
import com.nexwrms.cfo.to.sd.vo.OdRecEvtOrdMstToVo;
import com.nexwrms.cfo.to.sv.vo.SvOpertAsignMstNxToVo;
import com.nexwrms.cfo.util.JsPrinter;
import com.nexwrms.core.constants.CoreConstants;
import com.nexwrms.core.context.AppContext;
import com.nexwrms.core.exception.BizExceptionFactoryBean;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;
import com.nexwrms.core.util.StringUtil;
import com.nexwrms.nextlevel.com.cm.svc.CommonCodeService;
import com.nexwrms.nextlevel.com.cm.svc.RentalFileService;
import com.nexwrms.nextlevel.com.cm.vo.AttfileVo;
import com.nexwrms.nextlevel.com.cm.vo.RTCM0050SearchVo;
import com.nexwrms.nextlevel.com.cm.vo.RTCM0050Vo;
import com.nexwrms.nextlevel.com.login.vo.ReRentalVo;
import com.nexwrms.nextlevel.com.mypage.dao.RentalMyPageDao;
import com.nexwrms.nextlevel.com.mypage.svc.OrderReviewSvc;
import com.nexwrms.nextlevel.com.mypage.svc.QuestionSvc;
import com.nexwrms.nextlevel.com.mypage.svc.RentalMypageSvc1;
import com.nexwrms.nextlevel.com.mypage.vo.FreeDamageServiceVO;
import com.nexwrms.nextlevel.com.mypage.vo.MypageOrderVO;
import com.nexwrms.nextlevel.com.mypage.vo.OrderPerReviewVo;
import com.nexwrms.nextlevel.com.mypage.vo.PayResultVO;
import com.nexwrms.nextlevel.com.mypage.vo.PtnInfVO;
import com.nexwrms.nextlevel.com.mypage.vo.QuestionSearchVo;
import com.nexwrms.nextlevel.com.mypage.vo.QuestionVo;
import com.nexwrms.nextlevel.com.mypage.vo.RentalMypageVo1;
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
@RequestMapping("/mypage")
@Controller
public class MyPageTmsCtl extends AbstractCfoSvc {
	private static final Logger logger = LoggerFactory.getLogger(MyPageTmsCtl.class);

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.AlTalkSendSvc")
	private AlTalkSendSvc alTalkSendSvc;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.order.svc.OrderSvc")
	private OrderSvc orderSvc;


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

    /** TMS 추가 **/
    @Autowired
	@Qualifier("com.nexwrms.cfo.com.tms.svc.TmsOrdSvc")
	private TmsOrdSvc tmsOrdSvc;

    @Autowired
	@Qualifier("com.nexwrms.cfo.order.svc.SvcTmapApiCallSvc")
	private SvcTmapApiCallSvc svcTmapApiCallSvc;

    @Autowired
	@Qualifier("com.nexwrms.cfo.com.tms.svc.TmsWrhMngSvc")
	private TmsWrhMngSvc tmsWrhMngSvc;

    @Autowired
	private SvcBhfSvc svcBhfSvc;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.tms.svc.TmsApiService")
	private TmsApiSvc tmsApiService;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.tms.svc.TmsBpStockSvc")
	private TmsBpStockSvc tmsBpStockSvc;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.order.svc.IvtDtlSvc")
	private IvtDtlSvc ivtDtlSvc;

	@Autowired
	@Qualifier("com.nexwrms.nextlevel.com.member.svc.RentalMypageSvc1")
    private RentalMypageSvc1 rentalMypageSvc1;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.AlTalkTemplateSvc")
	private AlTalkTemplateSvc alTalkTemplateSvc;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.sv.svc.SvcCpHldySndSvc")
	SvcCpHldySndSvc svcCpHldySndSvc;

	//TMS2 추가
	@Autowired
	@Qualifier("com.nexwrms.cfo.com.tms.svc.TmsApiTMS2Svc")
	private TmsApiTMS2Svc tmsApiTMS2Service;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.tms.svc.TmsOrdTMS2Svc")
	private TmsOrdTMS2Svc tmsOrdTMS2Svc;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.order.svc.OrderTMS2Svc")
	private OrderTMS2Svc orderTMS2Svc;

	@Autowired
    @Qualifier("com.nexwrms.cfo.com.cm.svc.CmCdSvc")
    private CmCdSvc cmCdSvc;

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
			if(StringUtils.isEmpty(vo.getOrdNo())) {
				model.addAttribute("sendUrl", "/mypage/orderList");
				rUrl = "/login/userLogin";
			} else {
				rUrl = "/mypage/orderList";

				if(StringUtils.isEmpty(vo.getCustNm()) && StringUtils.isEmpty(vo.getMobNo())) {
					MypageVo nonCustInfoVo = mypageSvc.selectNonCustReviewInfo(vo);
					vo.setCustNm(nonCustInfoVo.getCustNm());
					vo.setMobNo(nonCustInfoVo.getMobNo());
				}

				List<MypageVo> selectNonCustOrdList = mypageSvc.selectNonCustOrderList(vo);

				int totCnt = 0;
				if(selectNonCustOrdList.size() > 0 )totCnt = selectNonCustOrdList.get(0).getTotListCnt();


				model.addAttribute("searchMonth", vo.getSearchMonth());
				model.addAttribute("selectPrdList", selectNonCustOrdList);
				model.addAttribute("selectPrdListCnt", totCnt);
				model.addAttribute("custNo", selectNonCustOrdList.get(0).getCustNo());
				model.addAttribute("custNm", vo.getCustNm());
				model.addAttribute("mobNo", vo.getMobNo());
			}
		} else {
			rUrl = "/mypage/orderList";
			Map<String, Object> selectPrdMap = mypageSvc.selectOrderList(clientVo, vo);

			int totCnt = 0;
			List<MypageVo> sumList = (ArrayList<MypageVo>)selectPrdMap.get("myOrdList");
			if(sumList.size() > 0 ) {
				totCnt = sumList.size();
				
				// o2o 주문내역의 custNo로 가지고오도록 변경
				if(sumList.get(0).getCustNo() != null || !sumList.get(0).getCustNo().isEmpty()) {
					model.addAttribute("custNo", sumList.get(0).getCustNo());
				} else {
					model.addAttribute("custNo", userVo.getCustNo());
				}
			} else {
				model.addAttribute("custNo", userVo.getCustNo());
			}

			model.addAttribute("searchMonth", vo.getSearchMonth());
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("selectPrdList",    sumList);
			model.addAttribute("selectPrdListCnt",  totCnt);
		}
		
		//10233006 GA title tag 동적 변경
		if(StringUtil.equals(rUrl, "/login/userLogin")) {
			model.addAttribute("title", "나의 주문내역_로그인 | NEXT LEVEL");
		}else if(StringUtil.equals(rUrl, "/mypage/orderList")) {
			model.addAttribute("title", "나의 주문내역 | NEXT LEVEL");
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
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

		if(clientVo == null || "".equals(clientVo)) {
			rUrl = "/mypage/orderPoDetail";

			//List<MypageVo> o2oOrderList = cboCmDao.selectList(MyPageDao.selectOrderDetailList, vo);
			List<MypageVo> o2oOrderList = cboCmDao.selectList(MyPageDao.selectOrderList, vo);
			MypageVo ordInfo = cboCmDao.selectOne(MyPageDao.selectOrderInfo, vo);
			//옵션 상품
			List<MypageVo> o2oOptionItemList = cboCmDao.selectList(MyPageDao.selectOptionItemList, vo);

			if(o2oOrderList.size() > 0) {
				model.addAttribute("myOrdDetailInfo", ordInfo);
				model.addAttribute("carModelNm"     , vo.getCarModelNm());
				model.addAttribute("myOrdDetail"    , o2oOrderList);
				model.addAttribute("myOrdOptList"   , o2oOptionItemList);
				model.addAttribute("custNo"         , o2oOrderList.get(0).getCustNo());
				model.addAttribute("custNm"         , ordInfo.getCustNm());
				model.addAttribute("mobNo"          , ordInfo.getMobNo().replace("-", ""));
			} else {//화면에서 validation 체크를 했지만 걸리지 않았을 경우 체크
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, "일치하는 주문번호가 없습니다.");
				rUrl = "/login/userLogin";
			}
		} else {
			Map<String, Object> selectPrdMap = mypageSvc.selectOrderDetail(clientVo, vo);
			if("O".equals(vo.getOrdergbn())){
				rUrl = "/mypage/orderPoDetail";
				model.addAttribute("custNo"          , userVo.getCustNo());
				model.addAttribute("myOrdDetailInfo" , selectPrdMap.get("myOrdDetailInfo"));
				model.addAttribute("myOrdOptList"    , selectPrdMap.get("myOrdOptList"));
			}else if("R".equals(vo.getOrdergbn())){
				rUrl = "/mypage/orderRenDetail";
				model.addAttribute("o2oShopYn"       , selectPrdMap.get("o2oShopYn"));
			}else{
				rUrl = "/main";
			}
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("carModelNm", vo.getCarModelNm());
			model.addAttribute("myOrdDetail",    	selectPrdMap.get("myOrdDetail"));
		}
		return rUrl;
	}

	@RequestMapping("/orderDetailTMS2")
	public String orderDetailTMS2(HttpServletRequest request, Model model, MypageSearchVo vo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

		if(clientVo == null || "".equals(clientVo)) {
			rUrl = "/mypage/orderPoDetailTMS2";

			//List<MypageVo> o2oOrderList = cboCmDao.selectList(MyPageDao.selectOrderDetailList, vo);
			List<MypageVo> o2oOrderList = cboCmDao.selectList(MyPageDao.selectOrderList, vo);
			MypageVo ordInfo = cboCmDao.selectOne(MyPageDao.selectOrderInfo, vo);
			//옵션 상품
			List<MypageVo> o2oOptionItemList = cboCmDao.selectList(MyPageDao.selectOptionItemList, vo);

			if(o2oOrderList.size() > 0) {
				model.addAttribute("myOrdDetailInfo", ordInfo);
				model.addAttribute("carModelNm"     , vo.getCarModelNm());
				model.addAttribute("myOrdDetail"    , o2oOrderList);
				model.addAttribute("myOrdOptList"   , o2oOptionItemList);
				model.addAttribute("custNo"         , o2oOrderList.get(0).getCustNo());
				model.addAttribute("custNm"         , ordInfo.getCustNm());
				model.addAttribute("mobNo"          , ordInfo.getMobNo().replace("-", ""));
			} else {//화면에서 validation 체크를 했지만 걸리지 않았을 경우 체크
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, "일치하는 주문번호가 없습니다.");
				rUrl = "/login/userLogin";
			}
		} else {
			clientVo.setCustNo(vo.getCustNo());
			Map<String, Object> selectPrdMap = mypageSvc.selectOrderDetail(clientVo, vo);
			if("O".equals(vo.getOrdergbn())){
				rUrl = "/mypage/orderPoDetailTMS2";
				model.addAttribute("custNo"          , userVo.getCustNo());
				model.addAttribute("myOrdDetailInfo" , selectPrdMap.get("myOrdDetailInfo"));
				model.addAttribute("myOrdOptList"    , selectPrdMap.get("myOrdOptList"));
			}else if("R".equals(vo.getOrdergbn())){
				rUrl = "/mypage/orderRenDetailTMS2";
				model.addAttribute("o2oShopYn"       , selectPrdMap.get("o2oShopYn"));
			}else{
				rUrl = "/main";
			}
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("carModelNm", vo.getCarModelNm());
			model.addAttribute("myOrdDetail",    	selectPrdMap.get("myOrdDetail"));
		}
		
		//10233006 GA title tag 동적 변경
		if(StringUtil.equals(rUrl, "/mypage/orderPoDetailTMS2")) {
			model.addAttribute("title", "나의 주문내역 상세 | NEXT LEVEL");
		}else if(StringUtil.equals(rUrl, "/mypage/orderRenDetailTMS2")) {
			model.addAttribute("title", "나의 렌탈관리 상세 | NEXT LEVEL");
		}else if(StringUtil.equals(rUrl, "/login/userLogin")) {
			model.addAttribute("title", "로그인 | NEXT LEVEL");
		}else if(StringUtil.equals(rUrl, "/main")) {
			model.addAttribute("title", "메인 | NEXT LEVEL");
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
		String rUrl = "/mypage/orderRivew";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		String bdojSeq = request.getParameter("bdojSeq");
		String usePsNo = request.getParameter("usePsNo");

		logger.debug("::::::::::bdojSeq:::::::::::::"+bdojSeq);
		logger.debug(":::::::::::usePsNo::::::::::::"+usePsNo);

		if(clientVo == null || "".equals(clientVo)) {
			MypageSearchVo searchVo = new MypageSearchVo();
			searchVo.setOrdNo(request.getParameter("ordNo"));
			MypageVo selectNonCustOrdInfo = mypageSvc.selectNonCustReviewInfo(searchVo);

			if(selectNonCustOrdInfo != null) {
				logger.debug("nonCust Review Search");
				model.addAttribute("userId", selectNonCustOrdInfo.getCustNo());
				model.addAttribute("ordNo",request.getParameter("ordNo"));
				model.addAttribute("dpNo",request.getParameter("dpNo"));
				model.addAttribute("pattenCd", request.getParameter("pattenCd"));

				// 동현 추가
				model.addAttribute("reviewGbn", request.getParameter("reviewGbn"));
				model.addAttribute("itemCd",    request.getParameter("itemCd"));
			} else {
				logger.debug("nonCust Review Error");
				model.addAttribute("sendUrl", "/mypage/orderList");
				rUrl = "/login/userLogin";
			}
		} else {
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("ordNo",request.getParameter("ordNo"));
			model.addAttribute("dpNo",request.getParameter("dpNo"));
			model.addAttribute("pattenCd", request.getParameter("pattenCd"));

			// 동현 추가
			model.addAttribute("reviewGbn", request.getParameter("reviewGbn"));
			model.addAttribute("itemCd",    request.getParameter("itemCd"));
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
		String rUrl = "/mypage/orderRivewUpd";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		//request.setCharacterEncoding("utf-8");

		if(clientVo == null || "".equals(clientVo)) {
			MypageSearchVo searchVo = new MypageSearchVo();
			searchVo.setOrdNo(vo.getOrdNo());
			MypageVo selectNonCustOrdInfo = mypageSvc.selectNonCustReviewInfo(searchVo);

			if(selectNonCustOrdInfo != null) {
				vo.setCustNo(selectNonCustOrdInfo.getCustNo());
				OrderReviewVo review = mypageSvc.orderRivewView(vo);

				String classNm = vo.getClassNm();
				String dispSize = request.getParameter("dispSize");

				model.addAttribute("custNo", selectNonCustOrdInfo.getCustNo());
				model.addAttribute("userId", selectNonCustOrdInfo.getCustNo());
				model.addAttribute("reviewGbn", vo.getSystemGbn());
				model.addAttribute("review", review);
				model.addAttribute("classNm", classNm);
				model.addAttribute("dispSize", dispSize);
				model.addAttribute("reviewAtfl", mypageSvc.orderRivewViewAtfl(review));
			} else {
				model.addAttribute("sendUrl", "/mypage/orderList");
				rUrl = "/login/userLogin";
			}
		} else {
			OrderReviewVo review = mypageSvc.orderRivewView(vo);

			String classNm = vo.getClassNm();
			String dispSize = request.getParameter("dispSize");

			model.addAttribute("custNo", clientVo.getCustNo());
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("reviewGbn", vo.getSystemGbn());
			model.addAttribute("review", review);
			model.addAttribute("classNm", classNm);
			model.addAttribute("dispSize", dispSize);
			model.addAttribute("reviewAtfl", mypageSvc.orderRivewViewAtfl(review));
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
			// 동현 수정
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

			String ordNo     = mRequest.getParameter("ordNo");
			String dpPrNo    = mRequest.getParameter("dpPrNo");
			String updateGbn = mRequest.getParameter("updateGbn");
			String usePsNo   = mRequest.getParameter("usePsNo");
			String patternCd = mRequest.getParameter("patternCd");
			String itemCd    = mRequest.getParameter("itemCd");

			orderPerReviewVo.setGrdPt1(grdpt1);
			orderPerReviewVo.setGrdPt2(grdpt2);
			orderPerReviewVo.setGrdPt3(grdpt3);
			orderPerReviewVo.setOrdNo(ordNo);
			orderPerReviewVo.setDpPrNo(dpPrNo);
			orderPerReviewVo.setUsePsNo(usePsNo);

			orderPerReviewVo.setPatternCd(patternCd);
			orderPerReviewVo.setUpdateGbn(updateGbn);
			orderPerReviewVo.setItemCd(itemCd);
			orderPerReviewVo.setOrdChn("R");
			// 동현 수정 끝

			String fileYn[] = mRequest.getParameterValues("fileYn"); // 첨부이미지 수정시 구별값

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

			orderPerReviewVo.setFileYn(fileYn);
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
			String itemCd = mRequest.getParameter("itemCd");

			orderPerReviewVo.setGrdPt1(grdpt1);
			orderPerReviewVo.setGrdPt2(grdpt2);
			orderPerReviewVo.setGrdPt3(grdpt3);
			orderPerReviewVo.setOrdNo(ordNo);
			orderPerReviewVo.setDpPrNo(dpPrNo);
			orderPerReviewVo.setUsePsNo(usePsNo);

			orderPerReviewVo.setPatternCd(mRequest.getParameter("patternCd"));
			orderPerReviewVo.setUpdateGbn(updateGbn);

			//동현추가
			orderPerReviewVo.setItemCd(itemCd);
			orderPerReviewVo.setOrdChn("O");

			String fileYn[] = mRequest.getParameterValues("fileYn"); // 첨부이미지 수정시 구별값

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

			orderPerReviewVo.setFileYn(fileYn);
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

		String rUrl = "/mypage/orderRivewView";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		if(clientVo == null || "".equals(clientVo)) {
			MypageSearchVo searchVo = new MypageSearchVo();
			searchVo.setOrdNo(vo.getOrdNo());
			MypageVo selectNonCustOrdInfo = mypageSvc.selectNonCustReviewInfo(searchVo);

			if(selectNonCustOrdInfo != null) {
				vo.setCustNo(selectNonCustOrdInfo.getCustNo());
				OrderReviewVo review = mypageSvc.orderRivewView(vo);

				String classNm = vo.getClassNm();
				String dispSize = request.getParameter("dispSize");

				model.addAttribute("custNo", selectNonCustOrdInfo.getCustNo());
				model.addAttribute("userId", selectNonCustOrdInfo.getCustNo());
				model.addAttribute("systemGbn", vo.getSystemGbn());
				model.addAttribute("review", review);
				model.addAttribute("classNm", classNm);
				model.addAttribute("dispSize", dispSize);
				model.addAttribute("reviewAtfl", mypageSvc.orderRivewViewAtfl(review));

			} else {
				model.addAttribute("sendUrl", "/mypage/orderList");
				rUrl = "/login/userLogin";
			}
		} else {
			OrderReviewVo review = mypageSvc.orderRivewView(vo);

			String classNm = vo.getClassNm();
			String dispSize = request.getParameter("dispSize");

			model.addAttribute("custNo", clientVo.getCustNo());
			model.addAttribute("userId", clientVo.getCustId());
			model.addAttribute("systemGbn", vo.getSystemGbn());
			model.addAttribute("review", review);
			model.addAttribute("classNm", classNm);
			model.addAttribute("dispSize", dispSize);
			model.addAttribute("reviewAtfl", mypageSvc.orderRivewViewAtfl(review));
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
			rUrl = "/mypage/orderList?ordNo="+vo.getOrdNo();
		} else {
			rUrl = "/mypage/orderList";
		}

		try{
//			delSucc = mypageSvc.orderRivewDel(vo);
			delSucc = mypageSvc.orderRivewDelNew(vo);
		}catch(Exception e){
			rUrl = "/main";
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
			map.put("errortext", e.getMessage());
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
		
		//10233006 GA title tag 동적 변경
		if(StringUtil.equals(rUrl, "/login/userLogin")) {
			model.addAttribute("title", "1:1문의_로그인 | NEXT LEVEL");
		}else if(StringUtil.equals(rUrl, "/mypage/questionList")) {
			model.addAttribute("title", "1:1 문의 | NEXT LEVEL");
		}

		return "/mypage/questionList";
	}

	//1:1문의 리스트
	@RequestMapping("/selectQuestionList")
	@ResponseBody
	public Map<String, Object> selectQuestionList(HttpServletRequest request, Model model, @RequestBody QuestionSearchVo vo) throws Exception {
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		Map<String, Object> map = new HashMap<String, Object>();

		if(clientVo == null) {
			map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		} else {
			vo.setLoginId(clientVo.getCustId());

			PageVo pageVo = new PageVo();
			pageVo.setTotalCount(questionSvc.selectQuestionListCnt(vo));
			pageVo.setPageNo(vo.getPageNo());
			pageVo.setPageSize(5);

			map.put("selectQuestionList", questionSvc.selectQuestionList(vo));
			map.put("pageCommon", pageVo);

			//성공일 때 리턴 형식 - 질문 목록 조회는 무조건 성공응로 한다.
			// 이유 : 조회가 1건이든, 0건이든 성공이기 맞는 의미이기 때문.
			map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		}

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

		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/questionList");
			rUrl = "/login/userLogin";
		} else {
			if(userVo != null) {
				model.addAttribute("userVo", userVo);
			}

			QuestionVo questionDetailVo = questionSvc.selectQuestionDetail(searchVo);
			
			if(!questionDetailVo.getWritId().equals(userVo.getLoginId())) {
				logger.debug("---------Controller 사용자 권한 검증 실패!!--------");
				throw new Exception("조회 권한이 없습니다.");
			}
			
			questionDetailVo.setqCont(questionDetailVo.getqCont().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
			if(!StringUtils.isEmpty(questionDetailVo.getrCont())) {
				questionDetailVo.setrCont(questionDetailVo.getrCont().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
			}
			model.addAttribute("questionDetailVo", questionDetailVo);
			model.addAttribute("qImgPath", AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL) + "/" + WebConstants.RENTAL_FILE_PATH_ATFILE+"/");

			rUrl = "/mypage/questionDetail";
		}

		return rUrl;
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

		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/questionList");
			rUrl = "/login/userLogin";
		} else {
			if(userVo != null) {
				model.addAttribute("userVo", userVo);
			}

			rUrl = "/mypage/questionRegister";
		}

		return rUrl;
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
	public String couponList(HttpServletRequest request, Model model, MyCouponSearchVo vo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

		if(clientVo == null || "".equals(clientVo)) {
			if(StringUtils.isEmpty(vo.getOrdNo())) {
				model.addAttribute("sendUrl", "/mypage/couponList");
				rUrl = "/login/userLogin";
			} else {
				rUrl = "/mypage/couponList";

				model.addAttribute("ordNo", vo.getOrdNo());
				model.addAttribute("custNm", vo.getCustNm());
				model.addAttribute("mobNo", vo.getMobNo());
			}
		} else {

			if(userVo != null) {
				model.addAttribute("userVo", userVo);
			}

			rUrl = "/mypage/couponList";
		}
		
		//10233006 GA title tag 동적 변경
		if(StringUtil.equals(rUrl, "/login/userLogin")) {
			model.addAttribute("title", "나의쿠폰_로그인 | NEXT LEVEL");
		}else if(StringUtil.equals(rUrl, "/mypage/couponList")) {
			model.addAttribute("title", "나의쿠폰 | NEXT LEVEL");
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

	//쿠폰등록
	@RequestMapping("/selectMyCpnDownLoad")
	@ResponseBody
	public Map<String, Object> selectMyCpnDownLoad(@RequestBody MyCouponSearchVo searchVo) throws Exception {


		Map<String, Object> map = new HashMap<String, Object>();

		try {
			String msg = mypageSvc.selectMyCpnDownLoad(searchVo);
			map.put("msg", msg);
			if("S".equals(msg)) {

				map.put("selectMyCouponList", mypageSvc.selectMyCouponList(searchVo));
				//성공일 때 리턴 형식
				map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} else {
				map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				map.put(WebConstants.Rtn.RETURN_MESSEGE, msg);
			}
		} catch(Exception e) {
			//실패일 때 리턴 형식
			map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return map;
	}

	/*********************************************** 믿음 추가 ****************************************************************/
	/**
	 * 마이페이지 > 주문상세(구매) > 작업요청 시간변경
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectChangableDate")
	@ResponseBody
	public Map<String, Object> selectChangableDate(HttpServletRequest request, @RequestBody OrderVo orderVo) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();

  		try {
  			SvcBhfVo vo = new SvcBhfVo();
  			List<ItemVo> bhfItemList = new ArrayList<ItemVo>();
			List<Map> reqItems = new ArrayList<Map>();
			//String nowUseStock = "RDC";
			List<OrderVo> orderInfoList = new ArrayList<OrderVo>();

			int wmChk = cboCmDao.selectOne(TmsOrdDao.selectWmStsChk, orderVo.getOrdNo());

			if(wmChk > 0){
				//throw BizExceptionFactoryBean.getInstance().createBizException("CMA0016", new String[] {"주문번호"});  //이/가 존재하지 않습니다.
  				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
  	  			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "이미 제품수령 하였습니다.");
			}else{
				//주문 정보 조회
				if(StringUtils.isEmpty(orderVo.getOrdNo())) {
					orderInfoList = tmsOrdSvc.selectMypageRentOrdInfoList(orderVo.getRentalOrdNo());
					orderVo.setOrdNo(orderInfoList.get(0).getOrdNo());
				} else {
					orderInfoList = tmsOrdSvc.selectMypageOrdInfoList(orderVo.getOrdNo());
				}

				//배정정보 조회
				List<SvcOpertAsignVo> asignInfoList = tmsOrdSvc.selectAsignInfoList(orderVo.getOrdNo());

				if(orderInfoList.size() > 0 && asignInfoList.size() > 0) {
					//구매에서 호출했으면
					if(StringUtils.isEmpty(orderVo.getRentalOrdNo())) {
						for(OrderVo ordVo : orderInfoList) {
							Map<String, Object> map = new HashMap<String, Object>();
							map.put("itemCd", ordVo.getItemCd());
							map.put("reqQy", ordVo.getOrdQy());
							reqItems.add(map);

							ItemVo itemVo = new ItemVo();
							itemVo.setItemCd(ordVo.getItemCd());
							itemVo.setReqQy(Integer.parseInt(ordVo.getOrdQy()));
							bhfItemList.add(itemVo);
						}

						vo.setO2oYn("N"); 			//o2o구분
						vo.setItemList(reqItems);  					 //상품
						vo.setAddr(orderInfoList.get(0).getIplAddr());   		//주소
						vo.setOpertSe(asignInfoList.get(0).getOpertSe());      	//작업 구분

						String bpStockYn = "N";//거점재고 여부
						//전문점:40, 방문:10, P&D:20,25,30
						//전문점 1건, 방문 1건, P&D: 3건
						orderVo.setRentalGbn("P");
						String nowUseStock = tmsOrdSvc.selectNowBhfRdcInfo(orderVo);
						/*
						 * 출고예정 정보가 있다면 거점재고를 사용하고 있는 것이다. 2020.08.26
						 *
						 * 수정내용 : 현재 사용 재고 정보를 그대로 가져온다. FN_SV_0009
						 * 수정사유 : 발주가 입고되고 출고예정 정보로 바뀐다면 거점재고 사용으로 착각될 수 있음.
						 * 수정일 : 2020.08.28
						 */
						if("RDC".equals(nowUseStock)) {
							List<Map<String, Object>> searchList = new ArrayList<Map<String,Object>>();
							Map<String, Object> searchMap = new HashMap<String, Object>();

							//거점의 조직코드, 창고코드를 가져온다.
							TmsBpStockVo tmsBpStockSearchVo = new TmsBpStockVo();
							tmsBpStockSearchVo.setBhfCd(asignInfoList.get(0).getProcDueBhf());
							TmsBpStockVo rtnTmsBpStockVo = tmsBpStockSvc.selectTmsBpOrdInfo(tmsBpStockSearchVo);

							//거점코드, 아이템리스트 bhfcd 를 이용해서 orzg.. 테이블의 orzg_cd랑 비교해서 여기서 wrhCd 가져온다음  itemCd랑 reqQy 두개를 맵에담아서 리스트로 이건 있어요
							searchMap.put("reqItems", reqItems);
							searchMap.put("wrhCd", rtnTmsBpStockVo.getWrhCd());
							searchList.add(searchMap);
							List<Map<String, Object>> rtnList = ivtDtlSvc.checkByOrderable(searchList);

							if(rtnList.size() > 0) {
								if(rtnTmsBpStockVo.getWrhCd().equals(rtnList.get(0).get("wrhCd"))) {
									if("Y".equals(rtnList.get(0).get("yn"))) {
										bpStockYn = "Y";
									} else {
										bpStockYn = "N";
									}
								} else {
									bpStockYn = "N";
								}
							} else {
								bpStockYn = "N";
							}
						} else {
							//출고예정 정보가 있는 경우 거점 재고 체크를 하지 않고 무조건 가능하다고 함. 이미 재고를 잡고 있기 때문. 2020.08.26
							bpStockYn = "Y";
						}

						/*
						 * 재고 이슈로 인해 임시로 거점 재고 사용 못하도록 수정.(2020.07.24 요청자 : namyh)
						 */
						//bpStockYn = "N";

						rsMap.put("bpStockYn",bpStockYn);

						//거점 재고 : RDC 재고
						/*
						 * Y : Y = 1~3일 거점재고 사용 , 나머지는 RDC발주
						 * Y : N = 거점재고 사용
						 * N : Y = RDC 발주
						 * N : N = 재고 없음
						 */
						/*
						 * 내용 : 현재 사용 재고가 RDC라면 RDC재고 체크를 했더라도 무조건 있다고 한다.
						 * 수정일 : 2020.11.04
						 */
						String rdcStockYn = "N";
						if("RDC".equals(nowUseStock)) {
							rdcStockYn = "Y";
						}else{
							rdcStockYn = svcBhfSvc.selectRdcList(vo);//RDC재고 체크된 결과, 가까운거 1개만 재고 조회해서 있는지 없는지만 판단.
						}
						rsMap.put("rdcStockYn",rdcStockYn);

	//					if("N".equals(bpStockYn) && "N".equals(rdcStockYn)){//거점 재고도 없고, rdc 재고도 없을때
	//		  				//실패일 때 리턴 형식
	//		  				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
	//		  				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "재고 일시 품절로 주문이 불가합니다.");
	//		  			} else{ //거점 재고든 rdc 재고든 있을때
			  				//rsMap.put("o2oYn", orderVo.getO2oYn());

			  				rsMap.put("reqDe", asignInfoList.get(0).getDueDe());//기존요청일
			  				rsMap.put("mountCd", asignInfoList.get(0).getOpertSe());//장착서비스
			  				rsMap.put("orgzCd", asignInfoList.get(0).getProcDueBhf());//거점코드
			  				logger.debug(nowUseStock);
			  				rsMap.put("nowUseStock", nowUseStock);//현재 사용중인 재고
			  				rsMap.put("drvProcDueBay", asignInfoList.get(0).getDrvProcDueBay()); //드라이브스루 bay

			  				//성공일 때 리턴 형식
			  				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			  				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
	//		  			}
					}
					//렌탈에서 호출했으면
					else {
						/*
						 * 2. 렌탈 상세 > 변경 > 달력
						 * 	- 내가 BHF 였을 때 : 날짜와 시간만 변경되고 아무것도 하지 않는다.
						 * 					BHF -> RDC 가더라도 출고데이터 조정을 하지 않는다.
						 * 					(질문) BHF -> RDC 로 바꾸고 , 다시 화면을 들어가면 , 출고데이터가 존재하기 때문에(첫주문때 BHF, 변경떄 RDC) 또 BHF 로 판단.
						 *					(답) 상관없다. 첫 주문이 BHF 였다면 얘가 RDC든 BHF 든 상관없이 거점 재고 쓰는거다.
						 *	- 내가 RDC 였을 때 : 요청 날짜 이전 날짜는 모두 제거(날짜를 앞당길 수 없다.)
						 *					즉, RDC -> BHF 로 가는 일은 존재 하지 않는다.
						 */

						int chkBhfPo = tmsOrdSvc.selectChkBhfPoInfo(orderVo.getOrdNo());

						//첫 주문이 BHF 였을 때
						if(chkBhfPo > 0) {
							rsMap.put("poBhfType", "BHF");
						}
						//첫 주문이 RDC 였을때
						else {
							rsMap.put("poBhfType", "RDC");
						}

						//렌탈 상세에서 사용.
						rsMap.put("o2oOrdNo", orderVo.getOrdNo());

						rsMap.put("reqDe", asignInfoList.get(0).getDueDe());//기존요청일
		  				rsMap.put("mountCd", asignInfoList.get(0).getOpertSe());//장착서비스
		  				rsMap.put("orgzCd", asignInfoList.get(0).getProcDueBhf());//거점코드

		  				//성공일 때 리턴 형식
		  				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		  				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
					}

					//휴일 정보 가져 오기
					List<RentalOrderVo> hDayList = rentalOrderSvc.selectHDayList();
					rsMap.put("hDayList", hDayList);
				} else {
	  				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
	  	  			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "주문 정보가 없습니다.");
	  			}
			}

  		} catch(Exception e) {
  			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
  			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, e.getMessage());
  		}

  		return rsMap;
	}

	/**
	 * 요일에 따른 시간 조회(TMS)
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("selectChangeTmsSetTime")
	@ResponseBody
	public Map<String , Object> selectChangeTmsSetTime(HttpServletRequest request, @RequestBody OrderVo orderVo) throws Exception {
		Map<String , Object> rsMap = new HashMap<String, Object>();

		try {
			//주문 정보 조회
			List<OrderVo> orderInfoList = tmsOrdSvc.selectMypageOrdInfoList(orderVo.getOrdNo());

			//배정정보 조회
			List<SvcOpertAsignVo> asignInfoList = tmsOrdSvc.selectAsignInfoList(orderVo.getOrdNo());

			if(orderInfoList.size() > 0 && asignInfoList.size() > 0) {
				if("10".equals(asignInfoList.get(0).getOpertSe())) {
					//1. 기환 과장님이 만들어준 API 호출.
					TmsRequestVo tmsRequestVo = new TmsRequestVo();
					tmsRequestVo.setReqDt(orderVo.getMountDt());
					tmsRequestVo.setCity(orderInfoList.get(0).getCity());
					tmsRequestVo.setCounty(orderInfoList.get(0).getCounty());
					tmsRequestVo.setDong(orderInfoList.get(0).getDong());
					tmsRequestVo.setBasementPsbYn(orderInfoList.get(0).getBasementYn());
					tmsRequestVo.setBhfType(orderVo.getBhfType());
					tmsRequestVo.setPeriod(orderVo.getAmPmGbn());
					tmsRequestVo.setAddress1(orderInfoList.get(0).getIplAddr());
					tmsRequestVo.setAddress2(orderInfoList.get(0).getIplDtlAddr());
					tmsRequestVo.setSvcTyCd(asignInfoList.get(0).getOpertSe());
					tmsRequestVo.setTmsOrderId(asignInfoList.get(0).getTmsOrderId());

					List<ItemVo> bhfItemList = new ArrayList<ItemVo>();
		  			int totQty = 0;
		  			String optPlcNo = "";
					for(OrderVo odVo : orderInfoList){
						ItemVo itemVo = new ItemVo();
						itemVo.setItemCd(odVo.getItemCd());
						itemVo.setReqQy(Integer.parseInt(odVo.getOrdQy()));
						bhfItemList.add(itemVo);

						/*
						 * 내용 1 : 작업시간 계산을 위한 totQy는 타이어만 해당된다. 서비스 품목은 제외.
						 * 내용 2 : 상품옵션 코드를 넣어서 작업시간 계산을 적용한다.
						 * 수정일 : 2020.10.28
						 * 수정자 : 박믿음
						 */
						if(StringUtils.isEmpty(odVo.getParntsItemCd())) {
							totQty += Integer.parseInt(odVo.getOrdQy());
						} else {
							//상품옵션정책이 얼라인먼트인 것의 처리방법(정비 or 쿠폰) 값을 가져온다.
							//작업일 : 2020.12.28
							if(StringUtil.equals("700882", odVo.getItemCd())) {
								tmsRequestVo.setWheelAlignment(odVo.getAlignYn());

								/*
								 * 렌탈 변경일 경우 OMS 얼라인먼트 코드를 넣어준다.
								 * 이유 : 작업시간 계산을 위해.
								 * 참고 : orderRental.jsp
								 * 작업일 : 2020.12.11
								 */
								if(!StringUtils.isEmpty(orderVo.getRentalOrdNo())) {
									odVo.setOptPlcNo("OPT00000001");
								}
							}

							optPlcNo += odVo.getOptPlcNo() + "@";
						}
					}

					if(!StringUtils.isEmpty(optPlcNo)) {
						tmsRequestVo.setOptPlcNo(optPlcNo);
					}
					tmsRequestVo.setItemList(bhfItemList);
					tmsRequestVo.setTotQty(String.valueOf(totQty));

					/*
					 * 재고 체크는 달력이 만들어질 때 다 했으므로, 첫 주문때 거점은 정해졌으므로 배정에 들어있는 거점을 넣는다.
					 * RDC 재고를 사용하더라도 해당 거점에 발주를 넣는 것이다.
					 * 목  적 : centerList가 한 개여야 하기 때문.
					 * 추가일 : 2020.09.22.
					 * 추가자 : 박믿음
					 */
					tmsRequestVo.setBhfCd(asignInfoList.get(0).getProcDueBhf());

					//return 하는 목록에 api전문 다 가지고 있는게 좋음.
					ResponseVo responseVo = tmsApiService.saveAllocation(tmsRequestVo, orderVo.getOrdNo());
					rsMap.put("rtnVo", responseVo);
					rsMap.put("rtnMount", "visit");
				} else {
					TmsPndRequestVo tmsPndRequestVo = new TmsPndRequestVo();
					tmsPndRequestVo.setSelectDay(orderVo.getMountDt());
					tmsPndRequestVo.setBhfType(orderVo.getBhfType());
					tmsPndRequestVo.setSelectPeriod(orderVo.getAmPmGbn());
					tmsPndRequestVo.setWheelAlignment(orderInfoList.get(0).getAlignYn());
					tmsPndRequestVo.setTmsOrderId(asignInfoList.get(0).getTmsOrderId());

					for(SvcOpertAsignVo SvcOpertAsignVo : asignInfoList) {
						if("20".equals(SvcOpertAsignVo.getOpertSe())) {
							//픽업 정보
							tmsPndRequestVo.setPickupAddress1(SvcOpertAsignVo.getIplAddr());
							tmsPndRequestVo.setPickupAddress2(SvcOpertAsignVo.getIplDtlAddr());
						} else if("30".equals(SvcOpertAsignVo.getOpertSe())) {
							//딜리버리 정보
							tmsPndRequestVo.setDeliveryAddress1(SvcOpertAsignVo.getIplAddr());
							tmsPndRequestVo.setDeliveryAddress2(SvcOpertAsignVo.getIplDtlAddr());
						}
					}

					String[] city = orderInfoList.get(0).getCity().split(",");
					String[] county = orderInfoList.get(0).getCounty().split(",");
					String[] dong = orderInfoList.get(0).getDong().split(",");

					//픽업 정보
					tmsPndRequestVo.setPickupCity(city[0]);
					tmsPndRequestVo.setPickupCounty(county[0]);
					tmsPndRequestVo.setPickupDong(dong[0]);
					//딜리버리 정보
					tmsPndRequestVo.setDeliveryCity(city[1]);
					tmsPndRequestVo.setDeliveryCounty(county[1]);
					tmsPndRequestVo.setDeliveryDong(dong[1]);

					List<ItemVo> bhfItemList = new ArrayList<ItemVo>();
		  			int totQty = 0;
		  			String optPlcNo = "";
					for(OrderVo odVo : orderInfoList){
						ItemVo itemVo = new ItemVo();
						itemVo.setItemCd(odVo.getItemCd());
						itemVo.setReqQy(Integer.parseInt(odVo.getOrdQy()));
						bhfItemList.add(itemVo);

						/*
						 * 내용 1 : 작업시간 계산을 위한 totQy는 타이어만 해당된다. 서비스 품목은 제외.
						 * 내용 2 : 상품옵션 코드를 넣어서 작업시간 계산을 적용한다.
						 * 수정일 : 2020.10.28
						 * 수정자 : 박믿음
						 */
						if(StringUtils.isEmpty(odVo.getParntsItemCd())) {
							totQty += Integer.parseInt(odVo.getOrdQy());
						} else {
							//상품옵션정책이 얼라인먼트인 것의 처리방법(정비 or 쿠폰) 값을 가져온다.
							//작업일 : 2020.12.28
							if(StringUtil.equals("700882", odVo.getItemCd())) {
								tmsPndRequestVo.setWheelAlignment(odVo.getAlignYn());

								/*
								 * 렌탈 변경일 경우 OMS 얼라인먼트 코드를 넣어준다.
								 * 이유 : 작업시간 계산을 위해.
								 * 참고 : orderRental.jsp
								 * 작업일 : 2020.12.11
								 */
								if(!StringUtils.isEmpty(orderVo.getRentalOrdNo())) {
									odVo.setOptPlcNo("OPT00000001");
								}
							}

							optPlcNo += odVo.getOptPlcNo() + "@";
						}
					}

					if(!StringUtils.isEmpty(optPlcNo)) {
						tmsPndRequestVo.setOptPlcNo(optPlcNo);
					}
					tmsPndRequestVo.setItemList(bhfItemList);
					tmsPndRequestVo.setTotQty(String.valueOf(totQty));
					tmsPndRequestVo.setSvcTyCd("20");

					/*
					 * 재고 체크는 달력이 만들어질 때 다 했으므로, 첫 주문때 거점은 정해졌으므로 배정에 들어있는 거점을 넣는다.
					 * RDC 재고를 사용하더라도 해당 거점에 발주를 넣는 것이다.
					 * 목  적 : centerList가 한 개여야 하기 때문.
					 * 추가일 : 2020.09.22.
					 * 추가자 : 박믿음
					 */
					tmsPndRequestVo.setBhfCd(asignInfoList.get(0).getProcDueBhf());

					PndResponseVo pndResponseVo = tmsApiService.savePndAllocation(tmsPndRequestVo, orderVo.getOrdNo());
					rsMap.put("rtnVo", pndResponseVo);
					rsMap.put("rtnMount", "pickup");
				}

		    	rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
	            rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} else {
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
  	  			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "주문 정보가 없습니다.");
			}

		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	@RequestMapping("selectChangeSaveAllocationTMS2")
	@ResponseBody
	public Map<String , Object> selectChangeSaveAllocationTMS2(HttpServletRequest request, @RequestBody OrderVo orderVo, TmsChangeRequestTMS2Vo vo) throws Exception {
		Map<String , Object> rsMap = new HashMap<String, Object>();

		try {
			//주문 정보 조회
			List<OrderVo> orderInfoList = tmsOrdSvc.selectMypageOrdInfoList(orderVo.getOrdNo());

			//배정정보 조회
			List<SvcOpertAsignVo> asignInfoList = tmsOrdSvc.selectAsignInfoList(orderVo.getOrdNo());

			if(orderInfoList.size() > 0 && asignInfoList.size() > 0) {
				if("10".equals(asignInfoList.get(0).getOpertSe())) {
					//1. 기환 과장님이 만들어준 API 호출.
					TmsRequestTMS2Vo tmsRequestVo = new TmsRequestTMS2Vo();
					tmsRequestVo.setReqDt(orderVo.getMountDt());
					tmsRequestVo.setOldSelectedTime(orderVo.getMountTime());
					tmsRequestVo.setCity(orderInfoList.get(0).getCity());
					tmsRequestVo.setCounty(orderInfoList.get(0).getCounty());
					tmsRequestVo.setDong(orderInfoList.get(0).getDong());
					tmsRequestVo.setBasementPsbYn(orderInfoList.get(0).getBasementYn());
					tmsRequestVo.setBhfType(orderVo.getBhfType());
					tmsRequestVo.setPeriod(orderVo.getAmPmGbn());
					tmsRequestVo.setAddress1(orderInfoList.get(0).getIplAddr());
					tmsRequestVo.setAddress2(orderInfoList.get(0).getIplDtlAddr());
					tmsRequestVo.setSvcTyCd(asignInfoList.get(0).getOpertSe());
					tmsRequestVo.setTmsOrderId(asignInfoList.get(0).getTmsOrderId());

					List<ItemTMS2Vo> bhfItemList = new ArrayList<ItemTMS2Vo>();
		  			int totQty = 0;
		  			String optPlcNo = "";
					for(OrderVo odVo : orderInfoList){
						ItemTMS2Vo itemVo = new ItemTMS2Vo();
						itemVo.setProductCode(odVo.getItemCd());
						itemVo.setQuantity(odVo.getOrdQy());
						bhfItemList.add(itemVo);

						/*
						 * 내용 1 : 작업시간 계산을 위한 totQy는 타이어만 해당된다. 서비스 품목은 제외.
						 * 내용 2 : 상품옵션 코드를 넣어서 작업시간 계산을 적용한다.
						 * 수정일 : 2020.10.28
						 * 수정자 : 박믿음
						 */
						if(StringUtils.isEmpty(odVo.getParntsItemCd())) {
							totQty += Integer.parseInt(odVo.getOrdQy());
						} else {
							//상품옵션정책이 얼라인먼트인 것의 처리방법(정비 or 쿠폰) 값을 가져온다.
							//작업일 : 2020.12.28
							if(StringUtil.equals("700882", odVo.getItemCd())) {
								tmsRequestVo.setWheelAlignment(odVo.getAlignYn());

								/*
								 * 렌탈 변경일 경우 OMS 얼라인먼트 코드를 넣어준다.
								 * 이유 : 작업시간 계산을 위해.
								 * 참고 : orderRental.jsp
								 * 작업일 : 2020.12.11
								 */
								if(!StringUtils.isEmpty(orderVo.getRentalOrdNo())) {
									odVo.setOptPlcNo("OPT00000001");
								}
							}

							optPlcNo += odVo.getOptPlcNo() + "@";
						}
					}

					if(!StringUtils.isEmpty(optPlcNo)) {
						tmsRequestVo.setOptPlcNo(optPlcNo);
					}
					tmsRequestVo.setItemList(bhfItemList);
					tmsRequestVo.setTotQty(String.valueOf(totQty));

					if(!StringUtils.isEmpty(orderVo.getRentalGbn())) {
						tmsRequestVo.setRentalGbn(orderVo.getRentalGbn());
					};
					/*
					 * 재고 체크는 달력이 만들어질 때 다 했으므로, 첫 주문때 거점은 정해졌으므로 배정에 들어있는 거점을 넣는다.
					 * RDC 재고를 사용하더라도 해당 거점에 발주를 넣는 것이다.
					 * 목  적 : centerList가 한 개여야 하기 때문.
					 * 추가일 : 2020.09.22.
					 * 추가자 : 박믿음
					 */
					tmsRequestVo.setBhfCd(asignInfoList.get(0).getProcDueBhf());

					vo.setOldOrderId(tmsRequestVo.getTmsOrderId());
					vo.setOldSelectedDay(orderVo.getCurrentDate());	//변경전 일자
					vo.setReqDt(tmsRequestVo.getReqDt());			//변경후 일자
					vo.setOrderType(tmsRequestVo.getOrderType());
					vo.setPeriod(tmsRequestVo.getPeriod());
					vo.setAddress1(tmsRequestVo.getAddress1());
					vo.setAddress2(tmsRequestVo.getAddress2());
					vo.setCity(tmsRequestVo.getCity());
					vo.setCounty(tmsRequestVo.getCounty());
					vo.setDong(tmsRequestVo.getDong());
					vo.setTotQty(tmsRequestVo.getTotQty());
					vo.setBhfType(tmsRequestVo.getBhfType());
					vo.setBasementPsbYn(tmsRequestVo.getBasementPsbYn());
					vo.setItemList(tmsRequestVo.getItemList());
					vo.setBhfCd(tmsRequestVo.getBhfCd());
					vo.setWheelAlignment(tmsRequestVo.getWheelAlignment());
					vo.setSvcTyCd(tmsRequestVo.getSvcTyCd());
					vo.setTmsOrderId(tmsRequestVo.getTmsOrderId());
					vo.setOptPlcNo(tmsRequestVo.getOptPlcNo());
					vo.setRentalGbn(tmsRequestVo.getRentalGbn());
					//과거 거점의 재고를 보내주는데 RDC가 아니면 현 시점의 재고를확인한다.
					// RDC의 경우 투어가 같은 주문 건들을 조회하고
					// 투어에 필요한 아이템의 수량 만큼 센터의 재고로 넣어준다.
					vo.setOldBhfType("RDC");

					//return 하는 목록에 api전문 다 가지고 있는게 좋음.
					ResponseTMS2Vo responseVo = tmsApiTMS2Service.changeSaveAllocationTMS2(vo);

					if(responseVo != null && responseVo.getResultDataBest() != null && responseVo.getResultDataBest().size() > 0) {
						List<ResultDataBestTMS2Vo> schTime = responseVo.getResultDataBest();

						String orderId = responseVo.getOrderId();
						String orderConfigType = responseVo.getOrderConfigType();
						String time;
						List<VehicleScheduleListTMS2Vo> schedule;

						ResponseTMS2Vo resultDataBest = new ResponseTMS2Vo();
						resultDataBest.setResultDataBest(new ArrayList<ResultDataBestTMS2Vo>());
						resultDataBest.setOrderId(orderId);
						resultDataBest.setOrderConfigType(orderConfigType);


						for(ResultDataBestTMS2Vo bestTime : schTime) {
							time = bestTime.getSelectedTime().substring(11, 13) + bestTime.getSelectedTime().substring(14, 16);//시간
							schedule = bestTime.getVehicleScheduleList();
							orderId = responseVo.getOrderId();

							ResultDataBestTMS2Vo resultDataBestTMS2Vo = new ResultDataBestTMS2Vo();
							resultDataBestTMS2Vo.setSelectedTime(time);
							resultDataBestTMS2Vo.setVehicleScheduleList(schedule);

							resultDataBest.getResultDataBest().add(resultDataBestTMS2Vo);
							resultDataBest.getOrderId();
							resultDataBest.getOrderConfigType();

							rsMap.put("rtnVo", resultDataBest);
						}
					}

				}
		    	rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
	            rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} else {
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
  	  			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "주문 정보가 없습니다.");
			}

		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	@RequestMapping("selectChangeSavePndAllocationTMS2")
	@ResponseBody
	public Map<String , Object> selectChangeSavePndAllocationTMS2(HttpServletRequest request, @RequestBody OrderVo orderVo, TmsChangePndRequestTMS2Vo vo) throws Exception {
		Map<String , Object> rsMap = new HashMap<String, Object>();

		try {
			//주문 정보 조회
			List<OrderVo> orderInfoList = tmsOrdSvc.selectMypageOrdInfoList(orderVo.getOrdNo());

			//배정정보 조회
			List<SvcOpertAsignVo> asignInfoList = tmsOrdSvc.selectAsignInfoList(orderVo.getOrdNo());

			if(orderInfoList.size() > 0 && asignInfoList.size() > 0) {
				TmsPndRequestTMS2Vo tmsPndRequestVo = new TmsPndRequestTMS2Vo();
				tmsPndRequestVo.setSelectDay(orderVo.getMountDt());
				tmsPndRequestVo.setBhfType(orderVo.getBhfType());
				tmsPndRequestVo.setSelectPeriod(orderVo.getAmPmGbn());
				tmsPndRequestVo.setWheelAlignment(orderInfoList.get(0).getAlignYn());
				tmsPndRequestVo.setTmsOrderId(asignInfoList.get(0).getTmsOrderId());

				for(SvcOpertAsignVo SvcOpertAsignVo : asignInfoList) {
					if("20".equals(SvcOpertAsignVo.getOpertSe())) {
						//픽업 정보
						tmsPndRequestVo.setPickupAddress1(SvcOpertAsignVo.getIplAddr());
						tmsPndRequestVo.setPickupAddress2(SvcOpertAsignVo.getIplDtlAddr());
					} else if("30".equals(SvcOpertAsignVo.getOpertSe())) {
						//딜리버리 정보
						tmsPndRequestVo.setDeliveryAddress1(SvcOpertAsignVo.getIplAddr());
						tmsPndRequestVo.setDeliveryAddress2(SvcOpertAsignVo.getIplDtlAddr());
					}
				}

				String[] city = orderInfoList.get(0).getCity().split(",");
				String[] county = orderInfoList.get(0).getCounty().split(",");
				String[] dong = orderInfoList.get(0).getDong().split(",");

				//픽업 정보
				tmsPndRequestVo.setPickupCity(city[0]);
				tmsPndRequestVo.setPickupCounty(county[0]);
				tmsPndRequestVo.setPickupDong(dong[0]);
				//딜리버리 정보
				tmsPndRequestVo.setDeliveryCity(city[1]);
				tmsPndRequestVo.setDeliveryCounty(county[1]);
				tmsPndRequestVo.setDeliveryDong(dong[1]);

				List<ItemTMS2Vo> bhfItemList = new ArrayList<ItemTMS2Vo>();
	  			int totQty = 0;
	  			String optPlcNo = "";
				for(OrderVo odVo : orderInfoList){
					ItemTMS2Vo itemVo = new ItemTMS2Vo();
					itemVo.setProductCode(odVo.getItemCd());
					itemVo.setQuantity(odVo.getOrdQy());
					bhfItemList.add(itemVo);

					/*
					 * 내용 1 : 작업시간 계산을 위한 totQy는 타이어만 해당된다. 서비스 품목은 제외.
					 * 내용 2 : 상품옵션 코드를 넣어서 작업시간 계산을 적용한다.
					 * 수정일 : 2020.10.28
					 * 수정자 : 박믿음
					 */
					if(StringUtils.isEmpty(odVo.getParntsItemCd())) {
						totQty += Integer.parseInt(odVo.getOrdQy());
					} else {
						//상품옵션정책이 얼라인먼트인 것의 처리방법(정비 or 쿠폰) 값을 가져온다.
						//작업일 : 2020.12.28
						if(StringUtil.equals("700882", odVo.getItemCd())) {
							tmsPndRequestVo.setWheelAlignment(odVo.getAlignYn());

							/*
							 * 렌탈 변경일 경우 OMS 얼라인먼트 코드를 넣어준다.
							 * 이유 : 작업시간 계산을 위해.
							 * 참고 : orderRental.jsp
							 * 작업일 : 2020.12.11
							 */
							if(!StringUtils.isEmpty(orderVo.getRentalOrdNo())) {
								odVo.setOptPlcNo("OPT00000001");
							}
						}

						optPlcNo += odVo.getOptPlcNo() + "@";
					}
				}

				if(!StringUtils.isEmpty(optPlcNo)) {
					tmsPndRequestVo.setOptPlcNo(optPlcNo);
				}
				tmsPndRequestVo.setItemList(bhfItemList);
				tmsPndRequestVo.setTotQty(String.valueOf(totQty));
				tmsPndRequestVo.setSvcTyCd("20");

				if(!StringUtils.isEmpty(orderVo.getRentalGbn())) {
					tmsPndRequestVo.setRentalGbn(orderVo.getRentalGbn());
				};
				/*
				 * 재고 체크는 달력이 만들어질 때 다 했으므로, 첫 주문때 거점은 정해졌으므로 배정에 들어있는 거점을 넣는다.
				 * RDC 재고를 사용하더라도 해당 거점에 발주를 넣는 것이다.
				 * 목  적 : centerList가 한 개여야 하기 때문.
				 * 추가일 : 2020.09.22.
				 * 추가자 : 박믿음
				 */
				tmsPndRequestVo.setBhfCd(asignInfoList.get(0).getProcDueBhf());

				vo.setOldOrderId(tmsPndRequestVo.getTmsOrderId());
				vo.setOldSelectedDay(orderVo.getCurrentDate());		//변경전 일자
				vo.setSelectDay(tmsPndRequestVo.getSelectDay());	//변경후 일자
				vo.setOrderType(tmsPndRequestVo.getOrderType());
				vo.setSelectPeriod(tmsPndRequestVo.getSelectPeriod());
				vo.setPickupAddress1(tmsPndRequestVo.getPickupAddress1());
				vo.setPickupAddress2(tmsPndRequestVo.getPickupAddress2());
				vo.setPickupCity(tmsPndRequestVo.getPickupCity());
				vo.setPickupCounty(tmsPndRequestVo.getPickupCounty());
				vo.setPickupDong(tmsPndRequestVo.getPickupDong());
				vo.setDeliveryAddress1(tmsPndRequestVo.getDeliveryAddress1());
				vo.setDeliveryAddress2(tmsPndRequestVo.getDeliveryAddress2());
				vo.setDeliveryCity(tmsPndRequestVo.getDeliveryCity());
				vo.setDeliveryCounty(tmsPndRequestVo.getDeliveryCounty());
				vo.setDeliveryDong(tmsPndRequestVo.getDeliveryDong());
				vo.setTotQty(tmsPndRequestVo.getTotQty());
				vo.setBhfType(tmsPndRequestVo.getBhfType());
				vo.setBasementPsbYn(tmsPndRequestVo.getBasementPsbYn());
				vo.setItemList(tmsPndRequestVo.getItemList());
				vo.setBhfCd(tmsPndRequestVo.getBhfCd());
				vo.setWheelAlignment(tmsPndRequestVo.getWheelAlignment());
				vo.setSvcTyCd(tmsPndRequestVo.getSvcTyCd());
				vo.setTmsOrderId(tmsPndRequestVo.getTmsOrderId());
				vo.setOptPlcNo(tmsPndRequestVo.getOptPlcNo());
				vo.setOptPlcNo(tmsPndRequestVo.getOptPlcNo());
				vo.setRentalGbn(tmsPndRequestVo.getRentalGbn());
				//과거 거점의 재고를 보내주는데 RDC가 아니면 현 시점의 재고를확인한다.
				// RDC의 경우 투어가 같은 주문 건들을 조회하고
				// 투어에 필요한 아이템의 수량 만큼 센터의 재고로 넣어준다.
				vo.setOldBhfType("RDC");

				PndResponseTMS2Vo pndResponseVo = tmsApiTMS2Service.changeSavePndAllocationTMS2(vo);

				if(pndResponseVo != null && pndResponseVo.getResultDataBest() != null && pndResponseVo.getResultDataBest().size() > 0) {
					List<ResultDataBestTMS2Vo> schTime = pndResponseVo.getResultDataBest();

					String orderId = pndResponseVo.getOrderId();
					String orderConfigType = pndResponseVo.getOrderConfigType();
					String time;
					List<VehicleScheduleListTMS2Vo> schedule;

					ResponseTMS2Vo resultDataBest = new ResponseTMS2Vo();
					resultDataBest.setResultDataBest(new ArrayList<ResultDataBestTMS2Vo>());
					resultDataBest.setOrderId(orderId);
					resultDataBest.setOrderConfigType(orderConfigType);

					for(ResultDataBestTMS2Vo bestTime : schTime) {
						time = bestTime.getSelectedTime().substring(11, 13) + bestTime.getSelectedTime().substring(14, 16);//시간
						schedule = bestTime.getVehicleScheduleList();
						orderId = pndResponseVo.getOrderId();

						ResultDataBestTMS2Vo resultDataBestTMS2Vo = new ResultDataBestTMS2Vo();
						resultDataBestTMS2Vo.setSelectedTime(time);
						resultDataBestTMS2Vo.setVehicleScheduleList(schedule);

						resultDataBest.getResultDataBest().add(resultDataBestTMS2Vo);
						resultDataBest.getOrderId();
						resultDataBest.getOrderConfigType();

						rsMap.put("rtnVo", resultDataBest);
					}
				}

		    	rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
	            rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} else {
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
  	  			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "주문 정보가 없습니다.");
			}

		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	/**
	 * 장착시간 선택시 종료예정시간 출력
	 * **/
	@RequestMapping("JobEndTimeTMS2")
	@ResponseBody
	public TravelInfoForTourJsonStringReturnVo selectedTimeJobEndTime(HttpServletRequest request, TravelInfoForTourJsonStringParamVo travelParamVo) throws Exception {
		TravelInfoForTourJsonStringReturnVo travelReturn = orderTMS2Svc.searchTravelInfoForTourInfoTMS2(travelParamVo);

		return travelReturn;
	}

	/**
	 * 요일에 따른 시간 변경(TMS)
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("saveIstChangeDt")
	@ResponseBody
	public Map<String , Object> saveIstChangeDt(HttpServletRequest request, @RequestBody OrderVo orderVo) throws Exception {
		Map<String , Object> rsMap = new HashMap<String, Object>();

		try {
		    //공통코드 그룹(SV600)의 코드ID(OMS)를 조회하여 참조코드1(refCd1)을 가져온다.
            RefCd1RequestVO refCd1RequestVO = new RefCd1RequestVO();
            refCd1RequestVO.setCmGrpCd("SV600");
            refCd1RequestVO.setCmCd("OMS");

            //참조코드1(true : 배치완료, false : 배치진행중)
            if(cmCdSvc.getRefCd1ByCmGrpCdAndCmCd(refCd1RequestVO).getRefCd1().equals("false")){
                rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BATCH_PROCESSING);
                rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSAGE_BATCH_PROCESSING);
                return rsMap;
            }

			Map<String, String> rtn = tmsOrdSvc.saveIstChangeDt(orderVo);
			rsMap.put("rtnDe", rtn.get("reqDe"));
			rsMap.put("rtnTime", rtn.get("reqTime"));
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		logger.debug("======= Holiday ADD Call =======");
		try {
			SvcHolidayInfoVo svcHolidayInfoVo = new SvcHolidayInfoVo();
			svcHolidayInfoVo.setTrnSe(CpConstants.CP_API.TRN_SE_ADD);
			svcHolidayInfoVo.setUsrId(WebConstants.DEFAULT_USER_ID);
			svcCpHldySndSvc.newSave(svcHolidayInfoVo);
			logger.debug("======= Holiday ADD End =======");

			logger.debug("======= Holiday DEL Call =======");
			svcHolidayInfoVo.setTrnSe(CpConstants.CP_API.TRN_SE_DEL);
			svcCpHldySndSvc.newSave(svcHolidayInfoVo);
		} catch(Exception e) {
			logger.debug("======= Holiday Error Nothing =======");
		}
		logger.debug("======= Holiday DEL End =======");

		if(!StringUtils.isEmpty(orderVo.getRentalOrdNo())){
			alTalkTemplateSvc.sendOrgAlTalkCngRnt(orderVo);
		}else{
			alTalkTemplateSvc.sendOrgAlTalkChg(orderVo);		//예약변경 시 수행기사,지점장에게 보내는 알림톡
		}

		return rsMap;
	}

	@RequestMapping("saveIstChangeDtTMS2")
	@ResponseBody
	public Map<String , Object> saveIstChangeDtTMS2(HttpServletRequest request, @RequestBody OrderVo orderVo) throws Exception {
	    OrderVo currentOrderVO = orderSvc.selectAlTalkOrdInfo(orderVo);
        String currentReservationDateAndTime = currentOrderVO.getDueDe().replace(".", "") + currentOrderVO.getDueTime().substring(3).replace(":", "");

		Map<String , Object> rsMap = new HashMap<String, Object>();
		ReplaceOrderWorkReturnVo rtnVo = new ReplaceOrderWorkReturnVo();
		try {
		    //공통코드 그룹(SV600)의 코드ID(OMS)를 조회하여 참조코드1(refCd1)을 가져온다.
            RefCd1RequestVO refCd1RequestVO = new RefCd1RequestVO();
            refCd1RequestVO.setCmGrpCd("SV600");
            refCd1RequestVO.setCmCd("OMS");

            //참조코드1(true : 배치완료, false : 배치진행중)
            if(cmCdSvc.getRefCd1ByCmGrpCdAndCmCd(refCd1RequestVO).getRefCd1().equals("false")){
                rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BATCH_PROCESSING);
                rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSAGE_BATCH_PROCESSING);
                return rsMap;
            }

			rtnVo = tmsOrdTMS2Svc.saveIstChangeDtTMS2(orderVo);
			rsMap.put("rtnVo", rtnVo);
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		logger.debug("======= Holiday ADD Call =======");
		try {
			SvcHolidayInfoVo svcHolidayInfoVo = new SvcHolidayInfoVo();
			svcHolidayInfoVo.setTrnSe(CpConstants.CP_API.TRN_SE_ADD);
			svcHolidayInfoVo.setUsrId(WebConstants.DEFAULT_USER_ID);
			svcCpHldySndSvc.saveTMS2(svcHolidayInfoVo);
			logger.debug("======= Holiday ADD End =======");

			logger.debug("======= Holiday DEL Call =======");
			svcHolidayInfoVo.setTrnSe(CpConstants.CP_API.TRN_SE_DEL);
			svcCpHldySndSvc.saveTMS2(svcHolidayInfoVo);
		} catch(Exception e) {
			logger.debug("======= Holiday Error Nothing =======");
		}
		logger.debug("======= Holiday DEL End =======");

		String changeReservationDateAndTime = orderVo.getIstReqDe() + orderVo.getIstDueDe().substring(0, 4);

		if(!StringUtil.isEmpty(orderVo.getRentalOrdNo())){
			alTalkTemplateSvc.sendOrgAlTalkCngRnt(orderVo);
		}else{
			List<SvOpertAsignMstNxToVo> opertAsignMstNxAsIs = rtnVo.getOpertAsignMstNxAsIs();
			List<SvOpertAsignMstNxToVo> opertAsignMstNxTo = rtnVo.getOpertAsignMstNxTo();
			String OMSOrdNo = rtnVo.getOMSOrdNo();
			OMSOrdNo = orderVo.getOrdNo();

			alTalkTemplateSvc.sendOrgAlTalkOrdTMS2(opertAsignMstNxAsIs, opertAsignMstNxTo, orderVo, OMSOrdNo);			//예약변경 시 수행기사,지점장에게 보내는 알림톡

			if(!currentReservationDateAndTime.equals(changeReservationDateAndTime)){
                alTalkTemplateSvc.sendOrgAlTalkChg(orderVo);
            }
		}

		return rsMap;
	}

	/**
	 * 전문점장착 선택 가능 시간 가져오기.
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("selectChgShopTimeList")
	@ResponseBody
	public Map<String , Object> selectChgShopTimeList(HttpServletRequest request, @RequestBody OrderVo orderVo) throws Exception {
		Map<String , Object> rsMap = new HashMap<String, Object>();

		try {
			//주문 정보 조회
			List<OrderVo> orderInfoList = tmsOrdSvc.selectMypageOrdInfoList(orderVo.getOrdNo());

			//배정정보 조회
			List<SvcOpertAsignVo> asignInfoList = tmsOrdSvc.selectAsignInfoList(orderVo.getOrdNo());

			if(orderInfoList.size() > 0 && asignInfoList.size() > 0) {
				List<String> itemCdArr = new ArrayList<String>();
				List<String> itemCntArr = new ArrayList<String>();
				String optPlcNo = "";
				for(OrderVo odVo : orderInfoList){
					itemCdArr.add(odVo.getItemCd());
					itemCntArr.add(odVo.getOrdQy());

					/*
					 * 내용 1 : 상품옵션 코드를 넣어서 작업시간 계산을 적용한다.
					 * 수정일 : 2020.10.28
					 * 수정자 : 박믿음
					 *
					 * 내용 수정 : 상품옵션정책이 얼라인먼트인 것의 처리방법(정비 or 쿠폰) 값을 가져온다.
					 * 작업일 : 2020.12.28
					 */
					if(!StringUtils.isEmpty(odVo.getParntsItemCd())) {
						if(StringUtil.equals("700882", odVo.getItemCd())) {
							orderVo.setAlignYn(odVo.getAlignYn());

							/*
							 * 렌탈 변경일 경우 OMS 얼라인먼트 코드를 넣어준다.
							 * 이유 : 작업시간 계산을 위해.
							 * 참고 : orderRental.jsp
							 * 작업일 : 2020.12.11
							 */
							if(!StringUtils.isEmpty(orderVo.getRentalOrdNo())) {
								odVo.setOptPlcNo("OPT00000001");
							}
						}

						optPlcNo += odVo.getOptPlcNo() + "@";
					}
				}

				if(!StringUtils.isEmpty(optPlcNo)) {
					orderVo.setOptPlcNo(optPlcNo);
				}
				orderVo.setItemCdArr(itemCdArr);
				orderVo.setItemCntArr(itemCntArr);

				Map<String,Object> shopTimeList = tmsOrdSvc.selectShopTimeList(orderVo);

				rsMap.put("shopTimeList", shopTimeList);
				rsMap.put(WebConstants.Rtn.RETURN_CODE, shopTimeList.get("resultCode"));
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, shopTimeList.get("resultMessage"));
			} else {
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
  	  			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "주문 정보가 없습니다.");
			}
		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	/**************************************** Mypage5 통합 부분 시작 ****************************************/
	/**
	 * 마이페이지 > 나의 렌탈 관리 리스트
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/myRentalList")
	public String myRentalList(HttpServletRequest request, Model model, RentalMypageVo1 vo
			, @RequestParam(value="pageNo", required=false) String pageNo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/myRentalList");
			rUrl = "/login/userLogin";
		} else {

			if(StringUtil.isEmpty(pageNo)) {
				pageNo = "1";
			}

			try {
				//연체금 및 연체 내역
				String safeKey = clientVo.getSafeKey();
				Map<String, Object> overdueListMap  = rentalMypageSvc1.select_p_sRtre0030ShopArreList(safeKey);
				model.addAttribute("myOverdueMap"	, overdueListMap.get("myOverdueMap"));
				model.addAttribute("myOverdueMapList"	, overdueListMap.get("myOverdueMapList"));


				//이번달 청구 금액
				Map<String,Object> payListMap = rentalMypageSvc1.select_payList(safeKey);
				model.addAttribute("payList"	, payListMap.get("payList"));
				model.addAttribute("totRentAmt"	, payListMap.get("totRentAmt"));


				//렌탈 관리 리스트
				Map<String,Object> myListMap = rentalMypageSvc1.select_p_sRtsd0108CustOrdInfoNew(clientVo, null);
				List<Map<String, Object>> rtnList = (List<Map<String, Object>>) myListMap.get("rentalList");
				int size = rtnList.size();

				List<Map<String, Object>> pageList = new ArrayList<Map<String, Object>>();

				//계약 종료 건수
				int endCnt = 0;
				int totSumAmt = 0;
				for(Map<String, Object> map : rtnList){
					if("N".equals(map.get("osYn"))){
						endCnt = endCnt + 1;
					} else {
						pageList.add(map);
					}

					if(map.get("MON_AMT") !=null) {
						totSumAmt = totSumAmt + Integer.parseInt(map.get("MON_AMT").toString());
					}
				}


				pageList = (List<Map<String, Object>>) page(rtnList , 10 , Integer.parseInt(pageNo));

				PageVo pageVo = new PageVo();
				pageVo.setTotalCount(size);
				pageVo.setPageNo(Integer.parseInt(pageNo));
				pageVo.setPageSize(10);

				model.addAttribute("pageCommon"	, pageVo);
				model.addAttribute("rentalList"	, pageList);
				model.addAttribute("endCnt"	, endCnt);
				model.addAttribute("totSumAmt"	, String.valueOf(totSumAmt));
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

				rUrl = "/mypage/myRentalList";
			} catch(Exception e) {
				System.err.println(e.toString());
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);

				rUrl = "/error/error";
			}
		}
		
		//10233006 GA title tag 동적 변경
		if(StringUtil.equals(rUrl, "/login/userLogin")) {
			model.addAttribute("title", "나의 렌탈관리_로그인 | NEXT LEVEL");
		}else if(StringUtil.equals(rUrl, "/mypage/myRentalList")) {
			model.addAttribute("title", "나의 렌탈관리 | NEXT LEVEL");
		}

		return rUrl;
	}

	/**
	 * 마이페이지 > 나의 렌탈 관리 상세
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/myRentalDetail")
	public String myRentalDetail(HttpServletRequest request, Model model, RentalMypageVo1 vo
			, @RequestParam(value="ordNo", required=false) String ordNo) throws Exception {
		String rUrl = "";
		String statCd = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/login/userLogin");
			rUrl = "/login/userLogin";
		} else {
			try {
				//주문번호 null체크
				if(StringUtils.isEmpty(ordNo)) {
					throw BizExceptionFactoryBean.getInstance().createBizException("CMA0016", new String[] {"주문번호"});  //이/가 존재하지 않습니다.
				}

				//렌탈 관리 리스트
				Map<String,Object> myListMap = rentalMypageSvc1.select_p_sRtsd0108CustOrdInfoNew(clientVo, ordNo);
				List<Map<String, Object>> rtnList = (List<Map<String, Object>>) myListMap.get("rentalList");

				Map<String, Object> detailMap = new HashMap<String, Object>();
				for(Map<String, Object> map : rtnList){
					if(ordNo.equals(map.get("ordNo"))){
						statCd = map.get("STAT_CD").toString();
						detailMap = map;
					}
				}

				model.addAttribute("detailMap"	, detailMap);
				model.addAttribute("clientVo"	, clientVo);

				//서비스내역
				Map<String,Object> myServiceMap = rentalMypageSvc1.select_p_sRtsd0013OnlineListNew(clientVo);
				List<Map<String, Object>> rtnServiceList = (List<Map<String, Object>>) myServiceMap.get("serviceList");

				//기본 >> B0000(타이어)
				List<Map<String, Object>> tireList = new ArrayList<Map<String, Object>>();

				//케어 >> B00002(위치) , B00003(방문) , B00004(얼라이언트)
				List<Map<String, Object>> wichList = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> bangmun = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> alientList = new ArrayList<Map<String, Object>>();

				//스페셜 >> B00007(걱정) ,
				List<Map<String, Object>> primiumList = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> enginList = new ArrayList<Map<String, Object>>();

				for(Map<String, Object> map : rtnServiceList) {
					if(ordNo.equals(map.get("ORD_NO").toString())){
						String key = map.get("PRS_DCD").toString();
						//기본 - 타이어
						if("B00000".equals(key)) {
							tireList.add(map);
						}
						//케어 - 위치 교환
						else if("B00002".equals(key)) {
							wichList.add(map);
						}
						//케어 - 방문 점검
						else if("B00003".equals(key)) {
							bangmun.add(map);
						}
						//케어 - 얼라인먼트
						else if("B00008".equals(key)) {
							alientList.add(map);
						}
						//스폐셜 - 걱정재로 프리미엄(사계절보증제도)
						else if("B00007".equals(key)) {
							primiumList.add(map);
						}
						//스폐셜 - 엔진 오일
						if("B00001".equals(key)) {
							enginList.add(map);
						}
					}
				}

				List<Map<String, Object>> rsList1 = new ArrayList<Map<String, Object>>();
				rsList1.addAll(tireList);
				List<Map<String, Object>> rsList2 = new ArrayList<Map<String, Object>>();
				rsList2.addAll(wichList);
				rsList2.addAll(bangmun);
				rsList2.addAll(alientList);
				List<Map<String, Object>> rsList3 = new ArrayList<Map<String, Object>>();
				rsList3.addAll(primiumList);
				rsList3.addAll(enginList);

				List<Map<String, Object>> rsList11 = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> rsList22 = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> rsList33 = new ArrayList<Map<String, Object>>();
				try {
					for(int i=0; i<rsList1.size(); i++) {
						Map<String, Object> m = new HashMap<String, Object>();
						m.putAll(rsList1.get(i));
						if(i > 0) {
							m.put("pre"	, (rsList1.get(i-1).get("PRS_DCD").toString()));
						} else {
							m.put("pre"	, "");
						}
						if(i == rsList1.size()-1) {
							m.put("next"	, "");
						} else {
							m.put("next"	, (rsList1.get(i+1).get("PRS_DCD").toString()));
						}
						rsList11.add(m);
					}

					for(int i=0; i<rsList2.size(); i++) {
						Map<String, Object> m = new HashMap<String, Object>();
						m.putAll(rsList2.get(i));
						if(i > 0) {
							m.put("pre"	, (rsList2.get(i-1).get("PRS_DCD").toString()));
						} else {
							m.put("pre"	, "");
						}
						if(i == rsList2.size()-1) {
							m.put("next"	, "");
						} else {
							m.put("next"	, (rsList2.get(i+1).get("PRS_DCD").toString()));
						}
						rsList22.add(m);
					}

					for(int i=0; i<rsList3.size(); i++) {
						Map<String, Object> m = new HashMap<String, Object>();
						m.putAll(rsList3.get(i));
						if(i > 0) {
							m.put("pre"	, (rsList3.get(i-1).get("PRS_DCD").toString()));
						} else {
							m.put("pre"	, "");
						}
						if(i == rsList3.size()-1) {
							m.put("next"	, "");
						} else {
							m.put("next"	, (rsList3.get(i+1).get("PRS_DCD").toString()));
						}
						rsList33.add(m);
					}
				} catch(Exception e){
					e.toString();
				}

				model.addAttribute("rsList11"	, rsList11);
				model.addAttribute("rsList22"	, rsList22);
				model.addAttribute("rsList33"	, rsList33);
				model.addAttribute("ordNo", ordNo);

				//은행 목록 조회
				List<RentalOrderVo> bankCdList = rentalOrderSvc.selectComCdList("R001");
				model.addAttribute("bankCdList", bankCdList);

				//카드 목록 조회
				List<RentalOrderVo> cardCdList = rentalOrderSvc.selectComCdList("R002");
				model.addAttribute("cardCdList", cardCdList);

				//결제/신청 상세정보 조회
				Map<String , Object> payDetail = rentalMypageSvc1.payDetail(ordNo);
				model.addAttribute("payDetail", payDetail.get("payDetail"));

				// 중도선납 개월 목록 조회
				List<RentalMypageVo1> monthList = rentalMypageSvc1.prptMonList();
				model.addAttribute("monthList", monthList);

				//운영일 땐, 초기구분 조회X
				String serverMode = System.getProperty(CoreConstants.SERVER_MODE);
				if(!serverMode.equals("prd")) {
					//무상파손 서비스 초기 구분 조회 - 장착완료건만 조회되어야 함.
					if("04".equals(statCd)) {
						FreeDamageServiceVO freeVo = new FreeDamageServiceVO();

						freeVo.setOrdNo(ordNo);
						Map<String,Object> freeDmgJoinChk = rentalMypageSvc1.select_p_sGetInitInfo(freeVo);

						//무상파손 초기구분내역 null체크
						if(StringUtils.isEmpty(freeDmgJoinChk)) {
							throw BizExceptionFactoryBean.getInstance().createBizException("CMA0016", new String[] {"서비스 초기 조회 내역"});  //이/가 존재하지 않습니다.
						}

						model.addAttribute("freeDmgJoinChk", freeDmgJoinChk.get("freeDmgJoinChk"));
					}
				}

				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

				rUrl = "/mypage/myRentalDetail";

			} catch(Exception e) {
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);

				rUrl = "/error/error";
			}
		}

		return rUrl;
	}


	/**
	 * 나의결제관리- 결제정보수정처리
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/updatemyPayMytd")
	@ResponseBody
	public Map<String, Object> updatemyPayMytd( HttpServletRequest request, RentalMypageVo1 vo ) throws Exception {

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		//영업 고객 존재 여부 확인 및 신규생성
		String custNo = rentalOrderSvc.selectSrhCustId(clientVo.getCustId());

		Map<String ,Object> paraMap = new HashMap<String ,Object>();
		paraMap.put("ordNo",  vo.getRdoOrdNo());
		paraMap.put("custNo", custNo);

		//결제 정보 조회
		Map<String,Object> payMap = rentalMypageSvc1.select_p_sRtre0050List(paraMap); // new ArrayList();
		List<Map<String, Object>> rtnServiceList = (List<Map<String, Object>>) payMap.get("serviceList");
		paraMap.putAll(rtnServiceList.get(0));
logger.debug("###### >>> payMap   :::       " + payMap);
		Map<String,Object> sMap = new HashMap<String, Object>();
		if(rtnServiceList.size() > 0 ){
			//결제 방법 수정
			sMap = rentalMypageSvc1.paymentPIUDRtre0050(paraMap, vo, clientVo);


			logger.debug("###### >>> sMap   :::       " + sMap);
		}

	 	return sMap;
	}

	/**
	 * 선납 할인 계산
	 * @param
	 * @return
	 * @throws IOException
	 * @exception Exception
	 */
	@RequestMapping("/calPay")
	@ResponseBody
	public Map<String , Object> calPay(HttpServletRequest request,  RentalMypageVo1 vo) throws Exception {

		Map <String , Object> rsMap = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> calPayMytd  = rentalMypageSvc1.calPayMytd(vo);

			String totRecpAmt 	= calPayMytd.get(0).get("totRecpAmt").toString(); 	//총 납부금액
			String totDcAmt 	= calPayMytd.get(0).get("totDcAmt").toString(); 	//총 할인금액
			String remainAmt 	= calPayMytd.get(0).get("remainAmt").toString(); 	//선납 후 잔액

			if(!StringUtil.isEmpty(totRecpAmt) && !StringUtil.isEmpty(totDcAmt) && !StringUtil.isEmpty(remainAmt)) {
				rsMap.put("totRecpAmt", totRecpAmt);
				rsMap.put("totDcAmt", totDcAmt);
				rsMap.put("remainAmt", remainAmt);
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} else {

			}

		} catch(Exception e) {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	/**
	 * 중도 완납 계산
	 * @param
	 * @return
	 * @throws IOException
	 * @exception Exception
	 */
	@RequestMapping("/calFullPay")
	@ResponseBody
	public Map <String , Object> calFullPayMytd( @RequestParam(value="ordNo", required=false) String ordNo
			                                   , HttpServletResponse response) throws Exception {

		Map <String , Object> rsMap = new HashMap<String, Object>();
		try {
			Map <String , Object> jsonResult = new HashMap<String, Object>();
			List<Map<String, Object>> calPayMytd  = rentalMypageSvc1.calFullPayMytd(ordNo);
			String planAmt 	= calPayMytd.get(0).get("planAmt").toString(); 	//중도 완납 금액

			if(!StringUtil.isEmpty(planAmt)) {
				rsMap.put("planAmt", planAmt);
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} else {

			}

		} catch(Exception e) {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	/**
	 * 내 결제 내역 KCP 주문처리 - 선납 완납
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/pp_cli_hub_my")
	public ModelAndView pp_cli_hub_my( HttpServletRequest req, HttpServletResponse response, MypageOrderVO orderVO, PayResultVO payResultVO) {
		ModelAndView mav = new ModelAndView("/mypage/kcp/pp_cli_hub_my");
		mav.addObject("orderVO", orderVO);
		mav.addObject("payResultVO", payResultVO);
		return mav;
	}

	/**
	 * 나의결제관리- 중도 완납 결제
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/fullPayMytd")
	public void fullPayMytd( HttpServletRequest request, HttpServletResponse res,  PayResultVO payResultVO , Model model) throws Exception {

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		String message = "";
		int successCode = 0;
		String returnUrl= "";

		try {
			logger.info("fullPayMytd - [" + clientVo.getCustId() + "][선납 결제 결과][" + payResultVO.getResCd() + "-" + payResultVO.getResMsg() + "]");


			logger.debug("$$$$$$  payResultVO.getResCd() >>>>> " + payResultVO.getResCd());

			if("0000".equals(payResultVO.getResCd())){
				successCode = (int) rentalMypageSvc1.fullPayMytd(payResultVO, clientVo.getCustId());


				logger.debug("$$$$$$  successCode >>>>> " + successCode);

				if(successCode < 0){
					message = "처리중 오류가 발생하였습니다.";
					returnUrl = "/error/error";

					logger.debug("$$$$$$  returnUrl1111 >>>>> " + returnUrl);
				} else if("3001".equals(payResultVO.getResCd())) {
					message = "주문/결제가 취소 되었습니다.";
					returnUrl = "/error/error";

					logger.debug("$$$$$$  returnUr2222 >>>>> " + returnUrl);
				}	else {
					message = "정상처리되었습니다.";
					returnUrl = "/mypage/myRentalList";

					logger.debug("$$$$$$  returnUr333 >>>>> " + returnUrl);
				}
			} else {
				message = "주문/결제 진행 중 오류가 발생하였습니다. \n 주문화면 바로가기’ 버튼을 클릭 후 이동하여 다시 진행해 주시기 바랍니다.";
				message += "관련 문의사항은 고객센터(1855-0100 상담시간 : 평일 오전 9:00 ~ 오후 6:00)로 \n";
				message += "문의주시면 친절하게 안내해 드리겠습니다. \n";
				message += "감사합니다.";

				returnUrl = "/error/error";

				logger.debug("$$$$$$  returnUr444 >>>>> " + returnUrl);
			}
		} catch(Exception e) {
			message = "주문/결제 진행 중 오류가 발생하였습니다. \n 주문화면 바로가기’ 버튼을 클릭 후 이동하여 다시 진행해 주시기 바랍니다.";
			message += "관련 문의사항은 고객센터(1855-0100 상담시간 : 평일 오전 9:00 ~ 오후 6:00)로 \n";
			message += "문의주시면 친절하게 안내해 드리겠습니다. \n";
			message += "감사합니다.";

			returnUrl = "/error/error";
			logger.debug("$$$$$$  returnUr555 >>>>> " + returnUrl);
		}

		logger.debug("$$$$$$  returnUr6666 >>>>> " + returnUrl);

		JsPrinter.replace(res, returnUrl , message);
	}

	/**
	 * 나의결제관리- 선납 결제
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/prepaymentPayMytd")
	public void prepaymentPayMytd( HttpServletRequest request, HttpServletResponse res, PayResultVO payResultVO , Model model) throws Exception {

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		String message = "";
		int successCode = 0;
		String returnUrl= "";

		try {
			logger.info("prepaymentPayMytd - [" + clientVo.getCustId() + "][선납 결제 결과][" + payResultVO.getResCd() + "-" + payResultVO.getResMsg() + "]");


			logger.debug("$$$$$$  payResultVO.getResCd() >>>>> " + payResultVO.getResCd());

			if("0000".equals(payResultVO.getResCd())){
				successCode = (int) rentalMypageSvc1.prepaymentPayMytd(payResultVO, clientVo.getCustId());


				logger.debug("$$$$$$  successCode >>>>> " + successCode);

				if(successCode < 0){
					message = "처리중 오류가 발생하였습니다.";
					returnUrl = "/error/error";

					logger.debug("$$$$$$  returnUrl1111 >>>>> " + returnUrl);
				} else if("3001".equals(payResultVO.getResCd())) {
					message = "주문/결제가 취소 되었습니다.";
					returnUrl = "/error/error";

					logger.debug("$$$$$$  returnUr2222 >>>>> " + returnUrl);
				}	else {
					message = "정상처리되었습니다.";
					returnUrl = "/mypage/myRentalList";

					logger.debug("$$$$$$  returnUr333 >>>>> " + returnUrl);
				}
			} else {
				message = "주문/결제 진행 중 오류가 발생하였습니다. \n 주문화면 바로가기’ 버튼을 클릭 후 이동하여 다시 진행해 주시기 바랍니다.";
				message += "관련 문의사항은 고객센터(1855-0100 상담시간 : 평일 오전 9:00 ~ 오후 6:00)로 \n";
				message += "문의주시면 친절하게 안내해 드리겠습니다. \n";
				message += "감사합니다.";

				returnUrl = "/error/error";

				logger.debug("$$$$$$  returnUr444 >>>>> " + returnUrl);
			}
		} catch(Exception e) {
			message = "주문/결제 진행 중 오류가 발생하였습니다. \n 주문화면 바로가기’ 버튼을 클릭 후 이동하여 다시 진행해 주시기 바랍니다.";
			message += "관련 문의사항은 고객센터(1855-0100 상담시간 : 평일 오전 9:00 ~ 오후 6:00)로 \n";
			message += "문의주시면 친절하게 안내해 드리겠습니다. \n";
			message += "감사합니다.";

			returnUrl = "/error/error";
			logger.debug("$$$$$$  returnUr555 >>>>> " + returnUrl);
		}

		logger.debug("$$$$$$  returnUr6666 >>>>> " + returnUrl);

		JsPrinter.replace(res, returnUrl , message);

	}

	/**
	 * 수납내역
	 * @param request
	 * @param orderVo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/myPayMonthListPage")
	@ResponseBody
	public Map<String, Object> myPayMonthListPage(HttpServletRequest request, @RequestBody RentalMypageVo1 vo)  throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		Map<String, Object> rsMap = new HashMap<String, Object>();

		if(clientVo == null || "".equals(clientVo)) {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			return rsMap;
		} else {
			try {
				//렌탈 관리 리스트
				Map<String,Object> myListMap = rentalMypageSvc1.select_p_sRtre0041ArreDtlListNew(vo);
				List<Map<String, Object>> rtnList = (List<Map<String, Object>>) myListMap.get("serviceList");

				int size = rtnList.size();

				List<Map<String, Object>> pageList = (List<Map<String, Object>>) page(rtnList , 10 , Integer.parseInt(vo.getPageNo()));

				PageVo pageVo = new PageVo();
				pageVo.setTotalCount(size);
				pageVo.setPageNo(Integer.parseInt(vo.getPageNo()));
				pageVo.setPageSize(10);

				rsMap.put("pageCommon", pageVo);
				rsMap.put("rtnList", rtnList);
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} catch(Exception e) {
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
		}
		return rsMap;
	}


	/**
	 * 내 결제 내역 KCP 주문처리 - 연체금
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/arre_pp_cli_hub")
	public ModelAndView arre_pp_cli_hub( HttpServletRequest req, HttpServletResponse response, MypageOrderVO orderVO, PayResultVO payResultVO) {
		ModelAndView mav = new ModelAndView("/mypage/kcp/pp_cli_hub");
		mav.addObject("orderVO", orderVO);
		mav.addObject("payResultVO", payResultVO);
		return mav;
	}

	/**
	 * 나의결제관리- 연체금 결제
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/updatemyOverduePayMytd")
	public void updatemyOverduePayMytd(RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse res, PayResultVO payResultVO , Model model) throws Exception {

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		String message = "정상처리되었습니다.";
		int successCode = 0;
		String rtnUrl = "";

		try {
			if("0000".equals(payResultVO.getResCd())){
				successCode = (int) rentalMypageSvc1.saveOverdueCancel(payResultVO, clientVo.getCustId());

				if(successCode < 0){
					message = "주문/결제 진행 중 오류가 발생하였습니다.";
					rtnUrl = "/error/error";
				} else {
					rtnUrl = "/mypage/myRentalList";
					model.addAttribute("returnUrl", "/mypage/myRentalList");
					model.addAttribute("message",   message);
				}
			} else if("3001".equals(payResultVO.getResCd())) {
				message = "주문/결제가 취소 되었습니다.";
				rtnUrl = "/error/error";
			}	else {
				rtnUrl = "/error/error";
				message = "주문/결제 진행 중 오류가 발생하였습니다.";
			}
		} catch(Exception e) {
			rtnUrl = "/error/error";

			message = "주문/결제 진행 중 오류가 발생하였습니다.";
		}

		JsPrinter.replace(res, rtnUrl, message);
	}

	/**
	 * 렌탈전문점 상세조회
	 * @param HttpServletRequest
	 * @return list
	 * @exception Exception
	 */
	@RequestMapping("/searchAgencyInfo")
	@ResponseBody
    public Map<String , Object> searchAgencyInfo(@RequestParam(value="agencyCd", required=false) String agencyCd ,
    							      HttpServletRequest request, Model model) throws Exception{

		//검색코드 목록2
		PtnInfVO rentalInfo = rentalMypageSvc1.searchAgencyInf(agencyCd);
		List<PtnInfVO> acyFileList = rentalMypageSvc1.getAcyFile(agencyCd);

		// 리스트
		Map<String , Object> rsMap = new HashMap<String, Object>();
		rsMap.put("resultMap", rentalInfo);
		rsMap.put("acyFileList", acyFileList);

		return rsMap;
    }

	/**
	 *	모바일 결제
	 *  kcp_AJAX()에서 호출
	 *
	 */
	@RequestMapping("/orderApproval")
	public ModelAndView orderApproval(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/mypage/kcp/orderApproval");

		return mav;
	}
	/**************************************** Mypage5 통합 부분 종료 ****************************************/

	/**
	 * 비회원 주문조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectNonCustOrdList")
	@ResponseBody
	public Map<String, Object> selectNonCustOrdList(HttpServletRequest request, @RequestBody  MypageSearchVo vo) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();

		List<MypageVo> selectNonCustOrdList = mypageSvc.selectNonCustOrderList(vo);

		if(selectNonCustOrdList.size() > 0) {
			rsMap.put("custMbYn", selectNonCustOrdList.get(0).getCustMbYn());
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		} else {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	/**
	 * 비회원 쿠폰조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectNonCustCouponList")
	@ResponseBody
	public Map<String, Object> selectNonCustCouponList(HttpServletRequest request, @RequestBody  MyCouponSearchVo vo) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();

		List<MyCouponVo> selectNonCustCouponList = mypageSvc.selectNonCustCouponList(vo);

		if(selectNonCustCouponList.size() > 0) {
			rsMap.put("selectNonCustCouponList", selectNonCustCouponList);
			rsMap.put("custMbYn", selectNonCustCouponList.get(0).getCustMbYn());
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		} else {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	/**************************************** 민근 추가 시작 - 무상파손 & 조기마모 보증 ****************************************/
	/**
	 * 마이페이지 > 서비스신청 > 무상파손 보증 신청 페이지_파일업로드
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/freeDamageSrvCreUpload", method=RequestMethod.GET)
	public String freeDamageSrvCreUpload(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> detailMap = new HashMap<String, Object>();

		/* 서비스 신청 리스트 데이터 */
		map.put("ordNo", request.getParameter("ordNo"));
		cfoNextlevelShopDao.selectList(RentalMyPageDao.selectFreeDmgSrvReqList, map);

		List<Map<String,Object>> li = (List<Map<String,Object>>) map.get("vcursor");
		for(Map<String, Object> map2 : li) {
			detailMap = map2;
		}

		model.addAttribute("detailMap", detailMap);

		return "/mypage/freeDamageSrvCreUpload";
	}

	/**
	 * 마이페이지 > 서비스신청 > 조기마모 보증 신청 페이지_파일업로드
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/earlyAbrasionSrvCreUpload", method=RequestMethod.GET)
	public String earlyAbrasionSrvCreUpload(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> detailMap = new HashMap<String, Object>();

		/* 서비스 신청 리스트 데이터 */
		map.put("ordNo", request.getParameter("ordNo"));
		cfoNextlevelShopDao.selectList(RentalMyPageDao.selectFreeDmgSrvReqList, map);

		List<Map<String,Object>> li = (List<Map<String,Object>>) map.get("vcursor");
		for(Map<String, Object> map2 : li) {
			detailMap = map2;
		}

		model.addAttribute("detailMap", detailMap);

		return "/mypage/earlyAbrasionSrvCreUpload";
	}

	/**
	 * 마이페이지 > 서비스신청 > 무상파손 보증 서비스 신청 등록_파일업로드
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertFreeDamageSrvUpload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFreeDamageSrvUpload(MultipartHttpServletRequest mRequest, @RequestBody @RequestParam(value="picSets") List<String> picSets) throws Exception {

		Map<String, Object> rtn = new HashMap<String, Object>();

		FreeDamageServiceVO resultVo = mypageSvc.saveFreeDamageReqUpload(mRequest, picSets);

		rtn.put("successCode", 	 resultVo.getSuccessCode());
		rtn.put("returnMessage", resultVo.getReturnMessage());
		rtn.put("errortext", 	 resultVo.getErrortext());

		return rtn;
	}



	/**
	 * 마이페이지 > 서비스신청 > 조기마모 보증 서비스 신청 등록_파일업로드
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertEarlyAbrasionSrvUpload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertEarlyAbrasionSrvUpload(MultipartHttpServletRequest mRequest, @RequestBody @RequestParam(value="picSets") List<String> picSets) throws Exception {

		Map<String, Object> rtn = new HashMap<String, Object>();

		FreeDamageServiceVO resultVo = mypageSvc.saveEarlyAbrasionReqUpload(mRequest, picSets);

		rtn.put("successCode", 	 resultVo.getSuccessCode());
		rtn.put("returnMessage", resultVo.getReturnMessage());
		rtn.put("errortext", 	 resultVo.getErrortext());

		return rtn;
	}

	/**
	 * 마이페이지 > 서비스신청 > 무상파손&조기마모 보증 서비스 상태 체크 (URL 전용)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/freeDamageSrvCheck", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> freeDamageSrvCheck(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		ArrayList<Object> list = new ArrayList<>();
		FreeDamageServiceVO freeVo = new FreeDamageServiceVO();
		Map<String, Object> rtn = new HashMap<String, Object>();
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		String ordNo = request.getParameter("ordNo");

		if(StringUtils.isEmpty(ordNo)) {
			throw BizExceptionFactoryBean.getInstance().createBizException("CMA0016", new String[] {"주문번호"});  //이/가 존재하지 않습니다.
		}
		logger.debug("Before PageCall ordNo CHECK:::" + request.getParameter("ordNo"));

		//무상파손 서비스 초기 구분 조회
		freeVo.setOrdNo(ordNo);
		Map<String,Object> freeDmgJoinChk = rentalMypageSvc1.select_p_sGetInitInfo(freeVo);

		if(StringUtils.isEmpty(freeDmgJoinChk)) {
			throw BizExceptionFactoryBean.getInstance().createBizException("CMA0016", new String[] {"서비스 초기 조회 내역"});  //이/가 존재하지 않습니다.
		}
		list.add(freeDmgJoinChk.get("freeDmgJoinChk"));
		Map<String,Object> listMap = (Map<String, Object>) list.get(0);

		if(clientVo == null || "".equals(clientVo)) {
			rtn.put("url", 1);
		}

		rtn.put("b00012UseCnt", listMap.get("B00012_USE_CNT"));
		rtn.put("b00011UseCnt", listMap.get("B00011_USE_CNT"));
		rtn.put("registIngYn", listMap.get("registIngYn"));

		return rtn;
	}

	/**
	 * 마이페이지 > 서비스신청 > 무상파손보증 서비스 가입화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/freeDamageSrvJoin", method=RequestMethod.GET)
	public String freeDamageSrvJoin(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> detailMap = new HashMap<String, Object>();

		String rUrl = "";
		String ordNo = request.getParameter("ordNo");

		if(ordNo == null || "".equals(ordNo)) {
			model.addAttribute("sendUrl", "/mypage/freeDamageSrvJoin");
			rUrl = "/login/userLogin";

		}else {
			logger.debug("Join Page Call ordNo CHECK:::" + ordNo);
			//무상파손&조기마모파손 보증 서비스 가입내역 조회
			map.put("ordNo", ordNo);
			cfoNextlevelShopDao.selectList(RentalMyPageDao.selectFreeDmgSrvJoinList, map);

			List<Map<String,Object>> li = (List<Map<String,Object>>) map.get("vcursor");
			for(Map<String, Object> map2 : li) {
				detailMap = map2;
			}

			model.addAttribute("detailMap", detailMap);

			rUrl = "/mypage/freeDamageSrvJoin";
		}

		return rUrl;
	}

	/**
	 * 마이페이지 > 서비스신청 > 조기마모 보증 서비스 가입화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/earlyAbrasionSrvJoin", method=RequestMethod.GET)
	public String earlyAbrasionSrvJoin(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> detailMap = new HashMap<String, Object>();

		String rUrl = "";
		String ordNo = request.getParameter("ordNo");

		ordNo = request.getParameter("ordNo");

		if(ordNo == null || "".equals(ordNo)) {
			model.addAttribute("sendUrl", "/mypage/earlyAbrasionSrvJoin");
			rUrl = "/login/userLogin";

		}else {
			logger.debug("Join Page Call ordNo CHECK:::" + ordNo);
			//무상파손&조기마모파손 보증 서비스 가입내역 조회
			map.put("ordNo", ordNo);
			cfoNextlevelShopDao.selectList(RentalMyPageDao.selectFreeDmgSrvJoinList, map);

			List<Map<String,Object>> li = (List<Map<String,Object>>) map.get("vcursor");
			for(Map<String, Object> map2 : li) {
				detailMap = map2;
			}

			model.addAttribute("detailMap", detailMap);

			rUrl = "/mypage/earlyAbrasionSrvJoin";
		}

		return rUrl;
	}

	/**
	 * 마이페이지 > 서비스신청 > 조기마모 보증 서비스 가입화면(New)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/newEarlyAbrasionSrvJoin", method=RequestMethod.GET)
	public String earlyAbrasionSrvJoinNew(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> detailMap = new HashMap<String, Object>();

		String rUrl = "";
		String ordNo = request.getParameter("ordNo");

		ordNo = request.getParameter("ordNo");

		if(ordNo == null || "".equals(ordNo)) {
			model.addAttribute("sendUrl", "/mypage/earlyAbrasionSrvJoinNew");

		}else {
			logger.debug("Join Page Call ordNo CHECK:::" + ordNo);
			//무상파손&조기마모파손 보증 서비스 가입내역 조회
			map.put("ordNo", ordNo);
			cfoNextlevelShopDao.selectList(RentalMyPageDao.selectFreeDmgSrvJoinList, map);

			List<Map<String,Object>> li = (List<Map<String,Object>>) map.get("vcursor");
			for(Map<String, Object> map2 : li) {
				detailMap = map2;
			}

			model.addAttribute("detailMap", detailMap);

			rUrl = "/react/home";
		}

		return rUrl;
	}

	/**
	 * 마이페이지 > 서비스신청 > 무상파손보증 서비스 신청화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/freeDamageSrvCreate")
	public String freeDamageSrvCreate(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo usrVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> detailMap = new HashMap<String, Object>();

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/freeDamageSrvCreate");
			rUrl = "/login/userLogin";

		}else {
			//시도 조회
			List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

			/* 무상파손보증 고객정보 조회  */
			ReRentalVo custInfo = mypageSvc.CusContView(clientVo);
			clientVo.setCustNo(custInfo.getCustNo());

			/*무상파손보증서비스 신청 리스트 데이터 */
			map.put("ordNo", request.getParameter("ordNo"));
			cfoNextlevelShopDao.selectList(RentalMyPageDao.selectFreeDmgSrvReqList, map);

			List<Map<String,Object>> li = (List<Map<String,Object>>) map.get("vcursor");
			for(Map<String, Object> map2 : li) {
				detailMap = map2;
			}

			model.addAttribute("selectSiDoList", selectSiDoList);	//시도 조회
			model.addAttribute("userVo", usrVo);					//고객정보
			model.addAttribute("custInfo", custInfo);				//고객정보
			model.addAttribute("detailMap", detailMap); 			//신청정보

			rUrl = "/mypage/freeDamageSrvCreate";
		}

		return rUrl;
	}

	/**
	 * 마이페이지 > 서비스신청 > 조기마모보증 서비스 신청화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/earlyAbrasionSrvCreate")
	public String earlyAbrasionSrvCreate(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		UsrVo usrVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> detailMap = new HashMap<String, Object>();

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/mypage/earlyAbrasionSrvCreate");
			rUrl = "/login/userLogin";

		} else {
			//시도 조회
			List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

			/* 조기마모 보증 서비스용 고객정보 조회 */
			ReRentalVo custInfo = mypageSvc.CusContView(clientVo);

			/* 조기마모 보증 서비스 리스트 데이터 */
			map.put("ordNo", request.getParameter("ordNo"));
			cfoNextlevelShopDao.selectList(RentalMyPageDao.selectFreeDmgSrvReqList, map);

			List<Map<String,Object>> li = (List<Map<String,Object>>) map.get("vcursor");
			for(Map<String, Object> map2 : li) {
				detailMap = map2;
			}

			model.addAttribute("selectSiDoList", selectSiDoList);	// 시도 조회
			model.addAttribute("userVo", usrVo);		// 고객정보
			model.addAttribute("custInfo", custInfo);	// 고객정보
			model.addAttribute("detailMap", detailMap); // 주문정보

			rUrl = "/mypage/earlyAbrasionSrvCreate";
		}

		return rUrl;
	}

	/**
	 * 마이페이지 > 서비스신청 > 무상파손보증 서비스 가입 등록하기
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertFreeDamageSrv", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFreeDamageSrv(MultipartHttpServletRequest mRequest, @RequestBody @RequestParam(value="picSets") List<String> picSets) throws Exception {

		Map<String, Object> rtn = new HashMap<String, Object>();
		mRequest.setAttribute("mob", "mob");

		//무상파손 서비스 가입
		FreeDamageServiceVO resultVo = mypageSvc.saveFreeDamageJoin(mRequest, picSets);

		rtn.put("successCode", 	 resultVo.getSuccessCode());
		rtn.put("returnMessage", resultVo.getReturnMessage());
		rtn.put("errortext", 	 resultVo.getErrortext());
		rtn.put("urlGbn", 	     resultVo.getUrlGbn());

		return rtn;

	}

	/**
	 * 마이페이지 > 서비스신청 > 조기마모보증  서비스 가입 등록하기
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertEarlyAbrasionSrv", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertEarlyAbrasionSrv(MultipartHttpServletRequest mRequest, @RequestBody @RequestParam(value="picSets") List<String> picSets) throws Exception {

		Map<String, Object> rtn = new HashMap<String, Object>();
		mRequest.setAttribute("mob", "mob");

		//조기마모 서비스 가입
		FreeDamageServiceVO resultVo = mypageSvc.saveEarlyAbrasionJoin(mRequest, picSets);

		rtn.put("successCode", 	 resultVo.getSuccessCode());
		rtn.put("returnMessage", resultVo.getReturnMessage());
		rtn.put("errortext", 	 resultVo.getErrortext());
		rtn.put("urlGbn", 	     resultVo.getUrlGbn());

		return rtn;
	}

	/**
	 * 마이페이지 > 서비스신청 > 무상파손 보증 서비스 신청하기
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertFreeDamageReq", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFreeDamageReq(MultipartHttpServletRequest mRequest, @RequestBody @RequestParam(value="picSets") List<String> picSets) throws Exception {

		Map<String, Object> rtn = new HashMap<String, Object>();

		//무상파손 서비스 신청
		FreeDamageServiceVO resultVo = mypageSvc.saveFreeDamageReq(mRequest, picSets);

		rtn.put("successCode", 	 resultVo.getSuccessCode());
		rtn.put("returnMessage", resultVo.getReturnMessage());
		rtn.put("errortext", 	 resultVo.getErrortext());

		return rtn;
	}


	/**
	 * 마이페이지 > 서비스신청 > 조기마모 보증 서비스 신청
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertEarlyAbrasionReq", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertEarlyAbrasionReq(MultipartHttpServletRequest mRequest, @RequestBody @RequestParam(value="picSets") List<String> picSets) throws Exception {

		Map<String, Object> rtn = new HashMap<String, Object>();

		//조기마모 서비스 신청
		FreeDamageServiceVO resultVo = mypageSvc.saveEarlyAbrasionReq(mRequest, picSets);

		rtn.put("successCode", 	 resultVo.getSuccessCode());
		rtn.put("returnMessage", resultVo.getReturnMessage());
		rtn.put("errortext", 	 resultVo.getErrortext());

		return rtn;
	}
	/**************************************** 민근 추가 끝 - 무상파손 & 조기마모보증 ****************************************/

	/**
	 * 마이페이지 > 렌탈 가격 비교
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rentalPriceSimulation")
	public String rentalPriceSimulation(HttpServletRequest request, Model model) throws Exception {
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

		if(userVo != null) {
			model.addAttribute("userVo", userVo);
		}

		return "/mypage/rentalPriceSimulation";
	}

	/**
	 * 마이페이지 > 나의 추천인 화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/myRecommend")
	public String myRecommend(HttpServletRequest request, Model model, MypageSearchVo vo) throws Exception {

		request.setCharacterEncoding("utf-8");

		String rUrl = "";
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

		if(userVo == null || "".equals(userVo)) {
			model.addAttribute("sendUrl", "/mypage/myRecommend");
			rUrl = "/login/userLogin";
		} else {
			rUrl = "/mypage/myRecommend";

			OdRecEvtOrdMstToVo custInfo = cboCmDao.selectOne(MyPageDao.selectCustIssInfo, userVo);
			List<OdRecEvtOrdMstToVo> selectEvtList = cboCmDao.selectList(MyPageDao.selectEvtList);

			//추천인정보
			if(custInfo != null){
				model.addAttribute("recNum", custInfo.getRecNum());
				model.addAttribute("custNo", custInfo.getCustNo());
				model.addAttribute("custId", custInfo.getCustId());
			}

			if (selectEvtList.size() > 0 && custInfo != null){
				//이벤트정보
				model.addAttribute("selectEvtList",  selectEvtList);

				OdRecEvtOrdMstToVo paramVo = new OdRecEvtOrdMstToVo();
				paramVo.setEvtSeq(selectEvtList.get(0).getEvtSeq());
				paramVo.setCustId(userVo.getLoginId());

				//이벤트신청정보
				List<OdRecEvtOrdMstToVo> selectOrdEvtList = cboCmDao.selectList(MyPageDao.selectOrdEvtList, paramVo);
				if(selectOrdEvtList.size()>0){
					model.addAttribute("ordEvtCnt", selectOrdEvtList.size());
					model.addAttribute("selectOrdEvtList",  selectOrdEvtList);
				}

				MypageVo selectEvtOrdInfo = cboCmDao.selectOne(MyPageDao.selectEvtOrdInfo, paramVo);
				if(selectEvtOrdInfo != null){
					model.addAttribute("evtSeq", selectEvtOrdInfo.getEvtSeq());
					model.addAttribute("totalRecCnt", selectEvtOrdInfo.getTotalRecCnt());
					model.addAttribute("thisWeekRecCnt", selectEvtOrdInfo.getThisWeekRecCnt());
					model.addAttribute("totalOrdQy", selectEvtOrdInfo.getTotalOrdQy());
					model.addAttribute("usedPt", selectEvtOrdInfo.getUsedPt());
					model.addAttribute("leftPt", selectEvtOrdInfo.getLeftPt());
					model.addAttribute("usedCnt", selectEvtOrdInfo.getUsedCnt());
				}else{
					model.addAttribute("totalRecCnt", 0);
					model.addAttribute("thisWeekRecCnt", 0);
					model.addAttribute("totalOrdQy", 0);
					model.addAttribute("usedPt", 0);
					model.addAttribute("leftPt", 0);
					model.addAttribute("usedCnt", 0);
				}

			}

			model.addAttribute("userId", userVo.getLoginId());
		}
		
		//10233006 GA title tag 동적 변경
		if(StringUtil.equals(rUrl, "/login/userLogin")) {
			model.addAttribute("title", "나의 추천인 코드_로그인 | NEXT LEVEL");
		}else if(StringUtil.equals(rUrl, "/mypage/myRecommend")) {
			model.addAttribute("title", "나의 추천인 코드 | NEXT LEVEL");
		}
		
		return rUrl;
	}

	/**
	 * 마이페이지 > 나의 추천인 코드 > 추천인 화면 경품 신청 하기
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveRecommendEvent")
	@ResponseBody
	public Map<String , Object> saveRecommendEvent(HttpServletRequest request, HttpServletResponse response, @RequestBody OdRecEvtOrdMstToVo vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		vo.setRegUsrId(vo.getCustId());
		vo.setUpdUsrId(vo.getCustId());
		vo.setOrdStsCd("10");//상품준비중(SD651)

		try{
			MypageVo checkVo = cboCmDao.selectOne(MyPageDao.selectEvtOrdInfo, vo);
			if(checkVo.getLeftPt() < vo.getUsedPt()){
				map.put("successCode", "E");
			}else{
				String errorCode = mypageSvc.insertRecEvtOrd(vo);
				map.put("successCode", errorCode);
			}

		}catch(Exception e){
			map.put("successCode", "E");
		}
		return map;
	}

	/**
	 * 마이페이지 >  나의 추천인 코드 > 나의 경품 신청 내역 (배송 내역)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectOrdEvtList")
	@ResponseBody
	public OdRecEvtOrdMstToVo selectOrdEvtList(HttpServletRequest request,  @RequestParam("param") String param ) throws Exception {
		OdRecEvtOrdMstToVo vo = new OdRecEvtOrdMstToVo();
		vo.setRecOrdNo(param);
		return cboCmDao.selectOne(MyPageDao.selectOrdEvtList, vo);
	}

	/**
	 * 마이페이지 > 서비스신청 > 무상파손보증 서비스 가입화면 (New)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/newFreeDamageSrvJoin", method=RequestMethod.GET)
	public String freeDamageSrvJoinNew(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> detailMap = new HashMap<String, Object>();

		String rUrl = "";
		String ordNo = request.getParameter("ordNo");

		if(ordNo == null || "".equals(ordNo)) {
			model.addAttribute("sendUrl", "/mypage/freeDamageSrvJoinNew");
		}else {
			logger.debug("Join Page Call ordNo CHECK:::" + ordNo);
			//무상파손&조기마모파손 보증 서비스 가입내역 조회
			map.put("ordNo", ordNo);
			cfoNextlevelShopDao.selectList(RentalMyPageDao.selectFreeDmgSrvJoinList, map);

			List<Map<String,Object>> li = (List<Map<String,Object>>) map.get("vcursor");
			for(Map<String, Object> map2 : li) {
				detailMap = map2;
			}

			model.addAttribute("detailMap", detailMap);

			rUrl = "/react/home";
		}

		return rUrl;
	}

	/**
	 * 마이페이지 > 서비스신청 > 조기마모보증  서비스 가입 등록하기(New)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertEarlyAbrasionSrvNew", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertEarlyAbrasionSrvNew(@RequestBody Map bodyMap) throws Exception {

		Map<String, Object> rtn = new HashMap<String, Object>();

		try{

			//조기마모 서비스 가입
			FreeDamageServiceVO resultVo = mypageSvc.saveEarlyAbrasionJoinNew(bodyMap);

			rtn.put("successCode", 	 resultVo.getSuccessCode());
			rtn.put("returnMessage", resultVo.getReturnMessage());
			rtn.put("errortext", 	 resultVo.getErrortext());
			rtn.put("urlGbn", 	     resultVo.getUrlGbn());
		}catch(Exception e){

			rtn.put("successCode", 	 "-1");
			rtn.put("returnMessage", e.getMessage());
		}

		return rtn;
	}


	/**
	 * 마이페이지 > 서비스신청 > 무상파손보증 서비스 가입 등록하기 (New)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertFreeDamageSrvNew", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFreeDamageSrvNew(@RequestBody Map<String, Object> param) throws Exception {

		Map<String, Object> rtn = new HashMap<String, Object>();

		try{

			//무상파손 서비스 가입
			FreeDamageServiceVO resultVo = mypageSvc.saveFreeDamageJoinNew(param);

			rtn.put("successCode", 	 resultVo.getSuccessCode());
			rtn.put("returnMessage", resultVo.getReturnMessage());
			rtn.put("errortext", 	 resultVo.getErrortext());
			rtn.put("urlGbn", 	     resultVo.getUrlGbn());
		}catch(Exception e){

			rtn.put("successCode", 	 "-1");
			rtn.put("returnMessage", e.getMessage());
		}

		return rtn;

	}


	/**
	 * 마이페이지 > 서비스신청 > 무상파손 보증 신청 페이지_파일업로드(New)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/newFreeDamageSrvCreUpload", method=RequestMethod.GET)
	public String freeDamageSrvCreUploadNew(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> detailMap = new HashMap<String, Object>();

		/* 서비스 신청 리스트 데이터 */
		map.put("ordNo", request.getParameter("ordNo"));
		cfoNextlevelShopDao.selectList(RentalMyPageDao.selectFreeDmgSrvReqList, map);

		List<Map<String,Object>> li = (List<Map<String,Object>>) map.get("vcursor");
		for(Map<String, Object> map2 : li) {
			detailMap = map2;
		}

		model.addAttribute("detailMap", detailMap);

		return "/react/home";
	}

	/**
	 * 마이페이지 > 서비스신청 > 무상파손 보증 서비스 신청 등록_파일업로드(신규)
	 * @param RequestBody
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertFreeDamageSrvUploadNew", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFreeDamageSrvUploadNew(@RequestBody Map<String, Object> param) throws Exception {

		Map<String, Object> rtn = new HashMap<String, Object>();
		FreeDamageServiceVO resultVo = null;
		try{
			resultVo = mypageSvc.saveFreeDamageReqUploadNew(param);

			rtn.put("successCode", 	 resultVo.getSuccessCode());
			rtn.put("returnMessage", resultVo.getReturnMessage());
			rtn.put("errortext", 	 resultVo.getErrortext());
		}catch(Exception e){

			rtn.put("successCode", 	 "-1");
			rtn.put("returnMessage", e.getMessage());
		}

		return rtn;
	}
}