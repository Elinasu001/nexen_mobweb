package com.nexwrms.mobweb.com.svc;

import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @Class Name : KakaoUserInfoSvc.java
 * @Description : 카카오 로그인 사용자정보 연동
 * @Modification Information  
 * @
 * @ Date            Author       Description
 * @ -------------  -----------  -------------
 * @ 2019. 08. 30.    주영완		  최초 생성
 * 
 */
public class SnsUserInfoSvc {
    public static JsonNode getKakaoUserInfo(String token) {
 
        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        // add header
        post.addHeader("Authorization", "Bearer " + token);
 
        JsonNode returnNode = null;
 
        try {
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
 
            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

        }
 
        return returnNode;
    }
    
    
    public static JsonNode getNaverUserInfo(String token) {
    	 
        final String RequestUrl = "https://openapi.naver.com/v1/nid/me";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        // add header
        post.addHeader("Authorization", "Bearer " + token);
 
        JsonNode returnNode = null;
 
        try {
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
 
            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

        }
 
        return returnNode;
    }    
    
    public static JsonNode getFacebUserInfo(String token) {
   	 
        final String RequestUrl = "https://graph.facebook.com/me?access_token="+token;
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpGet get = new HttpGet(RequestUrl);
        System.out.println("***********get******************"+get);
        
        // add header
/*        post.addHeader("access_token", token);*/
 
      JsonNode returnNode = null;
      
       try {
            final HttpResponse response = client.execute(get);
            System.out.println("***************response**************"+response);

            final int responseCode = response.getStatusLine().getStatusCode();
 
            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

        }
 
        return returnNode;
    }       
    
}





