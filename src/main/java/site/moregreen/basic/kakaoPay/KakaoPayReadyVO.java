package site.moregreen.basic.kakaoPay;

import java.beans.ConstructorProperties;
import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
	//response
    private String tid;
    private String userId;
    private String next_redirect_pc_url;
    private Date created_at;
    
//    @ConstructorProperties({"tid", "next_redirect_pc_url", "created_at"})
//    public KakaoPayReadyVO(String tid, String next_redirect_pc_url, Date created_at) {
//    	this.tid = tid;
//    	this.next_redirect_pc_url = next_redirect_pc_url;
//    	this.created_at = created_at;
//    }
    
}
