package com.nexwrms.mobweb.cart.ctl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nexwrms.cfo.com.cart.svc.CartSvc;
import com.nexwrms.cfo.com.cart.vo.CartVo;
import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.cfo.com.pkg.svc.PkgItemDcrtSvc;
import com.nexwrms.cfo.com.pkg.vo.PkgItemDcrtSearchVo;
import com.nexwrms.cfo.com.pkg.vo.PkgItemDcrtVo;
import com.nexwrms.cfo.to.sd.vo.OdBasketToVo;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;
import com.nexwrms.core.util.StringUtil;
import com.nexwrms.nextlevel.com.cart.svc.RentalCartSvc;
import com.nexwrms.nextlevel.com.cart.vo.RentalCartVo;
import com.nexwrms.nextlevel.com.login.vo.ReRentalVo;
import com.nexwrms.nextlevel.com.product.svc.RentalProductSvc;
import com.nexwrms.nextlevel.com.product.vo.RentalPrdRsVo;
import com.nexwrms.nextlevel.com.product.vo.RentalPrdSearchVo;
import com.nexwrms.nextlevel.to.cart.vo.RentalCartToVo;
/**
 * @class Name : CartCtl.java
 * @Description : FO Cart
 * @RequestMapping 
 * @Modification Informat ion
 * @
 * @ Date            Author       Description
 * @ -------------  -----------  -------------
 * @ 2019. 09. 05.    주영완		  최초 생성
 * 
 */
@RequestMapping("/cart")
@Controller
public class CartCtl {
	private static final Logger logger = LoggerFactory.getLogger(CartCtl.class);
	
	@Autowired
	@Qualifier("com.nexwrms.cfo.com.cart.svc.CartSvc")
	private CartSvc cartSvc;
	
	@Autowired
	@Qualifier("com.nexwrms.nextlevel.com.cart.svc.RentalCartSvc")
	private RentalCartSvc rentalCartSvc;
	
	@Autowired
	@Qualifier("com.nexwrms.nextlevel.com.product.svc.RentalProductSvc")
	private RentalProductSvc rentalProductSvc;

	@Autowired
	@Qualifier("com.nexwrms.cfo.com.pkg.svc.PkgItemDcrtSvc")
	private PkgItemDcrtSvc pkgItemDcrtSvc;
	   	
	
	/*
	 * 장바구니 진입화면 호출
	 */
	@RequestMapping("/cartView")
	public String cartView(HttpServletRequest request, Model model, CartVo vo) throws Exception {
		String rUrl = "";
		
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		
		String tabGbn = request.getParameter("tab");
		
		List<CartVo> 		o2oList 	= new ArrayList<CartVo>();
		List<RentalCartVo> 	nomalRenList 	= new ArrayList<RentalCartVo>();//일반렌탈
		List<RentalCartVo> 	freeRenList 	= new ArrayList<RentalCartVo>();//자유렌탈
		List<RentalCartVo> 	memberRenList 	= new ArrayList<RentalCartVo>();//멤버십렌탈
		
		// 일반 코드
		List<String> list1 = new ArrayList<>();
		// 자유 코드
		List<String> list2 = new ArrayList<>();
		// 멤버십 코드
		List<String> list3 = new ArrayList<>();		

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/cart/cartView");
			rUrl = "/login/userLogin";
		} else {
			model.addAttribute("officerCd", clientVo.getOfficerCd());
			//내용 조회 (구매)
			vo.setUserId(clientVo.getCustId());
			o2oList = cartSvc.selectCartListView(vo);
		
			// 일반렌탈 및 일시불 [(01,01),(01,02),(03,06),(03,07)]
			list1.add("('01','01')");
			list1.add("('01','02')");
			list1.add("('03','06')");
			list1.add("('03','07')");
			vo.setPrdtGrp(list1);
			//내용 조회 (일반렌탈)
			nomalRenList = rentalCartSvc.selectCartListView(vo);
	
			// 자유 (01,04)
			list2.add("('01','04')");
			vo.setPrdtGrp(list2);	
			freeRenList = rentalCartSvc.selectCartListView(vo);
			
			// 멤버십 (04,09)
			list3.add("('04','09')");			
			vo.setPrdtGrp(list3);	
			memberRenList = rentalCartSvc.selectMembershipCartListView(vo);

			model.addAttribute("O2osearchText", vo.getO2osearchText());
			model.addAttribute("RentalsearchText", vo.getRentalsearchText());			
			model.addAttribute("tabGbn", tabGbn);
			model.addAttribute("clientVo", clientVo);
			model.addAttribute("o2oList", o2oList);
			model.addAttribute("nomalRenList", nomalRenList);
			model.addAttribute("freeRenList", freeRenList);
			model.addAttribute("memberRenList", memberRenList);
			model.addAttribute("reRentUseYN",    	SessionUtil.getAttribute("reRentUseYN"));	//재렌탈고객 여부
			
			rUrl = "/cart/cartView";
		}
		
