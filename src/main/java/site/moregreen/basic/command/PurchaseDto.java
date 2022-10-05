package site.moregreen.basic.command;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PurchaseDto {
	
	private Integer f_num;				//펀딩 번호 FK
	private String f_title;
	private String f_price;
	private Integer f_rate;			//펀딩률
	private Integer f_status;		//진행 상태
	private String f_enddate;
	private String f_reward;
	
	private Integer p_num;				//구매 번호
	private Integer p_payment;			//결제 상태
	private Integer p_amount;			//구매 수량
	private Integer p_total;			//총 금액
	private Integer p_method;			//결제 방법
	private String p_tid;				//tid
	private Date p_date;				//결제 일자 approved_at
	
	private Integer d_num;				//배송지 번호 FK
	private String d_name;
	private String d_phone;		//전화번호
	private Integer d_zipcode;		//우편번호
	private String d_addr;			//주소
	private String d_detailaddr;	//상세주

	private Integer m_num;
	private String m_id;
	
}

