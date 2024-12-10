package com.nexwrms.mobweb.order.ctl;


import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kcp.J_PP_CLI_N;
import com.nexwrms.cfo.com.cm.svc.AbstractCfoSvc;
import com.nexwrms.cfo.com.cm.svc.AlTalkSendSvc;
import com.nexwrms.cfo.com.cm.svc.SapRfcSvc;
import com.nexwrms.cfo.com.cm.vo.AlTalkSendVo;
import com.nexwrms.cfo.com.cm.vo.PageVo;
import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.cfo.com.constants.SdConstants;
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.cfo.com.member.util.PCISocketProcess;
import com.nexwrms.cfo.com.mypage.vo.MypageVo;
import com.nexwrms.cfo.com.order.svc.FoPaymentSvc;
import com.nexwrms.cfo.com.order.svc.KakaoPaymentSvc;
import com.nexwrms.cfo.com.order.svc.OrderSvc;
import com.nexwrms.cfo.com.order.svc.PgPaymentSvc;
import com.nexwrms.cfo.com.order.svc.SvcBhfSvc;
import com.nexwrms.cfo.com.order.svc.SvcOpertAsignSvc;
import com.nexwrms.cfo.com.order.vo.FoPaymentVo;
import com.nexwrms.cfo.com.order.vo.KkoPaymentVo;
import com.nexwrms.cfo.com.order.vo.OrderVo;
import com.nexwrms.cfo.com.order.vo.PgPaymentVo;
import com.nexwrms.cfo.com.order.vo.SvcBhfVo;
import com.nexwrms.cfo.com.order.vo.SvcOpertAsignVo;
import com.nexwrms.cfo.com.order.vo.TmpOrderVo;
import com.nexwrms.cfo.com.product.vo.PrdRsVo;
import com.nexwrms.cfo.util.JsPrinter;
import com.nexwrms.core.constants.CoreConstants;
import com.nexwrms.core.context.AppContext;
import com.nexwrms.core.exception.BizException;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;
import com.nexwrms.core.util.StringUtil;
import com.nexwrms.nextlevel.com.cart.vo.RentalCartVo;
import com.nexwrms.nextlevel.com.cash.svc.RentalCashSvc;
import com.nexwrms.nextlevel.com.inf.svc.RentalInfSvc;
import com.nexwrms.nextlevel.com.login.vo.ReRentalVo;
import com.nexwrms.nextlevel.com.order.svc.RentalOrderSvc;
import com.nexwrms.nextlevel.com.order.vo.RentalOrderVo;
import com.nexwrms.nextlevel.com.order.vo.RentalPayResultVO;
import com.nexwrms.nextlevel.to.order.vo.RTSD0100ToVo;

/**
 * @Class Name  : OrderCtl.java
 * @Description : 주문관리
 *
 * @Modification Information
 * @
 * @ Date           Author       Description
 * @ -------------  -----------  -------------
 * @ 2019. 10. 23.	Haegun Jung	 	  최초 생성
 *
 */
@RequestMapping("/orderOrg")
@Controller
public class OrderCtl extends AbstractCfoSvc {
	private static final Logger logger = LoggerFactory.getLogger(OrderCtl.class);

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.order.svc.OrderSvc")
	private OrderSvc orderSvc;

	@Autowired
	@Qualifier("com.nexwrms.nextlevel.com.order.svc.RentalOrderSvc")
	private RentalOrderSvc rentalOrderSvc;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.order.svc.FoPaymentSvc")
	private FoPaymentSvc foPaymentSvc;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.order.svc.PgPaymentSvc")
	private PgPaymentSvc pgPaymentSvc;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.order.svc.KakaoPaymentSvc")
	private KakaoPaymentSvc kakaoPaymentSvc;

	@Autowired
	@Qualifier("com.nexwrms.nextlevel.com.inf.svc.RentalInfSvc")
	private RentalInfSvc rentalInfSvc;

	@Autowired
	private SvcBhfSvc svcBhfSvc;

	@Autowired
	private SvcOpertAsignSvc svcOpertAsignSvc;


	@Autowired
	@Qualifier("com.nexwrms.nextlevel.com.cash.svc.RentalCashSvc")
	private RentalCashSvc rentalCashSvc;


	@Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.SapRfcSvc")
	private SapRfcSvc sapRfcSvc;


	@Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.AlTalkSendSvc")
	private AlTalkSendSvc alTalkSendSvc;

