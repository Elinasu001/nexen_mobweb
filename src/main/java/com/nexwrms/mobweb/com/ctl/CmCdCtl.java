package com.nexwrms.mobweb.com.ctl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nexwrms.cfo.com.cm.svc.CmCdSvc;
import com.nexwrms.cfo.com.cm.vo.CmCdVo;



@Controller
@RequestMapping("/cmCd")
public class CmCdCtl {
	private static final Logger logger = LoggerFactory.getLogger(CmCdCtl.class);
	
	
	@Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.CmCdSvc")
	private CmCdSvc cmCdSvc;
	
	/**
	* @author	신케이
	* @desc		공통코드리스트 조회
	* @param
	* @return	List<CmCdVo>
	* @throws
	*/
	@RequestMapping("/getCodeListAjax")
	@ResponseBody
	public List<CmCdVo> getCodeListAjax(@RequestParam("grpCd")String grpCd){

		return cmCdSvc.getCodeList(grpCd);
	}

	/**
	* @author	신케이
	* @desc		공통코드명 조회
	* @param
	* @return	Map<String,String>
	* @throws
	*/
	@RequestMapping("/getCodeNameAjax")
	@ResponseBody
	public Map<String, String> getCodeNameAjax(@RequestParam("grpCd")String grpCd, @RequestParam("cd")String cmCd){

		Map<String, String> ret = new HashMap<String, String>();
		ret.put("name", cmCdSvc.getCodeName(grpCd, cmCd));
		return ret;
	}

	/**
	* @author	신케이
	* @desc		공통코드정보 조회
	* @param
	* @return	CmCdVo
	* @throws
	*/
	@RequestMapping("/getCodeInfoAjax")
	@ResponseBody
	public Map<String, String> getCodeInfoAjax(@RequestParam("grpCd")String grpCd
					, @RequestParam("cd")String cmCd
					, @RequestParam("ref")String ref
					){
		Map<String, String> ret = new HashMap<String, String>();
		ret.put(ref, cmCdSvc.getCodeInfo(grpCd, cmCd, ref));
		return ret;
	}
	
	
}
