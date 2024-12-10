package com.nexwrms.mobweb.com.message;

import java.text.FieldPosition;
import java.text.MessageFormat;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.nexwrms.mobweb.com.vo.TitleVo;
import com.nexwrms.mobweb.com.message.svc.MsgSvc;
import com.nexwrms.cfo.com.cm.svc.LogSaveSvc;
import com.nexwrms.core.constants.CoreConstants;
import com.nexwrms.core.message.MessageProvider;
import com.nexwrms.core.message.vo.MsgVo;
import com.nexwrms.core.util.StringUtil;

public class DBMessageProvider implements MessageProvider{

	private final Logger logger = LoggerFactory.getLogger(DBMessageProvider.class);

	@Autowired
	@Qualifier("com.nexwrms.mobweb.com.message.svc.MsgSvc")
	private MsgSvc msgSvc;
	
	@Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.LogSaveSvc")
	private LogSaveSvc logSaveSvc;

	private String LOCALE = CoreConstants.DEFAULT_LANG_CD;

	public MsgVo getMessageVo(String code, String locale) {
		return msgSvc.selectMsg(code,locale);
	}

	private Object[] getLabelVo(Object[] args, String locale) {
		String s = "";
		TitleVo vo = null;
		for(int i = 0 ; i<args.length; i++){
			s = "";
			if(!StringUtil.isEmpty(((String)args[i]))){
				String sArgs = (String)args[i];
				String[] aCols = sArgs.trim().split("\\|");
				for(int j=0; j<aCols.length;j++){
					vo = msgSvc.selectLabel((String)aCols[j], locale);
					if(vo != null){
						s += " " + vo.getTxtContent();
					}else{
						s += " " + (String)aCols[j];
					}
				}
				args[i] = s;
			}
		}
		return args;
	}

	public MsgVo getMessageVo(String code, Object[] args, String locale) {
		MsgVo orgVo = msgSvc.selectMsg(code, locale);
		MsgVo returnVo = null;
		if (orgVo!=null) {
			returnVo = new MsgVo(orgVo.getMsgKey(),orgVo.getSmpsntMsg(), orgVo.getLngtMsg());
			if (args!=null) {
				Object[] argsLabel = getLabelVo(args, locale);
				MessageFormat fmt = new MessageFormat(returnVo.getSmpsntMsg());
				returnVo.setSmpsntMsg(fmt.format(argsLabel, new StringBuffer(), new FieldPosition(0)).toString());
				fmt = new MessageFormat(returnVo.getLngtMsg());
				returnVo.setLngtMsg(fmt.format(argsLabel, new StringBuffer(), new FieldPosition(0)).toString());
			}
		}else{
			returnVo = new MsgVo(code, code, code);
			if(logger.isDebugEnabled()){
				logger.error("[" +code +"] error code is not defined.");
			}
		}
		return returnVo;
	}

	@Override
    public MsgVo getMessageVo(String code, Object[] args) {
        // TODO Auto-generated method stub
        return getMessageVo(code, args, LOCALE);
    }


	@Override
	public String getShortMsg(String code, Object[] args, String locale) {
		return getMessageVo(code, args, locale).getSmpsntMsg();
	}

	@Override
	public String getLongMsg(String code, Object[] args, String locale) {
		return getMessageVo(code, args, locale).getLngtMsg();
	}



    @Override
    public String getShortMsg(String code, Object[] args) {
        // TODO Auto-generated method stub
        return getMessageVo(code, args, LOCALE).getSmpsntMsg();
    }

    @Override
    public String getLongMsg(String code, Object[] args) {
        // TODO Auto-generated method stub
        return getMessageVo(code, args, LOCALE).getLngtMsg();
    }

    @Override
	public String newInsert(String id, String stsCd, String cn, String eMsg){
		
		return logSaveSvc.newInsert(id, stsCd, cn, eMsg);
	}
	
	@Override
	public void newUpdate(String hstNo, String stsCd, String cn, String eMsg, String eFlag){
		logSaveSvc.newUpdate(hstNo, stsCd, cn, eMsg, eFlag);
	}

}
