package com.nexwrms.mobweb.com.message.svc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.svc.AbstractCboSvc;
import com.nexwrms.core.util.StringUtil;
import com.nexwrms.mobweb.com.vo.TitleVo;
import com.nexwrms.mobweb.com.message.dao.MsgDao;
import com.nexwrms.core.constants.CoreConstants;
import com.nexwrms.core.message.vo.MsgVo;

@Service("com.nexwrms.mobweb.com.message.svc.MsgSvc")
public class MsgSvcImpl extends AbstractCboSvc implements MsgSvc {

	@Override
	@Cacheable("msgCache")
	public MsgVo selectMsg(String msgKey, String locale) {

	    if(StringUtil.isEmpty(locale)){
	        if(StringUtil.isEmpty(SessionInfoUtil.getUsrLocale())){
	            locale = CoreConstants.DEFAULT_LANG_CD;
	        } else{
	            locale = SessionInfoUtil.getUsrLocale();
	        }
	    }

		Map<String, String> param = new HashMap<String, String>();
		param.put("msgKey", msgKey);
		param.put("langCd", locale);
		return cboCmDao.selectOne(MsgDao.selectMsg, param);
	}

	@Override
	public TitleVo selectLabel(String lablKey, String locale) {

	    if(StringUtil.isEmpty(locale)){
            if(StringUtil.isEmpty(SessionInfoUtil.getUsrLocale())){
                locale = CoreConstants.DEFAULT_LANG_CD;
            } else{
                locale = SessionInfoUtil.getUsrLocale();
            }
        }

		Map<String, String> param = new HashMap<String, String>();
		param.put("lablKey", lablKey);
		param.put("langCd", locale);
		return cboCmDao.selectOne(MsgDao.selectLabel, param);
	}

}
