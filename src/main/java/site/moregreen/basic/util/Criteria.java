package site.moregreen.basic.util;

import lombok.Data;
import site.moregreen.basic.command.MemberDto;

@Data
public class Criteria extends MemberDto {
	
	private int page; //페이지번호
	private int amount; //데이터 개수
	
	//검색키워드 추가
	private String searchName; //펀딩명 검색
	private String searchId;// 아이디 검색
	
	//정렬
	private String f_num; //최신순
	private String f_endDate; //종료일

	//펀딩 상태 필터링
	private String searchStatus;
	//정렬
	private String searchAlign; //정렬
	
	public Criteria() {
		this(1, 10);
	}
	public Criteria(int page, int amount) {
		super();
		this.page = page;
		this.amount = amount;
	}
	
	//limit (페이지 -1) * 데이터개수, 데이터개수
	//limit함수의 앞에 전달될 값
	public int getPageStart() {
		return (page - 1) * amount;
	}
	
	
	
	
	
	
	
	
}