	/**
	 * 구매 주문 화면 오픈
	 * @param request
	 * @param model
	 * @param orderVo	- 주문 정보
	 * @param pVo 		- 상품 정보
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/orderPurchase")
	public String orderPurchase(HttpServletRequest request, Model model, OrderVo orderVo, PrdRsVo pVo ) throws Exception {

		// 오일서비스 분기처리 (오일 서비스는 경정비 가능한 대리점만 조회)
		model.addAttribute("oilServiceYn", StringUtil.nvl(request.getParameter("oilServiceYn"), "N"));

		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		ReRentalVo userVo1 = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(userVo != null) {
			if(!"Y".equals(StringUtil.nvl(userVo1.getBizAppYn(),"0")) ) {
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, "관리자 승인 후 주문 할 수 있습니다.");
				return "/login/userLogin";
			}

			orderVo.setCustId(userVo.getLoginId());

			//회원 정보 조회
			RentalOrderVo rVo = rentalOrderSvc.selectMemberInfo(userVo.getLoginId());
			if(!StringUtils.isEmpty(rVo.getMobNo())) {
				orderVo.setMobNo(rVo.getMobNo().replaceAll("-", ""));
			}
			orderVo.setBsnmNo(rVo.getBsnmNo());
			orderVo.setCustNm(rVo.getCustNm());
			orderVo.setCustTyCd(rVo.getCustTyCd());
			orderVo.setMarktRcvAgreYn(rVo.getMarktRcvAgreYn());
			orderVo.setSmsRcvAgreYn(rVo.getSmsRcvAgreYn());
			orderVo.setEmailRcvAgreYn(rVo.getEmailRcvAgreYn());
			orderVo.setOfficerCdYn(StringUtil.isEmpty(userVo.getOfficerCd()) ? "N" : "Y");
			orderVo.setCustTyDtlCd(rVo.getCustTyDtlCd());
			orderVo.setOwnerNm(rVo.getCustNm());
			model.addAttribute("userVo", orderVo);
		} else {
			model.addAttribute("error", "로그인 후 이용하실 수 있습니다.");
			return "/login/userLogin";
		}

		//휴일 정보 가져 오기
		List<RentalOrderVo> hDayList = rentalOrderSvc.selectHDayList();
		model.addAttribute("hDayList", hDayList);

		//list return
		List<OrderVo> ordList = new ArrayList<OrderVo>();

		//상품상세에서 주문
		if("D".equals(orderVo.getPageGbn())) {
			String classCdNm = "";
			if(StringUtil.isEmpty(request.getParameter(orderVo.getClassCd())) ){
				if("P1".equals(orderVo.getClassCd())){
					classCdNm = "승용차";
				} else if("S1".equals(orderVo.getClassCd())){
					classCdNm = "SUV";
				} else if("V1".equals(orderVo.getClassCd())){
					classCdNm = "VEN";
				}
			}
			orderVo.setClassCdNm(classCdNm);			/* 차량분류 명*/
			String seasonNm = "";
			if(StringUtil.isEmpty(request.getParameter(orderVo.getSeasonCd())) ){
				if("01".equals(orderVo.getSeasonCd())){
					seasonNm = "사계절";
				} else if("02".equals(orderVo.getSeasonCd())){
					seasonNm = "겨울";
				} else if("04".equals(orderVo.getSeasonCd())){
					seasonNm = "여름";
				}
			}
			orderVo.setSeasonNm(seasonNm);						/* 계절구분 명 */
			orderVo.setBassSaleFee(pVo.getBassSaleFee());		/* 원 가격*/
			if("Y".equals(orderVo.getOfficerCdYn())) {
				orderVo.setSaleFee(pVo.getStmemSaleAmt());				/* 판매가 (원가 - 할인가격) */
			} else {
				orderVo.setSaleFee(pVo.getSaleFee());				/* 판매가 (원가 - 할인가격) */
			}
			orderVo.setOrderOriAmt(pVo.getOrderO2oOriAmt());	/* 원 가격 * 수량  */
			orderVo.setOrderPayAmt(pVo.getOrderO2oPayAmt());		/* 할인가격* 수량  */
			/* 수량(단위 포함:본)*/
			if(pVo.getOrderO2oCnt() != null) {
				orderVo.setCntCdNm(Integer.parseInt(pVo.getOrderO2oCnt()) < 10 ? pVo.getOrderO2oCnt().substring(1) : pVo.getOrderO2oCnt());
			}
			orderVo.setTireSize(pVo.getTireSize().substring(0, pVo.getTireSize().lastIndexOf(" ")));
			orderVo.setAccuPoint(pVo.getPointAccurt());
			orderVo.setSalePrcPlcNo(pVo.getPrcPlcNo());
			orderVo.setPakAmt("0");
			orderVo.setPkgPlcNo("");
			ordList.add(orderVo);
		}
		//장바구니 데이터 세팅
		else {
			//장바구니 조회
			ordList = orderSvc.selectBasket(orderVo);
			List<String> pkgAmtArr = orderVo.getPkgAmtArr();

			if(pkgAmtArr != null){
				for(String c : pkgAmtArr) {
					String cartNo 	= c.split("@")[0];
					String pakAmt 	= c.split("@")[1];
					String pkgPlcNo = "";
					if(!"0".equals(pakAmt)){
						pkgPlcNo = c.split("@")[2];
					}

					for(int i=0; i<ordList.size(); i++){
						if(cartNo.equals(ordList.get(i).getCartNo())){
							ordList.get(i).setPakAmt(pakAmt);
							ordList.get(i).setPkgPlcNo(pkgPlcNo);
						}
					}
				}
			}
		}

		//쿠폰 정보 가져오기 - 상품별 쿠폰
		List<OrderVo> selectCouponItem = new ArrayList<OrderVo>();
		List<Map<String, Object>> couponItem = new ArrayList<Map<String,Object>>();
		for(OrderVo o : ordList) {
			Map<String, Object> itemMap = new HashMap<String, Object>();
			//쿠폰 정보 가져오기 - 상품별 쿠폰
			o.setCustId(userVo.getLoginId());
			selectCouponItem = orderSvc.selectCouponItem(o);

			itemMap.put("patternCd", o.getPatternCd());
			itemMap.put("selectCouponItem", selectCouponItem);
			if(selectCouponItem.size() > 0) {
				couponItem.add(itemMap);
			}
		}
		model.addAttribute("couponItem", couponItem);

		//쿠폰 정보 가져오기 - 결제 쿠폰(사용자에게 발급)
		List<OrderVo> selectCouponPayment = orderSvc.selectCouponPayment(orderVo);

		//시도 조회
		List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

		model.addAttribute("selectCouponPayment", selectCouponPayment);
		model.addAttribute("orderVo", orderVo);
		model.addAttribute("ordList", ordList);
		model.addAttribute("ordListCnt", ordList.size());
		model.addAttribute("selectSiDoList", selectSiDoList);


		return "/order/orderPurchase";
	}

	/**
	 *	렌탈 주문 화면 오픈
	 * @param request
	 * @param model
	 * @param orderVo	- 주문 정보
	 * @param pVo 		- 상품 정보
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/orderRental")
	public String orderRental(HttpServletRequest request, Model model, RentalOrderVo orderVo) throws Exception {

		ReRentalVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(userVo != null) {
			orderVo.setCustId(userVo.getCustId());

			if(!"Y".equals(StringUtil.nvl(userVo.getBizAppYn(),"0")) ) {
				model.addAttribute("error", "승인 이 후 주문 할 수 있습니다.");
				return "/main";
			}

			//회원 정보 조회
			/*RentalOrderVo rVo = rentalOrderSvc.selectMemberInfo(userVo.getCustId());
			rVo.setOfficerCdYn(StringUtil.isEmpty(userVo.getOfficerCd()) ? "N" : "Y");*/
			model.addAttribute("userVo", userVo);
		} else {
			model.addAttribute("error", "로그인 후 이용하실 수 있습니다.");
			return "/login/userLogin";
		}

		//은행 목록 조회
		List<RentalOrderVo> bankCdList = rentalOrderSvc.selectComCdList("R001");

		//카드 목록 조회
		List<RentalOrderVo> cardCdList = rentalOrderSvc.selectComCdList("R002");

		//렌탈료결제일자코드 목록
		List<RentalOrderVo> payDayList = rentalOrderSvc.selectPayDayList("R002");

		//휴일 정보 가져 오기
		List<RentalOrderVo> hDayList = rentalOrderSvc.selectHDayList();

		//주문번호 생성
		String ordNo = rentalOrderSvc.selectOrderNumber();
		if(StringUtil.isEmpty(ordNo)){
			throw new Exception("주문번호 생성 오류!!!");
		}
		orderVo.setOrdrIdxx(ordNo);

		// 판매상품그룹코드 조회
		String saleCd = orderVo.getSaleCd();//상품코드
		RentalOrderVo rVo = rentalOrderSvc.selectPrdtGrp(saleCd);
		String PrdtGrp	= rVo.getPrdtGrp();
		String PrdtGrpDtl = rVo.getPrdtGrpDtl();

		// 상품별 금액 리스트
		RentalOrderVo returnVo = new RentalOrderVo();
		Map<String, Object> prsSvrMap = new HashMap<String, Object>();

		copyVoToVo(rVo, orderVo);
		rVo.setPrdtGrp(PrdtGrp);
		rVo.setPrdtGrpDtl(PrdtGrpDtl);

		//장바 구니 구분 여부
		if("D".equals(orderVo.getPageGbn())) {
			rVo.setSectionWidth(orderVo.getSearchSw());
			rVo.setAspectRatio(orderVo.getSearchAr());
			rVo.setWheelInches(orderVo.getSearchWi());

			orderVo.setDispSize(orderVo.getSearchSw()+""+orderVo.getSearchAr()+orderVo.getSearchWi()+" "+orderVo.getPlyRating()+"P");
			orderVo.setSectionWidth(orderVo.getSearchSw());
			orderVo.setAspectRatio(orderVo.getSearchAr());
			orderVo.setWheelInches(orderVo.getSearchWi());
			orderVo.setCntCd("0"+orderVo.getCntCdNm().replace("본",""));
		} else {
			//장바구니 조회
			RentalCartVo cVo = rentalOrderSvc.selectItemInfo(orderVo);
			copyVoToVo(orderVo, cVo);

			orderVo.setRenThumImg(cVo.getAtflPathNm());
			rVo.setSectionWidth(orderVo.getSectionWidth());
			rVo.setAspectRatio(orderVo.getAspectRatio());
			if(orderVo.getWheelInches().indexOf(" ") > -1 ){
				rVo.setWheelInches(orderVo.getWheelInches().split(" ")[0]);
			} else {
				rVo.setWheelInches(orderVo.getWheelInches());
			}
		}
		rVo.setPlyRating(orderVo.getPlyRating());
		rVo.setPetternCd(orderVo.getPatternCd());
		rVo.setCntCd(orderVo.getCntCdNm().replace("본", ""));
		rVo.setPeriodCd(orderVo.getPeriodCd());
		rVo.setRegiAmt(orderVo.getRegiAmt());

		//자유렌탈
		if("01".equals(rVo.getPrdtGrp()) && "04".equals(rVo.getPrdtGrpDtl())) {
			// 자유렌탈 판매상품 렌탈료
			returnVo = rentalOrderSvc.selectCalculateSelfProdFee(rVo); // 자유 렌탈료
			returnVo.setOrgRegiAmt(orderVo.getRegiAmt());
		}
		//멤버십
		else if("04".equals(rVo.getPrdtGrp()) && "09".equals(rVo.getPrdtGrpDtl())){ //멤버십

			returnVo = rentalOrderSvc.sRtsd0005ShopMmSaleAmt(rVo);

			// 상품별 서비스 리스트 저장
			RentalOrderVo svrMap = rentalOrderSvc.sRtsd0005ShopMemberShip(rVo);

			prsSvrMap.put("saleNm", svrMap.getSaleNm());
			prsSvrMap.put("periodCd", svrMap.getPeriodCd());

			if("B00001".equals(svrMap.getPrsDcd())) { //엔진오일
				prsSvrMap.put("selEnginCd", svrMap.getServCnt());
			}else if("B00002".equals(svrMap.getPrsDcd())){ //위치교환
				prsSvrMap.put("selLocCd", svrMap.getServCnt());
			}else if("B00003".equals(svrMap.getPrsDcd())){ //방문점검
				prsSvrMap.put("selVisCd", svrMap.getServCnt());
			}else if("B00004".equals(svrMap.getPrsDcd())){ //보관
				prsSvrMap.put("selSaveCd", svrMap.getServCnt());
			}else if("B00006".equals(svrMap.getPrsDcd())){ //교체
				prsSvrMap.put("selEnginCd", svrMap.getServCnt());
			}else if("B00007".equals(svrMap.getPrsDcd())){ //프리미엄(사계절보증제도)
				prsSvrMap.put("selPrCd", svrMap.getServCnt());
			}else if("B00008".equals(svrMap.getPrsDcd())){ //얼라인먼트
				prsSvrMap.put("selArCd", svrMap.getServCnt());
			}
		} else{
			//추천상품, 일시불상품
			returnVo = rentalOrderSvc.sRtsd0005ShopAmt(rVo);

			//등록비 세팅
			String regiAmt = "";
			String cnt = orderVo.getCntCdNm().replace("본", "");
			regiAmt = StringUtil.nvl(orderVo.getRegiAmt(),"0");
			//regiAmt = String.valueOf(Integer.parseInt("12500") * Integer.parseInt(cnt));


			returnVo.setOrgRegiAmt(regiAmt);
			returnVo.setRegiAmt(regiAmt);

			//최종 금액 세팅
			String totalAmt = String.valueOf(Integer.parseInt(returnVo.getTotalAmt()) - Integer.parseInt(StringUtil.nvl(orderVo.getRegiAmt(),"0")));
			returnVo.setTotalAmt(totalAmt);
		}

		//List<RentalPrdSearchVo> regAmtList = rentalProductSvc.selectRntalRegAmtList(vo);

		// 상품 구분코드 추가
		returnVo.setPrdtGrp(rVo.getPrdtGrp());
		returnVo.setPrdtGrpDtl(rVo.getPrdtGrpDtl());

		/* 재렌탈 시 렌탈 상품 등록금 할인금액 추가 */
		BigDecimal reRentalDcAmt = BigDecimal.ZERO;
		String reRentalOrdNo = StringUtil.nvl(userVo.getReRentalYn(), "N");
		String reRentalDc = StringUtil.nvl(rentalOrderSvc.selectDcRate(), "0");

		// 렌탈료 금액
		if("01".equals(rVo.getPrdtGrpDtl()) && !"N".equals(reRentalOrdNo)){
			//소수점 계산 위해서 BigDecimal 사용
			BigDecimal regiAmt = new BigDecimal(returnVo.getRegiAmt());
			BigDecimal reRentDcRate = new BigDecimal(reRentalDc);// 재렌탈 할인율
			BigDecimal tempRate = new BigDecimal("100");

			reRentDcRate = reRentDcRate.divide(tempRate);
			reRentalDcAmt = regiAmt.multiply(reRentDcRate); //할인금액

			if(reRentalDcAmt.compareTo(regiAmt) == 1){
				reRentalDcAmt = regiAmt;
			}
		}else{
			reRentalOrdNo = "N";
			reRentalDc = "0";
		}

		//시도 조회
		List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

		model.addAttribute("selectSiDoList"		, selectSiDoList);
		model.addAttribute("rentalProd"			, returnVo);
		model.addAttribute("bankCdList"			, bankCdList);
		model.addAttribute("cardCdList"			, cardCdList);
		model.addAttribute("payDayList"			, payDayList);
		model.addAttribute("hDayList"			, hDayList);
		model.addAttribute("reRentalOrdNo"		, reRentalOrdNo);				// 재렌탈 계약 번호
		model.addAttribute("reRentalDc"			, reRentalDc);					// 재렌탈 할인률
		model.addAttribute("reRentalDcAmt"		, reRentalDcAmt.toString());	// 재렌탈 할인률
		model.addAttribute("prsSvrMap"			, prsSvrMap);					// 맴버쉽 서비스 리스트?
		model.addAttribute("orderVo"			, orderVo);


		return "/order/orderRental";
	}

	/**
	 * 카드 유효성 체크
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/kcphubBatch")
	@ResponseBody
	public Map<String, Object> kcphubBatch(Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			//회원 세션정보 조회로 safekey 확인
			ReRentalVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

			//영업 고객 존재 여부 확인 및 신규생성
			RentalOrderVo ovo = new RentalOrderVo();
			ovo.setCustId(userVo.getCustId());
			String custNo = rentalInfSvc.srhCustId(ovo);
			
			//영업 고객 존재 여부 확인 및 신규생성
			//String custNo = rentalOrderSvc.selectSrhCustId(userVo.getCustId());

			paramMap.put("dvsn", 	     "I");
			paramMap.put("ccertDay",     null);									                                              //배치신청일
			paramMap.put("ccertSeq",     null);									                                              //일련번호

			paramMap.put("cardNo", 	     (String)request.getParameter("pay_id"));
			paramMap.put("expireYm",     (String)request.getParameter("pay_expiry_yy") + (String)request.getParameter("pay_expiry_mm")); //카드유효기간
			paramMap.put("ownerNm",	     (String)request.getParameter("pay_owner_nm") );                                      //카드소지자명
			paramMap.put("ebirDay",      (String)request.getParameter("pay_cert_no")); 	                                      //생년월일
			paramMap.put("custTp", 	     "0" + request.getParameter("cmbGubun"));	                                  //사용자구분- 1:개인/2:사업자
			paramMap.put("buslNo", 	     (String)request.getParameter("busl_no"));	                                          //사업자번호
			paramMap.put("ccertId",      null);
			paramMap.put("custNo", 	     custNo);                                                                             //고객아이디-옵션
			paramMap.put("custNm", 	     (String)request.getParameter("cust_name"));		                                  //고객명
			paramMap.put("mobNo", 	     null);									                                              //핸드폰번호
			paramMap.put("emailAddr",    null);									                                              //이메일주소
			paramMap.put("bkeyChk",      "N");									                                              //성공여부
			paramMap.put("cardcomCd",    (String)request.getParameter("cardcomCd"));		                                  //은행코드(카드사코드)
			paramMap.put("batchKey",     null);
			//####운영, 개발과 group_id 동일함###############
			paramMap.put("group_id",   "V54071001305");
			//#############################################
			paramMap.put("regId",        "ONL_SYS");
			paramMap.put("sqlnamespace", "cardReqDAO.saveCardBatch");

			resultMap = rentalOrderSvc.saveCardBatch(paramMap);


			/*  request.setCharacterEncoding("utf-8") ; */
			  request.setCharacterEncoding("EUC-KR") ;
		    /* ============================================================================== */
		    /* =   01. 지불 요청 정보 설정                                                  = */
		    /* = -------------------------------------------------------------------------- = */
			  //00100000
		    String    tran_cd         		= "00100500";                                           // 거래구분코드
		    String    cust_ip        		= request.getRemoteAddr();                          	// 요청IP
		    String    res_cd          		= "";                                                   // 결과코드
		    String    res_msg         		= "";                                                   // 결과메시지
			String    group_id        		= "";                                                   // 그룹ID
		    String    batch_key       		= "";                                                   // 배치키
			String    pay_type        		= "";                                                   // 결제수단
			String    pay_id          		= "";                                                   // 카드번호
			String    pay_cert_no     		= "";                                                   // 주민(사업자)번호
			String    pay_issue_cd    		= "";                                                   // 카드발급사코드
			String    pay_issue_nm    		= "";                                                   // 카드발급사이름
		    int       pay_data_set    		=  0;
		    int       common_data_set 	=  0;
		    int       batch_data_set  		=  0;
		    /* ============================================================================== */

			/* ============================================================================== */
			/* = -------------------------------------------------------------------------- = */
			/* =     01-2. 지불 데이터 셋업 (변경 불가)                              = */
			/* = -------------------------------------------------------------------------- = */

			String g_conf_log_level = AppContext.getString(WebConstants.KCP_RENTAL_CONF_LOG_LEVEL);
			String g_conf_gw_port = AppContext.getString(WebConstants.KCP_RENTAL_CONF_GW_PORT);
			int g_conf_tx_mode = 0;


		    /* ============================================================================== */
		    /* =   02. 인스턴스 생성 및 초기화                                              = */
		    /* = -------------------------------------------------------------------------- = */

			String home_dir = AppContext.getString(WebConstants.KCP_RENTAL_KEY_FILE);
			String g_conf_log_dir  = AppContext.getString(WebConstants.KCP_RENTAL_LOG_DIR);

			//BATCH KEY 발급(인증) : 사이트 코드 V5407
			String g_conf_gw_url   = AppContext.getString(WebConstants.KCP_RENTAL_CONF_GW_URL);


		    J_PP_CLI_N c_PayPlus = new J_PP_CLI_N();
		    String conf_gw_url = AppContext.getString(CoreConstants.KCP_CONF_GW_URL);
			String conf_gw_port = AppContext.getString(CoreConstants.KCP_CONF_GW_PORT);
			String conf_tx_mode = AppContext.getString(CoreConstants.KCP_CONF_TX_MODE);
			String conf_log_dir = AppContext.getString(CoreConstants.KCP_LOG_DIR);

			//c_PayPlus.mf_init(home_dir, g_conf_gw_url, conf_gw_port, Integer.parseInt(conf_tx_mode), conf_log_dir);

			c_PayPlus.mf_init(home_dir, g_conf_gw_url, g_conf_gw_port, Integer.parseInt(conf_tx_mode), g_conf_log_dir);


		   // c_PayPlus.mf_init_set();


			//c_PayPlus.mf_init( g_conf_home_dir, g_conf_gw_url, g_conf_gw_port, g_conf_key_dir, g_conf_log_dir );
		    c_PayPlus.mf_init_set();

		    /* ============================================================================== */


		    /* ============================================================================== */
		    /* =   03. 처리 요청 정보 설정, 실행                                            = */
		    /* = -------------------------------------------------------------------------- = */

		    // 업체 환경 정보
		    pay_data_set    = c_PayPlus.mf_add_set( "payx_data" );

		    // 공통 정보
		    common_data_set = c_PayPlus.mf_add_set( "common"    );

		    c_PayPlus.mf_set_us( common_data_set, "currency"    , "410"   );
		    c_PayPlus.mf_set_us( common_data_set, "media_type"  , "R"     );
		    c_PayPlus.mf_set_us( common_data_set, "cust_ip"     , cust_ip );

		    c_PayPlus.mf_add_rs( pay_data_set, common_data_set );



		    // 배치 신청정보
		    batch_data_set = c_PayPlus.mf_add_set( "real_batch" ) ;
		    c_PayPlus.mf_set_us( batch_data_set, "tx_type"        , "BC01" );
		    c_PayPlus.mf_set_us( batch_data_set, "tx_sub_type"    , "MG01" );

		    c_PayPlus.mf_set_us( batch_data_set, "tx_type"        , "BC01" );
		    c_PayPlus.mf_set_us( batch_data_set, "tx_sub_type"    , "MG01" );


		    c_PayPlus.mf_set_us( batch_data_set, "group_id", 		"V54071001305"); 		//그룹ID
		    c_PayPlus.mf_set_us( batch_data_set, "site_cust_id",    (String)resultMap.get("custNo")); 			//고객번호
			c_PayPlus.mf_set_us( batch_data_set, "site_apply_ymd", 	(String)resultMap.get("ccertDay")); 			//신청접수 일자
		    c_PayPlus.mf_set_us( batch_data_set, "site_apply_no", 	(String)resultMap.get("ccertSeq")); 			//신청접수 일련번호


		    c_PayPlus.mf_set_us( batch_data_set, "bill_type", 			"01"); 											//결제유형
		    c_PayPlus.mf_set_us( batch_data_set, "bill_mony", 			"1004"); 										//결제금액
		    c_PayPlus.mf_set_us( batch_data_set, "bill_period", 		"12" ); 										//결제주기
		    c_PayPlus.mf_set_us( batch_data_set, "bill_day", 			"01"); 											//결제일
		    c_PayPlus.mf_set_us( batch_data_set, "init_bill_ym", 		""); 											//최초 결제월
		    c_PayPlus.mf_set_us( batch_data_set, "noti_type", 			"111"); 										//고지방법

		    // ▣ 고객정보
		    String cust_type = resultMap.get("custTp") == null ? "" : (String)resultMap.get("custTp") ; 			//개인, 법인구분


			if("01".equals(cust_type)) {
		    	c_PayPlus.mf_set_us( batch_data_set, "cust_type", 	 		"P"); 										//고객유형(P개인, C법인)
			} else if("02".equals(cust_type)) {
		    	c_PayPlus.mf_set_us( batch_data_set, "cust_type", 	 		"C"); 										//고객유형(P개인, C법인)
			}


		    c_PayPlus.mf_set_us( batch_data_set, "cust_name", 		(String)resultMap.get("custNm")); 					//고객명
		    c_PayPlus.mf_set_us( batch_data_set, "mobile_no", 		(String)resultMap.get("mobNo")); 					//휴대폰번호
		    c_PayPlus.mf_set_us( batch_data_set, "tel_no",			""); //전화번호
		    c_PayPlus.mf_set_us( batch_data_set, "email", 			""); 				//E-Mail
		    c_PayPlus.mf_set_us( batch_data_set, "pay_relation", 	""); //결제자와 관계


		    // ▣ 결제정보
		    c_PayPlus.mf_set_us( batch_data_set, "pay_type", 		"PACA"							       ); 			//결제수단
		    c_PayPlus.mf_set_us( batch_data_set, "pay_id", 			(String)resultMap.get("cardNo"));   				//카드번호

		    String yyyy = (String)resultMap.get("expireYm");
		    String yy    = "";
		    String mm  = "";
		   	 if(!"".equals(yyyy)) {
		   		yy = yyyy.substring(2, 4);
		   		mm = yyyy.substring(4, 6);
		   	} else {
		   		yy = "00";
		   		mm = "00";
		   	}

		    c_PayPlus.mf_set_us( batch_data_set, "pay_expiry"     ,  yy     //유효기간(YY)
		                                                          			+ mm ); //유효기간(MM)
		    c_PayPlus.mf_set_us( batch_data_set, "pay_quota", 		""); //할부 개월수
		    c_PayPlus.mf_set_us( batch_data_set, "pay_owner_nm", (String)resultMap.get("ownerNm")   ); //카드소유자명



		    if("01".equals(cust_type)) {
		    	c_PayPlus.mf_set_us( batch_data_set, "pay_cert_no"    , (String)resultMap.get("ebirDay") + "0000000"   ); 	//주민등록번호
		    } else if("02".equals(cust_type)) {
		    	c_PayPlus.mf_set_us( batch_data_set, "pay_cert_no"    , (String)resultMap.get("buslNo") ); 					//사업자번호
		    }

		    c_PayPlus.mf_add_rs( pay_data_set, batch_data_set ) ;

		    /* ============================================================================== */
		    /* =   03-3. 실행                                                               = */
		    /* ------------------------------------------------------------------------------ */
		    String siteCd = AppContext.getString(WebConstants.NiceSafeKey.SAFEKEY_SITE_CD);
			String siteKey = AppContext.getString(WebConstants.NiceSafeKey.SAFEKEY_SITE_KEY);

		    c_PayPlus.mf_do_tx( siteCd, siteKey, tran_cd, cust_ip, "0", "3", "0" );

		    res_cd  = c_PayPlus.m_res_cd;                              // 결과 코드
		    res_msg = c_PayPlus.m_res_msg;                             // 결과 메시지

		    System.out.println("res_cd          " + res_cd     );
		    System.out.println("m_res_msg       " + res_msg     );

		    if(res_cd.equals("0000"))
		    {
		        group_id     		= c_PayPlus.mf_get_res( "group_id"     ); // 그룹ID
		        batch_key    		= c_PayPlus.mf_get_res( "batch_key"    ); // 배치키
		        pay_type     		= c_PayPlus.mf_get_res( "pay_type"     ); // 결제수단
		        pay_id       		= c_PayPlus.mf_get_res( "pay_id"       ); // 사업자번호
		        pay_cert_no  		= c_PayPlus.mf_get_res( "pay_cert_no"  ); // 주민(사업자번호)
		        pay_issue_cd 		= c_PayPlus.mf_get_res( "pay_issue_cd" ); // 카드발급사코드
		        pay_issue_nm 		= c_PayPlus.mf_get_res( "pay_issue_nm" ); // 카드발급사이름
		    }

		    System.out.println("batch_key         " + batch_key    );

		    // 결과값을 리턴받아 로그 테이블에 성공여부 및 은행코드등을 수정한다.
		    Map<String, Object> map = new HashMap<String, Object>();
			map.put("sqlnamespace", "cardReqDAO.saveCardBatchResult");
			map.put("ccertSeq",  (String)resultMap.get("ccertSeq"));
			map.put("ccertDay",  (String)resultMap.get("ccertDay"));
			map.put("cardcomCd", (String)resultMap.get("cardcomCd"));
			map.put("resCd",     res_cd);
			map.put("batchKey",  batch_key);
			map.put("bkeyChk",   (String)resultMap.get("bkeyChk"));
			map.put("res_cd",    res_cd);
			map.put("res_msg",   res_msg);
			map.put("regId",     "ONL_SYS");
			map.put("dvsn", "U");
			if(!"0000".equals(res_cd)) {
				map.put("bkeyChk", "N");
			} else {
				map.put("bkeyChk", "Y");
			}

		    resultMap = rentalOrderSvc.saveKcphubBatchResult(map);


		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return resultMap;
	}

	/**
	 * 주문 저장 : 렌탈
	 * @param req
	 * @param orderVO
	 * @param payResultVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("noPayProcShop")
	public String resultNopay(RedirectAttributes redirectAttributes, HttpServletRequest req, RentalOrderVo orderVO, RentalPayResultVO payResultVO, Model model) throws Exception {

		int success = -1;
		String rtnUrl = "";

		try {

			//회원 세션정보 조회로 safekey 확인
			ReRentalVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
			//영업 고객 존재 여부 확인 및 신규생성
			String custNo = rentalOrderSvc.selectSrhCustId(userVo.getCustId());

			orderVO.setCustNo(custNo);
			orderVO.setCustId(userVo.getCustId());

			// rtsd0100 해당 고객 번호에 주소 update
			RTSD0100ToVo rTSD0100ToVo = new RTSD0100ToVo();
			copyVoToVo(rTSD0100ToVo, orderVO);
			rentalOrderSvc.insertRTSD0100(rTSD0100ToVo);

			//온라인 및 영업시스템 데이터 저장처리
			success = rentalOrderSvc.saveOrdrInfoNopayShop(orderVO, req);

			if(success==0){

				redirectAttributes.addFlashAttribute("orderVO", orderVO);

				rtnUrl = "/order/rentalOrderComplete";
			} else {
				//실패일 때 리턴 형식
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);

				rtnUrl = "/error/error";
			}

		} catch (Exception e) {
			e.printStackTrace();
			//실패일 때 리턴 형식
			model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);

			rtnUrl = "/error/error";
		}

		return "redirect:"+rtnUrl;
	}

	/**
	 * 주문 완료 : 렌탈
	 * @param request
	 * @param model
	 * @param orderVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rentalOrderComplete")
	public String rentalOrderComplete(HttpServletRequest request, Model model, @ModelAttribute(value="orderVO") RentalOrderVo orderVO)  throws Exception {
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy.MM.dd");
		String ordDt = format.format(new Date());
		model.addAttribute("ordDt", ordDt);
		model.addAttribute("orderVO", orderVO);

		return "/order/rentalOrderComplete";
	}

	/**
	 * 주문번호  채번
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectOrdNo")
	@ResponseBody
	public Map<String, Object> selectOrderCustNo(HttpServletRequest request, OrderVo orderVo)  throws Exception {
		String ordNo =  orderSvc.selectOrdNo();

		//거점 배정
		orderVo.setOrdNo(ordNo);
		Map<String, Object> rtn = new HashMap<String, Object>();
		try {

			//rtn = assignment(orderVo);

			//if(rtn != null || "0".equals(rtn.get("rtnCode").toString())){
				//성공일 때 리턴 형식
				rtn.put("ordNo", ordNo);
			//}
		} catch(BizException e) {
			System.out.println(e.getMessage());
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, e.getMessage());
		}

		return rtn;
	}

	/**
	 * 거점배정
	 * @param orderVo
	 * @return
	 * @throws Exception
	 */
    public Map<String, Object> assignment(OrderVo orderVo) throws Exception {
       SvcOpertAsignVo vo = new SvcOpertAsignVo();
       vo.setOrdNo(orderVo.getOrdNo());
       vo.setOpertSe(orderVo.getMountCd());
       if("10".equals( orderVo.getMountCd())) {
			//방문장착
    	   vo.setOpertSeDtl("1010");
		} else if("20".equals( orderVo.getMountCd())) {
			//픽업
			vo.setOpertSeDtl("1020");
		    vo.setPickupZip(orderVo.getPickupZip());
		    vo.setPickupBassAddr(orderVo.getPickupBassAddr());
		    vo.setPickupDtlAddr(orderVo.getPickupDtlAddr());
		} else if("40".equals( orderVo.getMountCd())) {
			//전문점
			vo.setOpertSeDtl("1030");
		}
       String custNo = (orderSvc.selectCustNo(orderVo)).get("custNo").toString();
       vo.setProcDueBhf(orderVo.getOrgzCd());
       vo.setDueDe(orderVo.getIstReqDe());
       vo.setDueTime(orderVo.getIstDueDe());
       vo.setCustNo(custNo);
       vo.setCustNm(orderVo.getCustNm());
       vo.setCustTyCd("1");
       vo.setRentCntrYn("N");
       vo.setIplCustNm(orderVo.getCustNm());
       vo.setIplZip(orderVo.getIplZip());
       vo.setIplAddr(orderVo.getIplAddr());
       vo.setIplDtlAddr(orderVo.getIplDtlAddr());
       vo.setCustReqCn(orderVo.getCustReqCn());
       vo.setMobNo(orderVo.getMobNo());

       vo.setTelNo("");
       vo.setRegUsrId("mobusr");
       vo.setUpdUsrId("mobusr");

       List<SvcOpertAsignVo> reqItems = new ArrayList<SvcOpertAsignVo>();
       for(int i =0; i<orderVo.getItemCdArr().size(); i++) {
    	   SvcOpertAsignVo itemVo = new SvcOpertAsignVo();
    	   itemVo.setItemCd(orderVo.getItemCdArr().get(i));
    	   itemVo.setOrdQy(Integer.parseInt(orderVo.getItemCntArr().get(i)));
    	   reqItems.add(itemVo);
       }

       vo.setItemList(reqItems);   //상품

       Map<String, Object> rsMap = svcOpertAsignSvc.save(vo);

       return rsMap;
	}


    /**
     * 거점 재고 체크 및 o2o
     * @param request
     * @param orderVo
     * @return
     * @throws Exception
     */
    @RequestMapping("/o2oStock")
  	@ResponseBody
  	public Map<String, Object> o2oStock(HttpServletRequest request, @RequestBody OrderVo orderVo)  throws Exception {
  		Map<String, Object> rsMap = new HashMap<String, Object>();

  		try {
  			List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();

  			SvcBhfVo vo = new SvcBhfVo();
			if("N".equals(orderVo.getO2oYn())) {
				List<Map> reqItems = new ArrayList<Map>();
				for(int i=0; i< orderVo.getItemCdArr().size(); i++){
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("itemCd", orderVo.getItemCdArr().get(i));
					map.put("reqQy", orderVo.getItemCntArr().get(i));
					reqItems.add(map);
				}

				vo.setO2oYn(orderVo.getO2oYn()); 			//o2o구분
				vo.setItemList(reqItems);  					 //상품
				vo.setAddr(orderVo.getIplAddr());   		//주소
				vo.setOpertSe(orderVo.getMountCd());      	//작업 구분
			}

			Map<String, Object> gujumList = svcBhfSvc.selectList(vo);
			List<SvcBhfVo> nearList = new ArrayList<SvcBhfVo>();
			nearList = (List<SvcBhfVo>) gujumList.get("nearList");

  			if(nearList == null || nearList.size() == 0){
  				//실패일 때 리턴 형식
  				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
  				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "재고 일시 품절로 주문이 불가합니다.");
  			}
  			else{
  				if("Y".equals( orderVo.getO2oYn())) {
  					int size = nearList.size();

  					PageVo pageVo = new PageVo();
  					pageVo.setTotalCount(rtnList.size());
  					pageVo.setPageNo(Integer.parseInt(orderVo.getPageNo()));
  					pageVo.setPageSize(10);

  					List<Map<String, Object>>  pageList = (List<Map<String, Object>>) page(nearList , 10, Integer.parseInt(orderVo.getPageNo()) );
  					rsMap.put("pageList", pageList);
  					rsMap.put("pageCommon", pageVo);
  				}

  				rsMap.put("rtnList", nearList);
  				rsMap.put("o2oYn", orderVo.getO2oYn());

  				String[] weekDay = { "sun", "mon", "thu", "wen", "thu", "fri", "sat" };
  				Calendar cal = Calendar.getInstance();
  	    	   	int num = cal.get(Calendar.DAY_OF_WEEK)-1;
  		      	String today = weekDay[num];
  		      	orderVo.setMountTime(today);
  		      	List<OrderVo> orderTimeList = orderSvc.selectOrderTime(orderVo);
  		      	rsMap.put("orderTimeList", orderTimeList);

  				//성공일 때 리턴 형식
  				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
  				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
  			}
  		} catch(Exception e) {
  			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
  			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, e.getMessage());
  		}

  		return rsMap;
  	}

  	/**
  	 * 나의 위치 근처 렌탈 전문점 가져오기 && o2o 전문점 찾기
  	 * @param request
  	 * @param orderVo
  	 * @return
  	 * @throws Exception
  	 */
	@RequestMapping("/searchRentStore")
	@ResponseBody
	public Map<String, Object> searchRentStore(HttpServletRequest request, @RequestBody OrderVo orderVo)  throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();

		try {
			List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();

			SvcBhfVo vo = new SvcBhfVo();
			if("N".equals(orderVo.getO2oYn())) {
				List<Map> reqItems = new ArrayList<Map>();
				for(int i=0; i< orderVo.getItemCdArr().size(); i++){
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("itemCd", orderVo.getItemCdArr().get(i));
					map.put("reqQy", orderVo.getItemCntArr().get(i));
					reqItems.add(map);
				}

				vo.setItemList(reqItems);  					 //상품
				vo.setAddr(orderVo.getIplAddr());   		//주소
				vo.setOpertSe(orderVo.getMountCd());      	//작업 구분
			}

			vo.setO2oYn(orderVo.getO2oYn()); 			//o2o구분

			Map<String, Object> gujumList = svcBhfSvc.selectList(vo);
			List<SvcBhfVo> nearList = new ArrayList<SvcBhfVo>();
			nearList = (List<SvcBhfVo>) gujumList.get("nearList");

			if(nearList == null || nearList.size() == 0){
				//실패일 때 리턴 형식
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "현재 선택하신 지역에 장착점이 없습니다.");
			}
			else{
				if("40".equals(orderVo.getMountCd())) {
					for(SvcBhfVo mVo : nearList) {
						Map<String,  Object> rtnMap = new HashMap<String, Object>();
						String bpCd = mVo.getBpCd().substring(4,10).toString();
						RentalOrderVo sVo = rentalOrderSvc.searchRentStoreIcon(bpCd);
						if(sVo != null) {
							rtnMap.put("seasonGbn", sVo.getSeasonGbn());
							rtnMap.put("chYn", sVo.getChYn());
							rtnMap.put("cWYn", sVo.getCwYn());
							rtnMap.put("fmYn", sVo.getFmYn());
							rtnMap.put("lmYn", sVo.getLmYn());
						}

						rtnMap.put("salesGroup", mVo.getSaleGrpCd());
						rtnMap.put("salesOffice", mVo.getSaleOffice());
						rtnMap.put("bhfNm", mVo.getBhfNm());	//대리점 명
						rtnMap.put("lon", mVo.getLongitude());	//위도
						rtnMap.put("lat", mVo.getLatitude());	//경도
						rtnMap.put("addr", mVo.getAddr());		//주소
						rtnMap.put("bhfCd", mVo.getBhfCd());		//조직코드
						rtnMap.put("bpCd", mVo.getBpCd());		//거점코드
						rtnMap.put("wrhCd", mVo.getWrhCd());		//창고코드
						rtnMap.put("postNo", mVo.getPostNo());		//우편번호
						rtnMap.put("detailList", mVo.getDetailList());		//

						rtnList.add(rtnMap);
					}
				} else {
					for(SvcBhfVo mVo : nearList) {
						Map<String,  Object> rtnMap = new HashMap<String, Object>();
						rtnMap.put("salesGroup", mVo.getSaleGrpCd());
						rtnMap.put("salesOffice", mVo.getSaleOffice());
						rtnMap.put("bhfNm", mVo.getBhfNm());	//대리점 명
						rtnMap.put("lon", mVo.getLongitude());	//위도
						rtnMap.put("lat", mVo.getLatitude());	//경도
						rtnMap.put("addr", mVo.getAddr());		//주소
						rtnMap.put("bhfCd", mVo.getBhfCd());		//조직코드
						rtnMap.put("bpCd", mVo.getBpCd());		//거점코드
						rtnMap.put("wrhCd", mVo.getWrhCd());		//창고코드
						rtnMap.put("postNo", mVo.getPostNo());		//우편번호
						rtnMap.put("detailList", mVo.getDetailList());		//
						rtnList.add(rtnMap);
					}
				}

				//성공일 때 리턴 형식
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

				List<Map<String, Object>> rtnList1 = new ArrayList<Map<String, Object>>();
				rtnList1 = (List<Map<String, Object>>) page(rtnList , 5, Integer.parseInt(orderVo.getPageNo()) );

				rsMap.put("list", rtnList1);

				PageVo pageVo = new PageVo();
				pageVo.setTotalCount(rtnList.size());
				pageVo.setPageNo(Integer.parseInt(orderVo.getPageNo()));
				pageVo.setPageSize(5);
				rsMap.put("pageCommon", pageVo);

				String[] weekDay = { "sun", "mon", "thu", "wen", "목요일", "fri", "sat" };
  				Calendar cal = Calendar.getInstance();
  	    	   	int num = cal.get(Calendar.DAY_OF_WEEK)-1;
  		      	String today = weekDay[num];
  		      	orderVo.setMountTime(today);
  		      	List<OrderVo> orderTimeList = orderSvc.selectOrderTime(orderVo);
  		      	rsMap.put("orderTimeList", orderTimeList);
			}
		} catch(Exception e) {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, e.getMessage());
		}

		return rsMap;
	}

	/**
	 * O2O 지점 한눈에보기 (전문점찾기)
	 * @param
	 * @return
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping("o2oList")
	public Map<String , Object> o2oList(HttpServletRequest request, @RequestBody OrderVo orderVo) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();

		try {
			List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();

			SvcBhfVo vo = new SvcBhfVo();


			vo.setO2oYn(orderVo.getO2oYn()); 			//o2o구분

			Map<String, Object> gujumList = svcBhfSvc.selectList(vo);
			List<SvcBhfVo> nearList = new ArrayList<SvcBhfVo>();
			nearList = (List<SvcBhfVo>) gujumList.get("nearList");



					for(SvcBhfVo mVo : nearList) {
						Map<String,  Object> rtnMap = new HashMap<String, Object>();
						String bpCd = mVo.getBpCd().substring(4,10).toString();
						RentalOrderVo sVo = rentalOrderSvc.searchRentStoreIcon(bpCd);

						if(sVo != null) {
							rtnMap.put("seasonGbn", sVo.getSeasonGbn());
							rtnMap.put("chYn", sVo.getChYn());
							rtnMap.put("cWYn", sVo.getCwYn());
							rtnMap.put("fmYn", sVo.getFmYn());
							rtnMap.put("lmYn", sVo.getLmYn());
						}

						rtnMap.put("salesGroup", mVo.getSaleGrpCd());
						rtnMap.put("salesOffice", mVo.getSaleOffice());
						rtnMap.put("bhfNm", mVo.getBhfNm());	//대리점 명
						rtnMap.put("lon", mVo.getLongitude());	//위도
						rtnMap.put("lat", mVo.getLatitude());	//경도
						rtnMap.put("addr", mVo.getAddr());		//주소
						rtnMap.put("bhfCd", mVo.getBhfCd());		//조직코드
						rtnMap.put("agencyCd", mVo.getAgencyCd());		//거점코드
						rtnMap.put("wrhCd", mVo.getWrhCd());		//창고코드
						rtnMap.put("postNo", mVo.getPostNo());		//우편번호
						rtnMap.put("detailList", mVo.getDetailList());		//
						rtnList.add(rtnMap);
					}

				//성공일 때 리턴 형식
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

				List<Map<String, Object>> rtnList1 = new ArrayList<Map<String, Object>>();
				rtnList1 = (List<Map<String, Object>>) page(rtnList , 5, Integer.parseInt(orderVo.getPageNo()) );

				rsMap.put("list", rtnList1);

				PageVo pageVo = new PageVo();
				pageVo.setTotalCount(rtnList.size());
				pageVo.setPageNo(Integer.parseInt(orderVo.getPageNo()));
				pageVo.setPageSize(5);
				rsMap.put("pageCommon", pageVo);


		} catch(Exception e) {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, e.getMessage());
		}

		return rsMap;
	}


	/**
	 * 내 위치 근처 렌탈전문점 리스트_Ajax (지도)
	 * @param
	 * @return
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping("rentalList")
	public Map<String , Object> rentalList(HttpServletRequest request, HttpServletResponse response, @RequestBody RentalOrderVo orderVo ) throws Exception {
		if(StringUtil.isEmpty(orderVo.getOilServiceYn())){
			orderVo.setOilServiceYn(StringUtil.nvl(request.getParameter("oilServiceYn"), "N"));
		}

		//내 위치 근처 렌탈전문점 리스트
		List<RentalOrderVo> list = rentalOrderSvc.rentalList(orderVo);

		int size = list.size();

		List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();
		rtnList = (List<Map<String, Object>>) page(list , 5, Integer.parseInt(orderVo.getPageNo()) );

		PageVo pageVo = new PageVo();
		pageVo.setTotalCount(size);
		pageVo.setPageNo(Integer.parseInt(orderVo.getPageNo()));
		pageVo.setPageSize(10);

		Map<String , Object> rsMap = new HashMap<String, Object>();
		rsMap.put("pageCommon", pageVo);
		rsMap.put("rtnList", rtnList);

		return rsMap;
	}

	/**
	 * 결제 KCP - 화면 오픈
	 * @param model
	 * @return
	 */
	@RequestMapping("/openKcpPayment")
	public String openKcpPayment(Model model, OrderVo orderVo) {
		System.out.println("/order/openKcpPayment!!!!!!");
		FoPaymentVo foPaymentVo = foPaymentSvc.selectPayConfig("10");
		model.addAttribute("prdcYn", foPaymentVo.getPrdcYn());
		model.addAttribute("siteName", foPaymentVo.getSiteName());
		model.addAttribute("payTitle", foPaymentVo.getPayTitle());
		model.addAttribute("order", orderVo);
		model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);

		return "/order/kcp/callPaymentView";
	}

	/**
	 * 결제 KCP - 결제 처리
	 * @param model
	 * @return
	 */
	@RequestMapping("/getKcpPaymentResult")
	public String getKcpPaymentResult(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("/order/getKcpPaymentResult!!!!!!");
		Map<String, Object> rsMap = new HashMap<String, Object>();
		String returnUrl = "/order/orderComplete";
		OrderVo alTalSearchVo = new OrderVo();//알림톡에 사용될 searchVo

		try{
			PgPaymentVo pgPaymentVo = pgPaymentSvc.makePgPaymentVoUsingHttpReq(request);
			OrderVo orderVo = pgPaymentSvc.makeOrderVoUsingMobParam3(pgPaymentVo.getParamOpt3());

			pgPaymentVo.setParamOpt3("");	//데이터삽입시 사이즈문제로 orderVo만 생성하고 초기화한다.
			orderVo.setOrdNo(pgPaymentVo.getOrdrIdxx());	//pgPaymentVo.getResCd가 3001일때 사용자취소이므로 해당페이지로 다이렉트
			alTalSearchVo.setOrdNo(pgPaymentVo.getOrdrIdxx());//알림톡에 사용될 오더번호를 담는다.
			TmpOrderVo tmpOrderVo = new TmpOrderVo();


			if("3001".equals(pgPaymentVo.getResCd())) {
				PrdRsVo pVo = new PrdRsVo();
				copyVoToVo(pVo, orderVo);

				pVo.setOrderO2oOriAmt(orderVo.getOrderOriAmt());
				pVo.setOrderO2oPayAmt(orderVo.getOrderPayAmt());

				redirectAttributes.addFlashAttribute("orderVo", orderVo);
				redirectAttributes.addFlashAttribute("prdRsVo", pVo);


				return "redirect:/order/orderPurchase";
				//return "redirect:/product/prdList?viewGbn=H";

			}

			List<OrderVo> ordList = new ArrayList<OrderVo>();
			List<OrderVo> ordList1 = new ArrayList<OrderVo>();

			//상품상세에서 주문
			if("D".equals(orderVo.getPageGbn())) {
				ordList.add(orderVo);
			}
			//장바구니 데이터 세팅
			else {
				//장바구니 조회(쿠폰 적용 금액)
				ordList1 = orderSvc.selectBasket(orderVo);
			}

			foPaymentSvc.saveKcpOrder(tmpOrderVo,pgPaymentVo, orderVo);

			List<OrderVo> selectBasketCouponAmt = orderSvc.selectBasketCouponAmt(orderVo);
			if(ordList1.size() > 0 && selectBasketCouponAmt.size() > 0) {
				for(OrderVo oVo : ordList1) {
					for(OrderVo oVo1 : selectBasketCouponAmt) {
						if(oVo1.getItemCd().toString().equals(oVo.getItemCd().toString())) {
							oVo.setOrdAmt(oVo1.getOrdAmt());
							oVo.setSetlAmt(oVo1.getSetlAmt());
						}
					}
					ordList.add(oVo);
				}
			}

			model.addAttribute("orderVo", orderVo);
			model.addAttribute("ordList", ordList);
			model.addAttribute("ordListCnt", ordList.size());
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy.MM.dd");
			String ordDt = format.format(new Date());
			model.addAttribute("ordDt", ordDt);
			model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		}
		catch(Exception e){
			System.err.println(e);
			model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, e.getMessage());

			returnUrl = "/error/error";
		}

		try {
			OrderVo alTalkOrdVo = orderSvc.selectAlTalkOrdInfo(alTalSearchVo);
			OrderVo alTalkOrgzVo = orderSvc.selectAlTalkOrgzNmOrdInfo(alTalSearchVo);
			ReRentalVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

			if(alTalkOrdVo != null) {
				//주문완료 알림톡 보내기
				List<AlTalkSendVo> list = new ArrayList<AlTalkSendVo>();
				HashMap<String, String> cols = new HashMap<String, String>();
				cols.put("$1$", alTalkOrdVo.getCustNm());				//고객명
				cols.put("$2$", alTalkOrdVo.getPatternCd());			//제품명
				if("1".equals(alTalkOrdVo.getItemCnt())) {
					cols.put("$3$", alTalkOrdVo.getTireSize());			//사이즈
					cols.put("$4$", alTalkOrdVo.getOrdQty()+"개");		//수량
				} else {
					cols.put("$3$", alTalkOrdVo.getTireSize()+" 외");	//사이즈
					cols.put("$4$", "총 "+alTalkOrdVo.getOrdQty()+"개");	//수량
				}
				cols.put("$5$", alTalkOrdVo.getOrdNo());				//주문번호
				cols.put("$6$", alTalkOrdVo.getRcivAmt()+"원");			//결제금액
				cols.put("$7$", alTalkOrdVo.getRcivTp());				//결제수단
				cols.put("$8$", alTalkOrdVo.getDueDe());				//예약일자
				cols.put("$9$", alTalkOrdVo.getDueTime());				//희망시간
				cols.put("$10$", alTalkOrdVo.getDlvTyCdNm());			//장착유형

				logger.debug("alTalkOrgzVo.getOrgzNm() >>>>> " + alTalkOrgzVo.getOrgzNm());
				logger.debug("alTalkOrdVo.getDlvTyCd() >>>>> " + alTalkOrdVo.getDlvTyCd());
				
				if(SdConstants.SD146.SD146_1030.equals(alTalkOrdVo.getDlvTyCd()))
					cols.put("$11$", alTalkOrgzVo.getOrgzNm());			//장착점

				AlTalkSendVo al = new AlTalkSendVo();
				if(!StringUtils.isEmpty(userVo.getOrdrHp1())) {
					al.setRcverNo(userVo.getOrdrHp1()+userVo.getOrdrHp2()+userVo.getOrdrHp3());
				} else {
					logger.debug("---------kcpPay alert talk error-------- : userVo ordrHp empty");
				}
				al.setCustNo(alTalkOrdVo.getCustNo());
				al.setCols(cols);
				list.add(al);

				if(SdConstants.SD146.SD146_1030.equals(alTalkOrdVo.getDlvTyCd())){
					String temp = "NXO2O000000000000042"; // 전문점장착
					logger.debug("--------- KCP 전문점장착  --------");
					alTalkSendSvc.startSendAlTalk(temp, list);
				}else {
					String temp = "NXO2O000000000000002"; // 방문장착
					logger.debug("--------- KCP 방문장착  --------");
					alTalkSendSvc.startSendAlTalk(temp, list);
				}
			}
		} catch(Exception e) {
			logger.debug("---------kcpPay alert talk error-------- " + alTalSearchVo.getOrdNo());
		}

		return returnUrl;
	}

	/**
	 * 결제 완료 성공 화면
	 * @param request
	 * @param model
	 * @param orderVo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/orderComplete")
	public String orderComplete(HttpServletRequest request, Model model, OrderVo orderVo) throws Exception {

		List<OrderVo> ordList = new ArrayList<OrderVo>();
		ordList.add(orderVo);
		model.addAttribute("ordrIdxx", orderVo.getOrdNo());
		model.addAttribute("ordList", ordList);
		model.addAttribute("ordListCnt", ordList.size());
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy.MM.dd");
		String ordDt = format.format(new Date());
		model.addAttribute("ordDt", ordDt);

		return "/order/orderComplete";
	}

	/**
	 * 결제 카카오 - 화면 오픈
	 * @param model
	 * @return
	 */
	@RequestMapping("/openKakaoPayment")
	@ResponseBody
	public String openKakaoPayment(OrderVo orderVo, KkoPaymentVo kkoPaymentVo) {
		System.out.println("/order/openKkoPayment!!!!!!");
		String popupUrl = "";
		try{
			Map<String , Object> custMap = orderSvc.selectCustNo(orderVo);
			orderVo.setCustNo(custMap.get("custNo").toString());
			kkoPaymentVo.setCustNo(custMap.get("custNo").toString());
			popupUrl = kakaoPaymentSvc.getKakaoPayPopupUrl(kkoPaymentVo);
		}
		catch(Exception e){
			return "/error/error";
		}
		return popupUrl;
	}


	/**
	 * 결제 카카오 - 결제 처리
	 * @param model
	 * @return
	 */
	@RequestMapping("/getKkoPaymentResult")
	public String getKkoPaymentResult(Model model, @RequestParam("pg_token")String pgToken, @RequestParam("ordrIdxx")String ordrIdxx) {
		System.out.println("/order/getKkoPaymentResult!!!!!!");
		logger.debug(pgToken);

		model.addAttribute("pgToken", pgToken);
		model.addAttribute("ordrIdxx", ordrIdxx);

		return "/order/kakaoResult";
	}

	/**
	 * 결제 카카오 - 결제 처리
	 * @param model
	 * @return
	 */
	@RequestMapping("/kakaoComplate")
	public String  kakaoComplate(Model model, OrderVo orderVo, KkoPaymentVo kkoPaymentVo) {
		System.out.println("/order/kakaoComplate !!!!!!");

		String returnUrl = "";

		try{
			TmpOrderVo tmpOrderVo = new TmpOrderVo();
			orderVo.setOrdNo(kkoPaymentVo.getOrdrIdxx());

			List<OrderVo> ordList = new ArrayList<OrderVo>();
			List<OrderVo> ordList1 = new ArrayList<OrderVo>();

			//상품상세에서 주문
			if("D".equals(orderVo.getPageGbn())) {
				ordList.add(orderVo);
			}
			//장바구니 데이터 세팅
			else {
				//장바구니 조회(쿠폰 적용 금액)
				ordList1 = orderSvc.selectBasket(orderVo);
			}

			//저장
			foPaymentSvc.saveKkoOrder(tmpOrderVo, kkoPaymentVo, orderVo);

			List<OrderVo> selectBasketCouponAmt = orderSvc.selectBasketCouponAmt(orderVo);
			if(ordList1.size() > 0 && selectBasketCouponAmt.size() > 0) {
				for(OrderVo oVo : ordList1) {
					for(OrderVo oVo1 : selectBasketCouponAmt) {
						if(oVo1.getItemCd().toString().equals(oVo.getItemCd().toString())) {
							oVo.setOrdAmt(oVo1.getOrdAmt());
							oVo.setSetlAmt(oVo1.getSetlAmt());
						}
					}
					ordList.add(oVo);
				}
			}

			logger.debug("============");
			logger.debug(ordList.get(0).getThumimg());
			logger.debug(orderVo.getThumimg());
			logger.debug(orderVo.getO2oThumImg());
			logger.debug("============");
			model.addAttribute("orderVo", orderVo);
			model.addAttribute("ordList", ordList);
			model.addAttribute("ordListCnt", ordList.size());
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy.MM.dd");
			String ordDt = format.format(new Date());
			model.addAttribute("ordDt", ordDt);
			model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

			returnUrl = "/order/orderComplete";
		}
		catch(Exception e){
			System.err.println(e.getMessage());
			model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, e.getMessage());

			returnUrl = "/error/error";
		}

		try {
			OrderVo alTalkOrdVo = orderSvc.selectAlTalkOrdInfo(orderVo);
			OrderVo alTalkOrgzVo = orderSvc.selectAlTalkOrgzNmOrdInfo(orderVo);
			ReRentalVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

			if(alTalkOrdVo != null) {
				//주문완료 알림톡 보내기
				List<AlTalkSendVo> list = new ArrayList<AlTalkSendVo>();
				HashMap<String, String> cols = new HashMap<String, String>();
				cols.put("$1$", alTalkOrdVo.getCustNm());				//고객명
				cols.put("$2$", alTalkOrdVo.getPatternCd());			//제품명
				if("1".equals(alTalkOrdVo.getItemCnt())) {
					cols.put("$3$", alTalkOrdVo.getTireSize());			//사이즈
					cols.put("$4$", alTalkOrdVo.getOrdQty()+"개");		//수량
				} else {
					cols.put("$3$", alTalkOrdVo.getTireSize()+" 외");	//사이즈
					cols.put("$4$", "총 "+alTalkOrdVo.getOrdQty()+"개");	//수량
				}
				cols.put("$5$", alTalkOrdVo.getOrdNo());				//주문번호
				cols.put("$6$", alTalkOrdVo.getRcivAmt()+"원");			//결제금액
				cols.put("$7$", alTalkOrdVo.getRcivTp());				//결제수단
				cols.put("$8$", alTalkOrdVo.getDueDe());				//예약일자
				cols.put("$9$", alTalkOrdVo.getDueTime());				//희망시간
				cols.put("$10$", alTalkOrdVo.getDlvTyCdNm());			//장착유형

				logger.debug("alTalkOrgzVo.getOrgzNm() >>>>> " + alTalkOrgzVo.getOrgzNm());
				logger.debug("alTalkOrdVo.getDlvTyCd() >>>>> " + alTalkOrdVo.getDlvTyCd());
				
				if(SdConstants.SD146.SD146_1030.equals(alTalkOrdVo.getDlvTyCd()))
					cols.put("$11$", alTalkOrgzVo.getOrgzNm());			//장착점

				AlTalkSendVo al = new AlTalkSendVo();

				if(!StringUtils.isEmpty(userVo.getOrdrHp1())) {
					al.setRcverNo(userVo.getOrdrHp1()+userVo.getOrdrHp2()+userVo.getOrdrHp3());
				} else {
					logger.debug("---------kakaoPay alert talk error-------- : userVo ordrHp empty");
				}

				al.setCustNo(alTalkOrdVo.getCustNo());
				al.setCols(cols);
				list.add(al);

				if(SdConstants.SD146.SD146_1030.equals(alTalkOrdVo.getDlvTyCd())){
					String temp = "NXO2O000000000000042"; // 전문점장착
					logger.debug("--------- 카카오 결제 전문점장착  --------");
					alTalkSendSvc.startSendAlTalk(temp, list);
				}else {
					String temp = "NXO2O000000000000002"; // 방문장착
					logger.debug("--------- 카카오 결제 방문장착  --------");
					alTalkSendSvc.startSendAlTalk(temp, list);
				}
			}
		} catch(Exception e) {
			logger.debug("---------kakaoPay alert talk error-------- " + orderVo.getCustNo());
		}

		return returnUrl;
	}


	/**
	 * KCP 주문취소
	 * @param pgPaymentVo
	 * @return
	 */
	@RequestMapping("/processOrdCncl")
	public @ResponseBody HashMap<String, String> processOrdCncl(@RequestBody PgPaymentVo pgPaymentVo) {
		HashMap<String, String> map = new HashMap<String, String>();
		try{
			TmpOrderVo tmpOrderVo = new TmpOrderVo();
			foPaymentSvc.cancelKcpOrder(tmpOrderVo,pgPaymentVo);

		}
		catch(Exception e){
			map.put("result","error");
			map.put("Message", e.getMessage());
			return map;
		}
		map.put("result","done");

		try {
			OrderVo alTalkOrdSearchVo = new OrderVo();
			alTalkOrdSearchVo.setOrdNo(pgPaymentVo.getOrdrIdxx());

			OrderVo alTalkOrdVo = orderSvc.selectAlTalkOrdInfo(alTalkOrdSearchVo);
			ReRentalVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

			if(alTalkOrdVo != null) {
				//주문완료 알림톡 보내기
				List<AlTalkSendVo> list = new ArrayList<AlTalkSendVo>();
				HashMap<String, String> cols = new HashMap<String, String>();

				SimpleDateFormat todayStr = new SimpleDateFormat("yyyy.MM.dd");
				Date today = new Date();

				cols.put("$1$", todayStr.format(today));		//처리완료일
				cols.put("$2$", alTalkOrdVo.getOrdNo());		//주문번호
				cols.put("$3$", alTalkOrdVo.getPatternCd());		//제품명
				if("1".equals(alTalkOrdVo.getItemCnt())) {
					cols.put("$4$", alTalkOrdVo.getTireSize());	//사이즈
					cols.put("$5$", alTalkOrdVo.getOrdQty()+"개");	//수량
				} else {
					cols.put("$4$", alTalkOrdVo.getTireSize()+" 외");	//사이즈
					cols.put("$5$", "총 "+alTalkOrdVo.getOrdQty()+"개");	//수량
				}
				cols.put("$6$", alTalkOrdVo.getRcivAmt()+"원");		//결제금액
				cols.put("$7$", alTalkOrdVo.getRcivTp());	//결제수단
				String temp = "NXO2O000000000000013";

				AlTalkSendVo al = new AlTalkSendVo();
				if(!StringUtils.isEmpty(userVo.getOrdrHp1())) {
					al.setRcverNo(userVo.getOrdrHp1()+userVo.getOrdrHp2()+userVo.getOrdrHp3());
				} else {
					logger.debug("---------order cancel alert talk error-------- : userVo ordrHp empty");
				}
				al.setCustNo(alTalkOrdVo.getCustNo());
				al.setCols(cols);
				list.add(al);

				alTalkSendSvc.startSendAlTalk(temp, list);
			}
		} catch(Exception e) {
			logger.debug("---------order cancel alert talk error-------- " + pgPaymentVo.getOrdrIdxx());
		}
		return map;
	}

	/**
	 * KAKAO 주문취소
	 * @param pgPaymentVo
	 * @return
	 */
	@RequestMapping("/processOrdKkoCncl")
	public @ResponseBody HashMap<String, String> processOrdKkoCncl(@RequestBody KkoPaymentVo kkoPaymentVo) {
		HashMap<String, String> map = new HashMap<String, String>();
		try{
			TmpOrderVo tmpOrderVo = new TmpOrderVo();
			foPaymentSvc.cancelKkoOrder(tmpOrderVo,kkoPaymentVo);
		}
		catch(Exception e){
			map.put("result","error");
			map.put("Message", e.getMessage());
			return map;
		}

		try {
			OrderVo alTalkOrdSearchVo = new OrderVo();
			alTalkOrdSearchVo.setOrdNo(kkoPaymentVo.getOrdrIdxx());

			OrderVo alTalkOrdVo = orderSvc.selectAlTalkOrdInfo(alTalkOrdSearchVo);
			ReRentalVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

			if(alTalkOrdVo != null) {
				//주문완료 알림톡 보내기
				List<AlTalkSendVo> list = new ArrayList<AlTalkSendVo>();
				HashMap<String, String> cols = new HashMap<String, String>();

				SimpleDateFormat todayStr = new SimpleDateFormat("yyyy.MM.dd");
				Date today = new Date();

				cols.put("$1$", todayStr.format(today));		//처리완료일
				cols.put("$2$", alTalkOrdVo.getOrdNo());		//주문번호
				cols.put("$3$", alTalkOrdVo.getPatternCd());		//제품명
				if("1".equals(alTalkOrdVo.getItemCnt())) {
					cols.put("$4$", alTalkOrdVo.getTireSize());	//사이즈
					cols.put("$5$", alTalkOrdVo.getOrdQty()+"개");	//수량
				} else {
					cols.put("$4$", alTalkOrdVo.getTireSize()+" 외");	//사이즈
					cols.put("$5$", "총 "+alTalkOrdVo.getOrdQty()+"개");	//수량
				}
				cols.put("$6$", alTalkOrdVo.getRcivAmt()+"원");		//결제금액
				cols.put("$7$", alTalkOrdVo.getRcivTp());	//결제수단
				String temp = "NXO2O000000000000013";

				AlTalkSendVo al = new AlTalkSendVo();
				if(!StringUtils.isEmpty(userVo.getOrdrHp1())) {
					al.setRcverNo(userVo.getOrdrHp1()+userVo.getOrdrHp2()+userVo.getOrdrHp3());
				} else {
					logger.debug("---------order cancel alert talk error-------- : userVo ordrHp empty");
				}
				al.setCustNo(alTalkOrdVo.getCustNo());
				al.setCols(cols);
				list.add(al);

				alTalkSendSvc.startSendAlTalk(temp, list);
			}
		} catch(Exception e) {
			logger.debug("---------order cancel alert talk error-------- " + kkoPaymentVo.getOrdrIdxx());
		}

		map.put("result","done");
		return map;
	}


	/**
	 * 카카오 결제 취소 실패
	 * @return
	 */
	@RequestMapping("/getKkoPaymentFail")
	public String getKkoPaymentFail(Model model){
		model.addAttribute("rtnCode", "-1");
		model.addAttribute("rtnCode", "결재가 실패 하였습니다.");
		return "/error/error";
	}

	/**
	 * 카카오 결제 취소
	 * @return
	 */
	@RequestMapping("/getKkoPaymentCncl")
	public String getKkoPaymentCncl(Model model){
		model.addAttribute("rtnCode", "-100");
		return "/error/error";
	}

	/**
	 * 카카오 결제전 인증
	 * @return
	 */
	@RequestMapping("/ordAuthMob")
	@ResponseBody
	public String ordAuthMob(HttpServletRequest request, Model model){
		String rslt = pgPaymentSvc.getKcpAuthMob(request);
	    logger.debug(rslt);
	    return rslt;
	}

	/**
	 *
	 * 개인 고객 신용정보 조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/certifyPerson" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> certifyPerson(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		RentalOrderVo ovo = new RentalOrderVo();

		//회원 세션정보 조회로 safekey 확인
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		ovo.setCustId(clientVo.getCustId());
		ovo.setSafeKey(clientVo.getSafeKey());

		//영업 고객 존재 여부 확인 및 신규생성
		String custId = rentalInfSvc.srhCustId(ovo);

		//신용조회처리시작
		Map rtnMap = rentalOrderSvc.niceTrustInfoCnt(request);

		if(rtnMap==null){
			rtnMap = rentalOrderSvc.niceTrustInfo(ovo, request);
		}
		//신용조회처리끝
		logger.debug("::::::::::::::::::::::::::"+rtnMap);
		map.put("rtnMap", rtnMap);
		return map;
	}

	/**
	 * KCP 주문 연동화면
	 * 1/3-2 법인회원 - 법인신용조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/certifyCompany")
	@ResponseBody
	public Map<String, Object> certifyCompany(HttpServletRequest request, Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		Map rtnMap     = null;
		rtnMap = rentalOrderSvc.existsBisinessSearch(request);

		if( rtnMap.size() ==0 ){
			rtnMap = rentalOrderSvc.niceBisinessSearch(request);
		}

		map.put("rtnMap", rtnMap);
		return map;
	}

	/**
	 * 시 군구 조회
	 * @param request
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSiGunGu")
	@ResponseBody
	public List<RentalOrderVo> selectSiGunGu(HttpServletRequest request, Model model
												,@RequestParam("param") String param  ) throws Exception {
		List<RentalOrderVo> rtnList = rentalOrderSvc.selectSiGunGu(param);
		return rtnList;
	}

	/**
	 * 등록금 미결제 주문 취소
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cancelProcNopay" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> cancelProcNopay(HttpServletRequest request, @RequestBody MypageVo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String msg     = "취소처리가 완료되었습니다.";
		int success   = -1;
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		success = rentalInfSvc.saveOrdrCancelInfoNopay(clientVo,vo);

 		if(success!=0){
			msg     = "취소처리중 오류가 발생했습니다.";
		}

		map.put("message", msg);
		map.put("success", success);
		return map;
	}


	/**
	 * 등록금 미결제 주문 취소
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/orderPreCancel")
	public void  orderPreCancel(Model model, MypageVo vo, HttpServletRequest request, HttpServletResponse res) throws Exception {

			ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
			String usePayMethod = null;
			int success   = -1;

			try{
				RentalOrderVo rvo = rentalOrderSvc.orderCancelInfo(vo);
			if(rvo != null){
				usePayMethod = rvo.getUsePayMethod(); //결제방법
			}else{
				rvo = new RentalOrderVo();
				rvo.setOrdrIdxx(vo.getOrdrIdxx());
			}

			rvo.setAgencyCd(vo.getAgencyCd());
			//계좌번호인 경우 에스크로상태변경후 취소
			//그외는 바로 취소
			if("010000000000".equals(usePayMethod)){
				success = rentalCashSvc.cancelEscwStat(rvo, request, clientVo);
			}else{
				success = rentalCashSvc.cancel(rvo, request, clientVo);
			}

			logger.debug("[" + clientVo.getCustId() + "][" + vo.getOrdrIdxx() + "][success]=====>"+success);

			 if(success!=0){
				StringBuilder returnPath = new StringBuilder();
				returnPath.append("/mypage/orderList");
				JsPrinter.replace(res, returnPath.toString(), "취소처리중 오류가 발생했습니다.");
			 }else{
					StringBuilder returnPath = new StringBuilder();
					returnPath.append("/mypage/orderList");
					JsPrinter.replace(res, returnPath.toString(), "취소처리가 완료되었습니다.");
			 }

			} catch ( Exception e ) {
				e.printStackTrace();
			}
	}


	/**
	 * 주문배송에서 결제 취소 처리 후 취소정보 저장
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cancelProc")
	public void  cancelProc(Model model, RentalOrderVo vo, HttpServletResponse res) throws Exception {

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		int success   = -1;
		String rtnUrl       = "";

		String sUserId = clientVo.getCustId();

		logger.info("[" + sUserId + "][" + vo.getOrdrIdxx() + "] 주문 취소");

		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", sUserId);

		logger.info("[" + sUserId + "][" + vo.getOrdrIdxx() + "][PG취소처리결과]=====>"+vo.getResCd());

		//온라인 및 영업시스템 데이터 저장처리
		if("0000".equals( vo.getResCd() )){
			try {
				success = rentalInfSvc.saveOrdrCancelInfo(clientVo,vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		logger.info("[" + sUserId + "][" + vo.getOrdrIdxx() + "][success]=====>"+success);

		 if(success!=0){
			StringBuilder returnPath = new StringBuilder();
			returnPath.append("/mypage/orderList");
			JsPrinter.replace(res, returnPath.toString(), "취소처리중 오류가 발생했습니다.");
		 }else{
				StringBuilder returnPath = new StringBuilder();
				returnPath.append("/mypage/orderList");
				JsPrinter.replace(res, returnPath.toString(), "취소처리가 완료되었습니다.");
		 }
	}


	/**
	 * 계좌출금동의
	 * @param req
	 * @param response
	 * @param orderVO
	 * @throws Exception
	 */
	@RequestMapping("/arsCallSvr")
	@ResponseBody
	public Map<String ,Object> arsCallService( HttpServletRequest req, HttpServletResponse response, RentalOrderVo orderVO)  throws Exception {
		int success = -1;
		String msg = "출금이체에 동의하였습니다.";
        Connection conn = null;
		CallableStatement cs = null;

		// 개발기인지 운영기인지 판단 [20171102_01]
		String srvUrl = req.getRequestURL().toString();
		srvUrl = srvUrl.toLowerCase();

	    String devMode = "PROD";

	    if (srvUrl.indexOf("1.254.67.135")!=-1 || srvUrl.indexOf("172.17.0.135")!=-1 || srvUrl.indexOf("dev-")!=-1) {		// 개발
	    	devMode    = "DEV";
	    } else if (srvUrl.indexOf("localhost")!=-1) {	// 로컬
	    	devMode    = "LOCAL";
		}

		//회원 세션정보 조회로 safekey 확인
	    ReRentalVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if (userVo == null || "".equals(userVo)) {
			msg = "회원정보가 없습니다.";
		}

		String mobNo       = (String) req.getParameter("PHONE");
		String ownerNm     = (String) req.getParameter("CUST_NM");
		String bankCd      = (String) req.getParameter("BANK_CD");
		String bankNm      = (String) req.getParameter("BANK_NM");
		String acctCd      = (String) req.getParameter("ACCT_NO");
		String bizNo       = (String) req.getParameter("BUSL_NO");
		String birthDay    = (String) req.getParameter("BIRTH_DAY");
		String userType    = (String) req.getParameter("CUST_TP");
		String trCd        = "2300";
		String rsltCd      = "";
		String rsltMsg     = "";
		String respTrCd    = "";
		String txtNo       = "";
		String recordData  = "";
		String authNo      = "00";
		String authInquery = "";

        URL url = null;
        URLConnection urlConnection = null;

        // 서버 접속정보 운영모드에 따라 분기 [20171102_01]
        //String sUrl = "http://dev.coocon.co.kr/sol/gateway/ars_wapi.jsp"; // dev
        //String sUrl = "https://gw.coocon.co.kr/sol/gateway/ars_wapi.jsp"; //real
        String sUrl   = AppContext.getString(WebConstants.ARS_RENTAL_URL);	// KIBNet 서버 접속정보
        String dbConn = "";				// DB접속정보
        String dbUser = "NXRADMIN";		// DB접속ID
        String dbPw   = "";				// DB접속 비밀번호

        if ("PROD".equals(devMode)) {	//운영기
        	dbConn = "jdbc:oracle:thin:@172.17.0.138:1521:NXNEWBIZ";
        	dbPw   = "admin_9_rental";
        } else {						//개발기
        	dbConn = "jdbc:oracle:thin:@172.17.0.135:1521:NXNEWBIZDEV";
        	dbPw   = "rental~2015^*";
        }

        Map<String ,Object> rtnMap = new HashMap<String, Object>();

		try {
			JSONObject personInfo = new JSONObject(); //person의 한명 정보가 들어갈 JSONObject 선언

			Calendar calendar = Calendar.getInstance();
            java.util.Date date = calendar.getTime();
            String callDt = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));

	        personInfo.put("TR_CD", trCd); //정보 입력
	        personInfo.put("SECR_KEY", AppContext.getString(WebConstants.ARS_RENTAL_SECRET));
	        personInfo.put("ORG_CD", "20018");
	        personInfo.put("DATE", callDt);
	        personInfo.put("PHONE", mobNo);
	        long tmpNo = (long) Math.floor(Math.random() * 100);
	        authNo = String.format("%02d", tmpNo);
	        personInfo.put("AUTH_NO", authNo);
	        if(userType.equals("01")){
	        	authInquery = "안녕하세요 넥센타이어입니다. " + birthDay.substring(0,4) + "년 " + Integer.parseInt(birthDay.substring(4,6)) + "월 "
	        				+ Integer.parseInt(birthDay.substring(6,8)) + "일생 " + ownerNm + " 고객님의 " + bankNm
    		                + "<digit>" + acctCd + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
    		}else{
    			authInquery = "안녕하세요 넥센타이어입니다. 사업자번호 <digit>" + bizNo + "</digit> " + ownerNm + " 고객님의 " + bankNm
    			            + "<digit>" + acctCd + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
    		}
	        //authInquery ="안녕하세요"; // test
	        personInfo.put("AUTH_INQUERY", authInquery);
	        personInfo.put("REC_INQUERY", "");
	        personInfo.put("FILE_SAVE_YN", "");
	        personInfo.put("FILE_NM", "");

	        String jsonInfo = personInfo.toString(); //JSONObject를 String 객체에 할당

            url = new URL(sUrl);
            urlConnection = url.openConnection();
            urlConnection.setDoOutput(true);

            printByOutputStream(urlConnection.getOutputStream(), "JSONData=" + encodeURIComponent(encodeURIComponent(jsonInfo)));
            String outJsonInfo = printByInputStream(urlConnection.getInputStream());
            //JSONParser jsonParser = new JSONParser(); //JSON데이터를 넣어 JSON Object 로 만들어 준다.
            //JSONObject outJsonObject = (JSONObject) jsonParser.parse(outJsonInfo);

            JSONObject outJsonObject = new JSONObject(outJsonInfo.toString());
            JSONArray infoArray = (JSONArray) outJsonObject.get("RESP_DATA"); //배열을 추출

            if(infoArray != null && !infoArray.equals(null)){
            	for(int i=0; i<infoArray.length(); i++){
	                JSONObject jObject = (JSONObject) infoArray.get(i); //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출

	                respTrCd = (String)jObject.get("TR_CD"); //JSON name으로 추출
	                txtNo = (String)jObject.get("TXT_NO");
	                if(!StringUtil.isEmpty(respTrCd) && StringUtil.isEmpty(txtNo)) {
	                	recordData = (String)jObject.get("RECORD_DATA");
	                }
	            }
            }

            rsltMsg = (String)outJsonObject.get("RSLT_MSG");
            rsltCd = (String)outJsonObject.get("RSLT_CD");

    		ByteArrayOutputStream baos = new ByteArrayOutputStream();
    		if(rsltCd.equals("0000")){
    			FileOutputStream fos = new FileOutputStream("\\\\100.100.100.200\\was\\NTRMS\\ARS\\"+txtNo+".mp3");

    		    for(int i=0; i < recordData.length(); i+= 2){
    		    	int b = Integer.parseInt(recordData.substring(i, i+2), 16);
    		    	baos.write(b);
    		    	//fos.write(b);
    			}
    		    baos.writeTo(fos);
    		    fos.close();
    		}

    		ByteArrayInputStream bis = new ByteArrayInputStream(baos.toByteArray());

	        Class.forName("oracle.jdbc.driver.OracleDriver");

	        /* 추후에 Dao 로 변경 필요 */
	        conn = DriverManager.getConnection(dbConn, dbUser, dbPw);

			cs = conn.prepareCall("{call NXRADMIN.Pkg_Rtre0013.p_IUDRtre0013( 'I', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");

	        cs.setString(1, mobNo);
	        cs.setString(2, ownerNm);
	        cs.setString(3, userType);

    		if (userType.equals("01")) {
    	        cs.setString(4, birthDay);
    	        cs.setString(5, "");
    		} else {
    	        cs.setString(4, "");
    	        cs.setString(5, bizNo);
    		}

	        cs.setString(6, bankCd);
	        cs.setString(7, acctCd);
	        cs.setString(8, trCd);
	        cs.setString(9, callDt);
	        cs.setString(10, rsltCd);
	        cs.setString(11, rsltMsg);
	        cs.setString(12, respTrCd);
	        cs.setString(13, txtNo);
	        cs.setBinaryStream(14, bis, baos.size()); // recordData
	        cs.setString(15, userVo.getCustId());
			cs.registerOutParameter(16, java.sql.Types.DECIMAL);
			cs.registerOutParameter(17, java.sql.Types.VARCHAR);
			cs.registerOutParameter(18, java.sql.Types.VARCHAR);
			cs.execute();

			String logData = "V_SUCCESS_CODE:" + cs.getInt(16) + "\t" + "V_RETURN_MESSAGE:" + cs.getString(17)+  "\t" + "V_ERRORTEXT:" + cs.getString(18);
			logger.info("=====================================================================출금이체 동의 결과 DB 결과: [" + mobNo + "]================================================================");
			logger.info(logData + "\t" + "rsltMsg: " + rsltMsg);
			logger.info("=====================================================================출금이체 동의 결과 DB 결과: [" + ownerNm + "]================================================================");

			rtnMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
            rtnMap.put(WebConstants.Rtn.RETURN_MESSEGE, msg);

			success =  cs.getInt(16);
     		if(success!=0 || !rsltCd.equals("0000")){
				if(success!=0) {
					msg = "출금이체동의 처리중 오류가 발생했습니다.("+cs.getString(18)+")";
					rtnMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
					rtnMap.put(WebConstants.Rtn.RETURN_MESSEGE, msg);
				} else{
					msg = "출금이체동의 처리중 오류가 발생했습니다.("+rsltMsg+")";
					rtnMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
					rtnMap.put(WebConstants.Rtn.RETURN_MESSEGE, msg);
				}
			}

            baos.close();
            bis.close();
		} catch (SQLException e) {
			logger.debug("SQLException :::"  + e.getMessage());
			rtnMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
            rtnMap.put(WebConstants.Rtn.RETURN_MESSEGE, msg);
		} catch (ClassNotFoundException e) {
			logger.debug("ClassNotFoundException :::"  + e.getMessage());
			rtnMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
            rtnMap.put(WebConstants.Rtn.RETURN_MESSEGE, msg);
		} finally {
			if (cs != null) {
				try {
					cs.close();
					conn.close();
				}
				catch(SQLException e) {
					logger.debug("finally SQLException :::"  + e.getMessage());
					rtnMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
		            rtnMap.put(WebConstants.Rtn.RETURN_MESSEGE, msg);
				}
			}
		}

		return rtnMap;
	}

	/**
	 * 계좌출금동의 > 인코딩
	 * @param s
	 * @return
	 */
	public static String encodeURIComponent(String s){
    	String result = null;

    	try{
    		result = URLEncoder.encode(s, "UTF-8")
    				.replaceAll("\\+", "%20")
    				.replaceAll("\\%21", "!")
    				.replaceAll("\\%27", "'")
    				.replaceAll("\\%28", "(")
    				.replaceAll("\\%29", ")")
    				.replaceAll("\\%7E", "~");
    	}catch (UnsupportedEncodingException e)
    	{
    		result = s;
    	}
    	return result;
    }

	/**
	 * 계좌출금동의 > 웹 서버로 부터 받은 웹 페이지 결과를 콘솔에 출력하는 메소드
	 * @param is
	 * @return
	 */
    public static String printByInputStream(InputStream is){
        byte[] buf = new byte[2048];
        StringBuffer sb = new StringBuffer();
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        byte[] resMessage = null;
        String output = "";

        try {
            while (true) {
                int n = is.read(buf);
                if (n == -1){
                	break;
                }
                bout.write(buf, 0, n);
            }
            bout.flush();
            resMessage = bout.toByteArray();
            output = new String(resMessage, "EUC-KR");

        } catch(IOException e) {
            e.printStackTrace();
        }
		return output;
    }

    /**
     * 계좌출금동의 > 출력
     * @param os
     * @param msg
     */
	public static void printByOutputStream(OutputStream os, String msg) {
        try {
            byte[] msgBuf = msg.getBytes("UTF-8");
            os.write(msgBuf, 0, msgBuf.length);
            os.flush();
        } catch(IOException e) {
            e.printStackTrace();
        }
    }

	/**
	 * 은행 계좌 유효성 인증
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/kftcCmsDocInfo")
	@ResponseBody
	public Map<String , Object> kftcCmsDocInfo(HttpServletRequest req) throws Exception {

		String rtnUrl      = "";
		String userType    = "00";	//사업자:01, 개인:00
		String bankCd	   = "";	//은행코드
		String acctCd	   = "";	//계좌번호
		String bizNo	   = "";	//생년월일, 사업자번호
		String custNo	   = "";	//고객번호
		String custNm	   = "";	//고객명
		String ownerNm     = "";	//예금주
		String returnCode2 = "";

		Map<String, Object> kftHIMap = new HashMap<String, Object>();

		try {
			ReRentalVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
			String sUserId          = userVo.getCustId();
			Map<String, String> map = new HashMap<String, String>();
			map.put("userId", sUserId);

			//영업 고객 존재 여부 확인 및 신규생성
			custNo = rentalOrderSvc.selectSrhCustId(userVo.getCustId());

			Map<String, String> inVar = new HashMap<String, String>();
			inVar.put("regId", "ONL_SYS");
			//개인 법인구분
			userType = (String)req.getParameter("userType");
			//은행코드
			bankCd 	 = (String)req.getParameter("bankCd");
			//계좌번호
			acctCd	 = (String)req.getParameter("acctCd");
			//사업자번호 및 생년월일
			bizNo	 = (String)req.getParameter("bizNo");
			//고객번호
			custNo	 = custNo;
			//고객명
			custNm	 = (String)req.getParameter("custNm");
			//예금주
			ownerNm	 = (String)req.getParameter("ownerNm");


			/****************************************************/
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);
			String dateString = formatter.format(new Date());
			String s_date 	= dateString;
			Map<String, Object> sMap = new HashMap<String, Object>();
			sMap.put("acertDay", s_date);
			sMap.put("bankCd", 	 bankCd);
			sMap.put("acctCd", 	 acctCd);
			sMap.put("userType", userType);
			sMap.put("bizNo", 	 bizNo);

			String existsCmsInterface =   rentalOrderSvc.existsCmsInterface(sMap);

			//결과가 있고 결과가 0000 인경우 별도 인터페이스 없이 진행되도록 처리
			//결과가 없거나 0000 이 아닌경우 Interface를 실행한다.
			//String returnCode2 = "";	//화면에 리턴하기위한 결과코드

			if("0000".equals(existsCmsInterface)) {
				returnCode2 = existsCmsInterface;
			} else {
				/****************************************************/
				//전문통신을위한 ip, port를 선언한다.
				String sUrl = req.getRequestURL().toString();
				sUrl = sUrl.toLowerCase();

				//운영서버에서의 접속정보
				//String ip 	 = "99.51.105.10";
				//String port  = "52146";

				//개발서버에서의 접속정보
				//if(!"prod".equals(WebConstants.SERVER_MODE)){

				String ip = AppContext.getString(WebConstants.KFTC_CMS_IP);
				String port  = AppContext.getString(WebConstants.KFTC_CMS_PORT);

				//}

				//날짜타입선언
				SimpleDateFormat formatter1 = new SimpleDateFormat ("MMddHHmmss", java.util.Locale.KOREA);
				String dateString1 = formatter1.format(new Date());
				String date  = dateString1;
				SimpleDateFormat formatter2 = new SimpleDateFormat ("HHmmss", java.util.Locale.KOREA);
				String dateString2 = formatter2.format(new Date());
				String date2 = dateString2;
				SimpleDateFormat formatter3 = new SimpleDateFormat ("MMdd", java.util.Locale.KOREA);
				String dateString3 = formatter3.format(new Date());
				String date3 = dateString3;
				String serialKey = date.substring(date.length() - 6, date.length());

				//=======================================================================================================
				// 전문내용 시작
				//=======================================================================================================
				String transactionCode 			= "";													//트랜젝션코드
				//String byteSize				= "0200";												//TCP/IP전문 Byte수
				String byteSize					= "";													//TCP/IP전문 Byte수
				String openTxt  				= "ISO";												//TEXT 개시문자
				String docHeader				= "023400052";											//전문헤더
				String docType					= "0200";												//전문TYPE
				String primaryBitmap			= "2238000120601000";									//PRIMARY BITMAP
				String tradeGbCd				= "000020";												//거래구분코드
				String docSendTime				= date;													//전문전송일시
				String docCheckNo				= "000001";												//일련번호(임시 : 현재시분초중 6자리)
				String tradStartTime			= date2;												//거래개시시간
				String tradStartDt				= date3; 												//거래개시일
				//String gigwanCd				= "070020000";											//참가기관코드(07고정 + 은행코드 + 0000)
				String gigwanCd					= "07" + bankCd + "0000";								//참가기관코드(07고정 + 은행코드 + 0000)
				//String checkoutAccount		= "379584712536598                        ";			//지정출금계좌번호(37고정 + 계좌번호 + 공백 : 총39자리)

				//계좌번호를 제외한 모든 자리수를 공백으로 대체한다.
				int size = 37;
				int len = size - acctCd.length();
				for(int i = 0; i<len; i++) {
					acctCd = acctCd + " ";
				}

				String checkoutAccount			= "37" + acctCd;			//지정출금계좌번호(37고정 + 계좌번호 + 공백 : 총39자리)
				String gigwanTypeCd				= "9924216388     ";									//이용기관 식별코드
				String serialNo					= "";

				if("01".equals(userType)) {
					serialNo					= "                         01" + bizNo + "   ";			//납부자번호/생년월일(사업자번호)
				} else {
					serialNo					= "0000000000               00" + bizNo + "       ";			//납부자번호/생년월일(사업자번호)
				}

				String gigwanPwd				= "                ";									//비밀번호
				//String accountRealNm			= "040                                        ";		//계좌실명
				//String returnCode				= "004    ";
				//============================================================================
				// 전문내용 종료
				//============================================================================

				//============================================================================
				// 전문내용저장Map
				//============================================================================

				kftHIMap.put("acertDay"		  	,dateString);
				kftHIMap.put("acertSeq"		  	,"");
				kftHIMap.put("bankCd"		  	,bankCd);
				kftHIMap.put("acctNo"	  		,acctCd.trim());

				if("00".equals(userType)) {
					kftHIMap.put("custTp"		  	,"01");
				} else {
					kftHIMap.put("custTp"		  	,"02");
				}

				if("00".equals(userType)) {
					kftHIMap.put("ebirDay"  		,bizNo);
					kftHIMap.put("buslNo"	  		,null);
				} else {
					kftHIMap.put("ebirDay"  		,null);
					kftHIMap.put("buslNo"	  		,bizNo);
				}

				kftHIMap.put("regId"	  		, "ONL_SYS");
				kftHIMap.put("acertId"	  		, "ONL_SYS");
				kftHIMap.put("custNo"	  		, custNo);
				kftHIMap.put("custNm"  			, custNm);
				kftHIMap.put("acertChk"	  		, "N");
				kftHIMap.put("acertErrcd"		, "");
				kftHIMap.put("acertDesc"		, "");
				kftHIMap.put("ownerNm"	  		, ownerNm);
				kftHIMap.put("chkcnt"		  	, "0");

				//DataSetMap dsm = new DataSetMap();
				//상태값을 신규생성상태로 세팅한다.
				//kftHIMap.put(NexacroConstant.DATASET_ROW_TYPE,  DataSet.ROW_TYPE_INSERTED);
				kftHIMap.put("dvsn", 					"I");
				kftHIMap.put("sqlnamespace", "cust.kftcCmsDocInfo");
				rentalOrderSvc.kftcCmsDocInfo(kftHIMap);

				//저장에성공한경우 IR Interface를 수행한다.
				//소켓통신결과 로 RTSD0012 테이블 이력업데이트
				List niceList = new ArrayList();
				Map  irMap = new HashMap();
				irMap.put("ip", ip);
				irMap.put("port", port);

				List<String> kftcList = new ArrayList<String>();
				kftcList.add(transactionCode);
				kftcList.add(byteSize		);
				kftcList.add(openTxt  		);
				kftcList.add(docHeader		);
				kftcList.add(docType		);
				kftcList.add(primaryBitmap	);
				kftcList.add(tradeGbCd		);
				kftcList.add(docSendTime	);
				kftcList.add(docCheckNo		);
				kftcList.add(tradStartTime	);
				kftcList.add(tradStartDt	);
				kftcList.add(gigwanCd		);
				kftcList.add(checkoutAccount);
				kftcList.add(gigwanTypeCd	);
				kftcList.add(serialNo		);
				kftcList.add(gigwanPwd		);

				irMap.put("irDsList", kftcList);


				//소켓을 통해 IR SafeKey를 조회한다.
				PCISocketProcess process = new PCISocketProcess();
				String resultString = process.getIRSafeKey(irMap);

				logger.debug("############################## [@@@@@@@@@@@@@@@@@@@금결원 응답 데이타@@@@@@@@@@@@@@@@@@] ###############################");
				logger.debug("[resultString :::::::::::  " + resultString + "]");
				logger.debug("############################################################################");

				String transactionCode2 	= "";
				String byteSize2			= "";
				String openTxt2  			= "";
				String docHeader2			= "";
				String docType2				= "";
				String primaryBitmap2		= "";
				String tradeGbCd2			= "";
				String docSendTime2			= "";
				String docCheckNo2			= "";
				String tradStartTime2		= "";
				String tradStartDt2			= "";
				String gigwanCd2			= "";
				String checkoutAccount2		= "";
				String gigwanTypeCd2		= "";
				String serialNo2	        = "";
				String gigwanPwd2			= "";
				String accountRealNm2		= "";
				//String returnCode2			= "";

				//응답코드에 해당되는 자료로 업데이트 실행
				//응답코드로 업데이트처리(정상적인 리턴인경우만 처리하도록 한다.
				try {
					byte[] b = resultString.getBytes();
					byte[] b2 = resultString.getBytes("utf-8");
					openTxt2			  = 	new String(b, 0, 3);		//TEXT개시문자
					docHeader2			  =     new String(b, 3, 9);		//전문헤더
					docType2			  =     new String(b, 12, 4);		//전문TYPE
					primaryBitmap2		  =     new String(b, 16, 16);		//PRIMARY BITMAP
					tradeGbCd2			  =     new String(b, 32, 6);		//거래구분코드
					docSendTime2		  =     new String(b, 38, 10);		//전문전송일시
					docCheckNo2			  =     new String(b, 48, 6);		//전문추적번호
					tradStartTime2		  =     new String(b, 54, 6);		//거래개시시간
					tradStartDt2		  =     new String(b, 60, 4);		//거래개시일
					gigwanCd2			  =     new String(b, 64, 9);		//참가기관코드
					checkoutAccount2	  =     new String(b, 73, 39);		//지정출금계좌번호
					gigwanTypeCd2		  =     new String(b, 112, 15);		//이용기관식별코드
					serialNo2	          =     new String(b, 127, 40);		//납부자번호/생년월일(사업자번호)
					accountRealNm2		  =     new String(b,167, 43);		//계좌실명
					returnCode2			  =   	new String(b, 213, 4);		//응답코드

	//				kftHIMap.put("acertErrcd", 		returnCode2);
	//				kftHIMap.put("acertErrcd", 		"0000");
	//				kftHIMap.put("acertDesc", 		"");
				} catch(Exception e) {
					logger.debug("[e.toString() :::::::::::  " + e.toString() + "]");
					e.printStackTrace();
				}

				kftHIMap.remove("dvsn");
				kftHIMap.put("dvsn", 	   "U");
				kftHIMap.put("acertSeq",   String.valueOf(kftHIMap.get("acertSeq")));
				kftHIMap.put("acertErrcd", returnCode2);

				//20200306 kstka 계좌인증시 인증여부 업데이트
				if("0000".equals(returnCode2)) {
					kftHIMap.put("acertChk", "Y");
				} else {
					kftHIMap.put("acertChk", "N");
				}

				//응답결과를 업데이트한다.
				rentalOrderSvc.kftcCmsDocInfo(kftHIMap);

			}

		} catch ( Exception e ) {
			e.printStackTrace();
		}


		Map<String , Object> rtnMap = new HashMap<String, Object>();
		if(!"0000".equals(returnCode2)){
			kftHIMap.put("returnCode", "-1");
		} else {
			kftHIMap.put("returnCode", String.valueOf(returnCode2));
		}

		return kftHIMap;
	}

	/**
	 * 판매인 정보 찾기
	 * @param request
	 * @param orderVo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/searchSalesMan")
	@ResponseBody
	public Map<String, Object> searchSalesMan(HttpServletRequest request, RentalOrderVo orderVo, Model model) throws Exception {
		String firstYn  = (String) request.getParameter("firstYn"); //최초조회여부 추가 2015-11-26

		Map<String, Object> rsMap = new HashMap<String, Object>();
		try {
			List<RentalOrderVo> list = rentalOrderSvc.searchSalesMan(orderVo);
			int size = list.size();
			List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();
			rtnList = (List<Map<String, Object>>) page(list , 5, Integer.parseInt(orderVo.getPageNo()) );

			PageVo pageVo = new PageVo();
			pageVo.setTotalCount(size);
			pageVo.setPageNo(Integer.parseInt(orderVo.getPageNo()));
			pageVo.setPageSize(10);
			rsMap.put("pageCommon", pageVo);
			rsMap.put("rtnList", rtnList);

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return rsMap;
	}

	/**
	 * 재고 확인
	 * @param request
	 * @param orderVo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/stock")
	@ResponseBody
	public Map<String, Object> stock(HttpServletRequest request, OrderVo orderVo, Model model) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();
		try {

			List<Map<String, String>> paramList = new ArrayList<Map<String,String>>();
			for(int i = 0; i<orderVo.getItemCdArr().size(); i++) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("itemCd", orderVo.getItemCdArr().get(i));
				map.put("reqQy", orderVo.getItemCntArr().get(i));

				paramList.add(map);
			}

			String stock = sapRfcSvc.getSapCheckByOrderable(orderVo.getBpCd() , paramList);

			if(StringUtil.isEmpty(stock)){
				//실패일 때 리턴 형식
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
			else{
				//성공일 때 리턴 형식
				if("Y".equals(stock)) {
					rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
					rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
				} else {
					rsMap.put(WebConstants.Rtn.RETURN_CODE, "-100");
					rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, "재고가 없습니다.");
				}
			}
		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	/**
	 * 렌탈전문점 정보_Ajax (지도)
	 * @param
	 * @return
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping("rentalAgencyInfo")
	public Map<String , Object> rentalAgencyInfo(HttpServletRequest request, HttpServletResponse response, @RequestBody RentalOrderVo orderVo ) throws Exception {
		Map<String , Object> rsMap = new HashMap<String, Object>();

		try {

			if(StringUtil.isEmpty(orderVo.getOilServiceYn())){
				orderVo.setOilServiceYn(StringUtil.nvl(request.getParameter("oilServiceYn"), "N"));
			}

			//전문점 리스트
			List<RentalOrderVo> list = rentalOrderSvc.rentalList(orderVo);

			//전문점 사진
			List<RentalOrderVo> acyFileList = rentalOrderSvc.selectAcyFile(orderVo);

			rsMap.put("rtnList", list);
			rsMap.put("acyFileList", acyFileList);

			//성공일 때 리턴 형식
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}



		return rsMap;
	}

	/**
	 * 내 위치 주변 전문점 찾기
	 * @param
	 * @return
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping("selectAroundRentalStoreMap")
	public Map<String , Object> selectAroundRentalStoreMap(HttpServletRequest request, HttpServletResponse response, @RequestBody RentalOrderVo orderVo ) throws Exception {
		Map<String , Object> rsMap = new HashMap<String, Object>();

		try {

			if(StringUtil.isEmpty(orderVo.getOilServiceYn())){
				orderVo.setOilServiceYn(StringUtil.nvl(request.getParameter("oilServiceYn"), "N"));
			}

			//내 위치 주변의 전문점 찾기
			List<RentalOrderVo> list = rentalOrderSvc.selectAroundRentalStoreMap(orderVo);

			rsMap.put("rtnList", list);

			//성공일 때 리턴 형식
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}


    /**
     * 렌탈 작업 등록, 접수 api
     * @param
     * @return
     * @author 나현지
     * @exception Exception
     */
    @ResponseBody
    @RequestMapping("saveRentalOpertReg")
    public Map<String , Object> saveRentalOpertReg(HttpServletRequest request, HttpServletResponse response, @RequestBody Map map ) throws Exception {
        Map<String, Object> rsMap = null;
        try {
            rsMap = rentalOrderSvc.saveRentalOpertReg(map);
        } catch ( Exception e ) {
            e.printStackTrace();
            rsMap = new HashMap<String, Object>();
            rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
            rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
        }
        return rsMap;
    }

    /**
     * 렌탈 작업 등록, 접수 api
     * @param
     * @return
     * @author 나현지
     * @exception Exception
     */
    @ResponseBody
    @RequestMapping("saveRentalOpertResult")
    public Map<String , Object> saveRentalOpertResult(HttpServletRequest request, HttpServletResponse response, @RequestBody Map map ) throws Exception {
        Map<String, Object> rsMap = null;
        try{
            rsMap = new HashMap<String, Object>();
            rentalOrderSvc.saveRentalOpertResult(map);
            rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
            rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
        } catch ( Exception e ) {
            e.printStackTrace();
            rsMap = new HashMap<String, Object>();
            rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
            rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
        }
        return rsMap;
    }

    /**
	 * 요일에 따른 시간 조회
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("selectSetTimeList")
	@ResponseBody
	public Map<String , Object> selectSetTimeList(HttpServletRequest request, @RequestBody OrderVo orderVo) throws Exception {
		Map<String , Object> rsMap = new HashMap<String, Object>();

		try {
	    	List<OrderVo> orderTimeList = orderSvc.selectOrderTime(orderVo);
	    	rsMap.put("orderTimeList", orderTimeList);

	    	rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
            rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		} catch ( Exception e ) {
			e.printStackTrace();
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	@RequestMapping("getWorkingTime/{qy}")
    @ResponseBody
    public Integer getWorkingTime(@PathVariable Integer qy) throws Exception {
        return orderSvc.getWorkingTime(qy);
    }
}