		//10233006 GA title tag 동적 변경
		if(StringUtil.equals(rUrl, "/login/userLogin")) {
			model.addAttribute("title", "장바구니_로그인 | NEXT LEVEL");
		}else if(StringUtil.equals(rUrl, "/cart/cartView")) {
			model.addAttribute("title", "장바구니 | NEXT LEVEL");
		}
		
		return rUrl;
	} 		
	
	/*
	 * 장바구니 수량 및 가격 수정
	 */
	@RequestMapping(value="/udateO2oCart" , method={RequestMethod.POST})
	@ResponseBody
	public void udateO2oCart(HttpServletRequest request, @RequestBody OdBasketToVo vo, Model model) throws Exception {
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		vo.setUserId(userVo.getLoginId());
		cartSvc.udateO2oCart(vo);
	}	
	
	/*
	 * 장바구니 삭제
	 */
	@RequestMapping(value="/deleteO2oCart" , method={RequestMethod.POST})
	@ResponseBody
	public void deleteO2oCart(HttpServletRequest request, @RequestBody OdBasketToVo vo, Model model) throws Exception {
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		vo.setUserId(userVo.getLoginId());
		cartSvc.deleteO2oCart(vo);
	}	
	
	
	/*
	 * 장바구니 중복 체크
	 */
	@RequestMapping(value="/selectCartCheck" , method={RequestMethod.POST})
	@ResponseBody 
	public Map<String, Object> selectCartCheck(HttpServletRequest request, @RequestBody CartVo vo, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		vo.setUserId(userVo.getLoginId());		
		int cnt = cartSvc.selectCartCheck(vo);
		map.put("cnt", cnt);
		return map;
	}	
	
	
	/*
	 * 일반렌탈 렌탈 서비스 항목 가져오기
	 */
	@RequestMapping(value="/selectUpdateRentalInfo" , method={RequestMethod.POST})
	@ResponseBody 
	public Map<String, Object> selectUpdateRentalInfo(HttpServletRequest request, @RequestBody RentalPrdRsVo vo) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> serviceMap = new HashMap<String, Object>();

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		String userId = "";
		vo.setOrderYn("N"); // 주문내역 유무
		
		//주문 내역이 있을경우 1본, 3본 주문가능
		if(clientVo != null){
			userId = clientVo.getCustId();
			if(userId != null){
				
				//주문내역 확인
				int orderCnt = rentalProductSvc.getCustOrderCnt(userId);
				
				if(orderCnt > 0){
					vo.setOrderYn("Y");
				}
			}
		}
		
		List<RentalPrdRsVo> searchCdList = rentalProductSvc.getCartViewCdList1(vo);		

		//각 렌탈의 서비스 코드 가져오기
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		

			List<Map<String, Object>> svrList = rentalProductSvc.selectSRtsd0005ShopServiceList(vo);
			for(Map svrMap:svrList){

				if(("B00001").equals(svrMap.get("prsDcd"))){ //엔진오일
					serviceMap.put("selEnginCd", svrMap.get("servCnt"));
				}else if(("B00002").equals(svrMap.get("prsDcd"))){ //위치교환
					serviceMap.put("selLocCd", svrMap.get("servCnt"));
				}else if(("B00003").equals(svrMap.get("prsDcd"))){ //방문점검
					serviceMap.put("selVisCd", svrMap.get("servCnt"));
				}else if(("B00004").equals(svrMap.get("prsDcd"))){ //보관
					serviceMap.put("selSaveCd", svrMap.get("servCnt"));
				}else if(("B00006").equals(svrMap.get("prsDcd"))){ //교체
					serviceMap.put("selEnginCd", svrMap.get("servCnt"));
				}else if(("B00007").equals(svrMap.get("prsDcd"))){ //프리미엄(사계절보증제도)
					serviceMap.put("selPrCd", svrMap.get("servCnt"));
				}else if(("B00008").equals(svrMap.get("prsDcd"))){ //얼라인먼트
					serviceMap.put("selArCd", svrMap.get("servCnt"));
				}
			}
			
		
		// 추천렌탈 - 계약 개월 코드
		List<RentalPrdSearchVo> recomMonthList = rentalProductSvc.selectProdViewCdList42(vo);
		//렌탈 등록비
		//vo.setCntCd("");
		List<RentalPrdSearchVo> regAmtList = rentalProductSvc.selectRntalRegAmtList(vo);		
		
		resultMap.put("regAmtList",regAmtList); 		//등록비
		resultMap.put("serviceMap",serviceMap); 		//렌탈서비스목록 
		resultMap.put("chkMonthCd",vo.getPeriodCd()); 	//개월수
		resultMap.put("recomMonthList",recomMonthList); //계약 개월 코드
		resultMap.put("searchCdList",searchCdList); 	//타이어 본수
		
		return resultMap;
	}		
	
	/*
	 * 일반렌탈 렌탈 서비스 장착서비스 불러오기
	 */
	@RequestMapping(value="/selectChageOptionInfo" , method={RequestMethod.POST})
	@ResponseBody 
	public Map<String, Object> selectChageOptionInfo(HttpServletRequest request, @RequestBody RentalPrdRsVo vo) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> serviceMap = new HashMap<String, Object>();

		//각 렌탈의 서비스 코드 가져오기
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

			List<Map<String, Object>> svrList = rentalProductSvc.selectSRtsd0005ShopServiceList(vo);
			for(Map svrMap:svrList){

				if(("B00001").equals(svrMap.get("prsDcd"))){ //엔진오일
					serviceMap.put("selEnginCd", svrMap.get("servCnt"));
				}else if(("B00002").equals(svrMap.get("prsDcd"))){ //위치교환
					serviceMap.put("selLocCd", svrMap.get("servCnt"));
				}else if(("B00003").equals(svrMap.get("prsDcd"))){ //방문점검
					serviceMap.put("selVisCd", svrMap.get("servCnt"));
				}else if(("B00004").equals(svrMap.get("prsDcd"))){ //보관
					serviceMap.put("selSaveCd", svrMap.get("servCnt"));
				}else if(("B00006").equals(svrMap.get("prsDcd"))){ //교체
					serviceMap.put("selEnginCd", svrMap.get("servCnt"));
				}else if(("B00007").equals(svrMap.get("prsDcd"))){ //프리미엄(사계절보증제도)
					serviceMap.put("selPrCd", svrMap.get("servCnt"));
				}else if(("B00008").equals(svrMap.get("prsDcd"))){ //얼라인먼트
					serviceMap.put("selArCd", svrMap.get("servCnt"));
				}
			}
		
		resultMap.put("serviceMap",serviceMap); 		//렌탈서비스목록 
		return resultMap;
	}	
	
	/*
	 * 일반렌탈 렌탈 장바구니 옵션 수정
	 */
	@RequestMapping("/modifyCrtItem")
	@ResponseBody
	public void modifyCrtItem(HttpServletRequest request, Model model, RentalCartToVo vo) throws Exception {
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		vo.setCustId(clientVo.getCustId());				
		rentalCartSvc.modifyCrtItem(vo);
	}
	
	
	/*
	 * 자유렌탈 장바구니 옵션 수정
	 */
	@RequestMapping("/modifyCrtService")
	@ResponseBody
	public void modifyCrtService(HttpServletRequest request, Model model, @RequestBody RentalCartToVo vo) throws Exception {
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		vo.setCustId(clientVo.getCustId());				
		rentalCartSvc.modifyCrtService(vo);
	}
		
	
	/*
	 * 자유렌탈 서비스 항목 가져오기
	 */
	@RequestMapping("/openCartOption")
	@ResponseBody 
	public Map<String, Object> openCartOption(HttpServletRequest request, RentalPrdRsVo vo) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> serviceMap = new HashMap<String, Object>();
		RentalPrdRsVo renVo = new RentalPrdRsVo();

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		
		String userId = "";
		renVo.setOrderYn("N"); // 주문내역 유무
		
		//주문 내역이 있을경우 1본, 3본 주문가능
		if(clientVo != null){
			userId = clientVo.getCustId();
			if(userId != null){
				
				//주문내역 확인
				int orderCnt = rentalProductSvc.getCustOrderCnt(userId);
				
				if(orderCnt > 0){
					renVo.setOrderYn("Y");
				}
			}
		}
		
		
		
		List<RentalPrdRsVo> searchCdList = rentalProductSvc.getCartViewCdList1(vo);				
		// 추천렌탈 - 계약 개월 코드
		List<RentalPrdSearchVo> recomMonthList = rentalProductSvc.selectProdViewCdList42(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		List<Map<String, Object>> list = rentalProductSvc.selectFreeRentalServiceList(vo);

		List<Map> getProdViewCdList51 = new ArrayList(); //엔진오일
		List<Map> getProdViewCdList52 = new ArrayList(); //위치교환
		List<Map> getProdViewCdList53 = new ArrayList(); //방문점검
		List<Map> getProdViewCdList54 = new ArrayList(); //보관
		List<Map> getProdViewCdList55 = new ArrayList(); //교체
		List<Map> getProdViewCdList56 = new ArrayList(); //프리미엄(사계절보증제도)
		List<Map> getProdViewCdList57 = new ArrayList(); //얼라인먼트

		for(int i=0; i<list.size(); i++){
			if(("B00001").equals(list.get(i).get("prsDcd"))){ //엔진오일
				getProdViewCdList51.add((Map) list.get(i));
			}else if(("B00002").equals(list.get(i).get("prsDcd"))){ //위치교환
				getProdViewCdList52.add((Map) list.get(i));
			}else if(("B00003").equals(list.get(i).get("prsDcd"))){ //방문점검
				getProdViewCdList53.add((Map) list.get(i));
			}else if(("B00004").equals(list.get(i).get("prsDcd"))){ //보관
				getProdViewCdList54.add((Map) list.get(i));
			}else if(("B00006").equals(list.get(i).get("prsDcd"))){ //교체
				getProdViewCdList55.add((Map) list.get(i));
			}else if(("B00007").equals(list.get(i).get("prsDcd"))){ //프리미엄(사계절보증제도)
				getProdViewCdList56.add((Map) list.get(i));
			}else if(("B00008").equals(list.get(i).get("prsDcd"))){ //얼라인먼트
				getProdViewCdList57.add((Map) list.get(i));
			}
		}

		resultMap.put("getProdViewCdList51", getProdViewCdList51); //엔진오일 교체 서비스
		resultMap.put("getProdViewCdList52", getProdViewCdList52); //위치교환서비스 무상 서비스
		resultMap.put("getProdViewCdList53", getProdViewCdList53); //방문점검서비스
		resultMap.put("getProdViewCdList54", getProdViewCdList54); //보관서비스
		resultMap.put("getProdViewCdList55", getProdViewCdList55); //타이어 교체 서비스
		resultMap.put("getProdViewCdList56", getProdViewCdList56); //타이어 무상 교체 서비스
		resultMap.put("getProdViewCdList57", getProdViewCdList57); //얼라인먼트 무상 서비스
		
		
		
		//선택한 옵션 조회
		HashMap<String, String> serviceParam = new HashMap();
		serviceParam.put("custId", userId);
		serviceParam.put("itemNo", vo.getItemNo());
		vo.setCustId(clientVo.getCustId());
		List<Map> selServiceList = new ArrayList();
		selServiceList = rentalCartSvc.selServiceList(vo);
		
		String selEnginCd = ""; //엔진오일
		String selLocCd = ""; //위치교환
		String selVisCd = ""; //방문점검
		String selSaveCd = ""; //보관
		String selChCd = ""; //교체
		String selPrCd = ""; //프리미엄(사계절보증제도)
		String selArCd = ""; //얼라인먼트
		
		
		for(int i=0; i<selServiceList.size(); i++){
			if(("B00001").equals(selServiceList.get(i).get("PRS_DCD"))){ //엔진오일
				
				selEnginCd = selServiceList.get(i).get("SERV_CNT").toString();
				
			}else if(("B00002").equals(selServiceList.get(i).get("PRS_DCD"))){ //위치교환
				
				selLocCd = selServiceList.get(i).get("SERV_CNT").toString();
				
			}else if(("B00003").equals(selServiceList.get(i).get("PRS_DCD"))){ //방문점검
				
				selVisCd = selServiceList.get(i).get("SERV_CNT").toString();
				
			}else if(("B00004").equals(selServiceList.get(i).get("PRS_DCD"))){ //보관
				
				selSaveCd = selServiceList.get(i).get("SERV_CNT").toString();
				
			}else if(("B00006").equals(selServiceList.get(i).get("PRS_DCD"))){ //교체
				
				selChCd = selServiceList.get(i).get("SERV_CNT").toString();
				
			}else if(("B00007").equals(selServiceList.get(i).get("PRS_DCD"))){ //프리미엄(사계절보증제도)
				
				selPrCd = selServiceList.get(i).get("SERV_CNT").toString();
				
			}else if(("B00008").equals(selServiceList.get(i).get("PRS_DCD"))){ //얼라인먼트
				
				selArCd = selServiceList.get(i).get("SERV_CNT").toString();
				
			}
		}
		
		resultMap.put("selEnginCd", selEnginCd);
		resultMap.put("selLocCd", 	selLocCd);
		resultMap.put("selVisCd", 	selVisCd);
		resultMap.put("selSaveCd", 	selSaveCd);
		resultMap.put("selChCd", 	selChCd);
		resultMap.put("selPrCd", 	selPrCd);
		resultMap.put("selArCd", 	selArCd);
			
		//렌탈 등록비
		vo.setCntCd("");
		List<RentalPrdSearchVo> regAmtList = rentalProductSvc.selectRntalRegAmtList(vo);						
		
		resultMap.put("regAmtList",regAmtList); 		//등록비
		resultMap.put("serviceMap",serviceMap); 		//렌탈서비스목록 
		resultMap.put("chkMonthCd",vo.getPeriodCd()); 	//개월수
		resultMap.put("recomMonthList",recomMonthList); //계약 개월 코드
		resultMap.put("searchCdList",searchCdList); 	//타이어 본수
		
		return resultMap;
	}
	
	/*
	 * 장바구니 삭제
	 */
	@RequestMapping(value="/deleteRentalCart" , method={RequestMethod.POST})
	@ResponseBody
	public void deleteRentalCart(HttpServletRequest request, @RequestBody RentalCartToVo vo) throws Exception {
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		vo.setCustId(userVo.getLoginId());
		rentalCartSvc.deleteRentalCart(vo);
	}
	
	/*
	 * 패키지
	 */
	@RequestMapping(value="/pakageO2oAmt" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> pakageO2oAmt(HttpServletRequest request, @RequestBody List<PkgItemDcrtSearchVo> vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List list = new ArrayList<PkgItemDcrtVo>();
		
		list = pkgItemDcrtSvc.selectPkgDcAmtInfo(vo);
		
		map.put("resultList", list);
		return map;
	}
		
}
