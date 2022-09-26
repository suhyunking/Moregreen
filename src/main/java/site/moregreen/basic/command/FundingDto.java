package site.moregreen.basic.command;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FundingDto {
	
	private Integer f_num;			//펀딩 번호 PK
	private String f_title;			//펀딩 제목
	private String f_content;		//내용
	private Integer f_days;			//펀딩 기간
	private String f_enddate;		//마감 일자
	private Integer f_target;		//목표 금액
	private Integer f_totalmoney;	//현재 금액
	private Integer f_rate;			//펀딩률
	private Integer f_status;		//진행 상태
	private String f_reward;		//리워드 명칭
	private Integer f_price;		//리워드 금액
	private String f_bname;			//상호명
	private String f_bnum;			//사업자 번호
	private String f_regdate; 		//신청 일자
	private Integer l_count; 		//찜하기 개수
	private Integer m_num;			//회원 번호 FK
	private String m_id;			//신청자 아이디
	private Date p_date;			//결제 일자
	private Integer p_payment;		//결제 상태
	
	
	private List<UploadDto> files = new ArrayList<>(); // 
	

}
