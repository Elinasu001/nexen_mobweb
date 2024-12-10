package com.nexwrms.mobweb.com.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


import java.util.Map.Entry;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;


/**
 * @author 7777180110
 * @desc properties 파일을 읽어들어 메타정보들(SNS) 저장
 */

@Service("com.snr.hp.common.util.PropertiesFileRead")
public class PropertiesFileRead {
	
	
	private Map<String,Object> map;	// product facebook map 객체
	/**
	 * @desc properties 읽어들이기
	 */
	public  Map<String,Object> readProperties(){
		ClassPathResource resource = new ClassPathResource("message/message-product.properties");
		map = new HashMap<String,Object>();
		try {
			
			Properties properties = new Properties();
			
			properties.load(new FileInputStream(resource.getURI().getPath()));
			
			for(Entry<Object, Object> entry  : properties.entrySet()){
//				
//				OgVo ogVo = new OgVo();
//				
//				// , 기준으로 짜른후 밸류로 넣기
//				String []values = null;
//				values = entry.getValue().toString().split(",");
//				
//				ogVo.setTitle(values[0]);
//				ogVo.setUrl(values[1]);
//				ogVo.setImage(values[2]);
//				ogVo.setDescription(values[3]);
//				
//				map.put(entry.getKey().toString(), ogVo);
				
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
		
	}

}
