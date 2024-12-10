package com.nexwrms.mobweb.com.svc;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nexwrms.mobweb.com.dao.TitleDao;
import com.nexwrms.mobweb.com.vo.TitleVo;
import com.nexwrms.core.svc.AbstractCboSvc;

/**
 * @Class Name : TitleSvc.java
 * @Description : 언어 별 타이틀
 * @Modification Information  
 * @
 * @ Date            Author       Description
 * @ -------------  -----------  -------------
 * @ 2018. 10. 02.    박유진		  최초 생성
 * 
 */
@Service("com.nexwrms.mobweb.cm.com.svc.TitleSvc")
public class TitleSvcImpl extends AbstractCboSvc implements TitleSvc {

	private static final Logger logger = LoggerFactory.getLogger(TitleSvcImpl.class);
	
	
	/**
	 * 언어별 타이틀 목록을 조회 한다.
	 * @author 박유진
	 * @param String
	 * @return List<TitleVo>
	 */
	@Override
	public List<TitleVo> selectAllList(String usrLocale) throws Exception{
		logger.debug("============ usrLocale : " + usrLocale);
		
		return cboCmDao.selectList(TitleDao.selectAllList, usrLocale);
	}	

}
