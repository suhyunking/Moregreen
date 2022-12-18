package site.moregreen.basic.kakaoPay;

import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.extern.java.Log;
import site.moregreen.basic.command.DeliveryDto;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.command.PurchaseDto;

@Service
@Log
@Transactional(readOnly = true) //service impl에서 모든 method에 적용됨 (select에서 사용)
public class KakaoPayService {

	private static final String HOST = "https://kapi.kakao.com";
	private String m_id;
	private String orderId = createOrderId();

	private KakaoPayReadyVO kakaoPayReadyVO = new KakaoPayReadyVO();
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	Map<String, Object> hashMap = new HashMap<>();

    
    public String kakaoPayReady(FundingDto fundingDto, PurchaseDto purchaseDto, DeliveryDto deliveryDto, MemberDto memberDto) {
    	
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "571a3d93062b8d6f969af483bf541a25");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        kakaoPayReadyVO.setUserId(memberDto.getM_id());
        this.m_id = memberDto.getM_id();
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", orderId);
        params.add("partner_user_id", kakaoPayReadyVO.getUserId());
        params.add("item_name", fundingDto.getF_reward());
        params.add("quantity", purchaseDto.getP_amount().toString());
        params.add("total_amount", purchaseDto.getP_total().toString());
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://52.78.137.86:8080/moregreen/funding/fundingPurchaseResult");
        params.add("cancel_url", "http://52.78.137.86:8080/moregreen/funding/fundingPurchaseCancel");
        params.add("fail_url", "http://52.78.137.86:8080/moregreen/funding/fundingPurchaseFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            hashMap.put("fundingDto", fundingDto);
            hashMap.put("purchaseDto", purchaseDto);
            hashMap.put("deliveryDto", deliveryDto);
            hashMap.put("memberDto", memberDto);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    public Map<String, Object> kakaoPayInfo(String pg_token) {
 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "571a3d93062b8d6f969af483bf541a25");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", orderId);
        params.add("partner_user_id", m_id);
        params.add("pg_token", pg_token);
//        params.add("total_amount", "2100");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            hashMap.put("kakaoPayApprovalVO", kakaoPayApprovalVO);
            
            return hashMap;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
    public String createOrderId(){
    	Random rnd = new Random();
    	StringBuffer buf = new StringBuffer();
    	for(int i=0;i<5;i++){
    	    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
    	    if(rnd.nextBoolean()){

    	        buf.append((char)((int)(rnd.nextInt(26))+97));

    	    }else{

    	        buf.append((rnd.nextInt(10)));
    	    }
    	}
    	
    	// 주문번호 난수 생성 yyMMdd + 난수 5자리 (영문,숫자)
        String secondOrderId = buf.toString();
        // 현재 날짜 구하기
        LocalDate now = LocalDate.now();
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
        // 포맷 적용
        String firstOrderId = now.format(formatter);
        
        String orderId = firstOrderId + secondOrderId;
        
    	return orderId;
    }
	
    
public boolean kakaoPayCancel(PurchaseDto purchaseDto) {
    	
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "571a3d93062b8d6f969af483bf541a25");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", purchaseDto.getP_tid());
        params.add("cancel_amount", purchaseDto.getP_total().toString());
        params.add("cancel_tax_free_amount", "0");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            KakaoPayCancelVO kakaoPayCancelVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body, KakaoPayCancelVO.class);
            
            return true;
 
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return false;
        
    }
}
