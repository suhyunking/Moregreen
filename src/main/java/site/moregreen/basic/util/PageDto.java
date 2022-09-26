package site.moregreen.basic.util;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.data.domain.Page;

import lombok.Data;

//Java 제네릭 클래스 (클래스에 고정된 형태로 값을 사용하는게 아니라, member를 넣고 싶을 땐 <Member> 이런식으로 저장 값이 달라도 기능만 똑같이 사용할 수 있다.
@Data
public class PageDto<T> {

	//page nation을 그리는 class
	private int start;
	private int end;
	private boolean prev;
	private boolean next;

	// Page<Notice> 클래스를 전달받아서 필요한 값을 멤버 변수로 저장
	private int page; //조회하고 있는 페이지 번호
	private int amount; //보여질 데이터 갯수
	private int pageTotal; //전체 게시글 수
	private List<T> pageData; //조회된 데이터
	private long total; //전체 게시글 수
	
	private List<Integer> pageList; //start~end값 저장
	
	//Constructor
	//여기에 들어오는 T도 생성할 당시에 전달받은 T의 값과 동일하다. 
	public PageDto(Page<T> pageable) {
		this.page = pageable.getNumber() + 1; //1번 페이지
		this.amount = pageable.getSize();
		this.pageTotal = pageable.getTotalPages();
		this.pageData = pageable.getContent(); //조회된 데이터 정보를 담고 있음
		this.total = pageable.getTotalElements();
		
		//end page의 계산
		//(현재 조회하는 페이지 / 10.0) * 10
		this.end = (int)(Math.ceil(this.page / 10.0)) * 10;
		
		//start page 계산
		//끝페이지 - 그려질 페이지네이션 + 1 
		this.start = end - 10 + 1;
		
		//진짜 끝페이지의 계산
		//404의 게시글 > 41번 페이지 도달했을 때 end = 50, total page = 41
		//end가 total page보다 크면 이 때는 total page를 따라간다.
		//end가 total page보다 작으면 end 따라가면 된다.
		//end의 값을 실제 마지막 페이지의 번호로 다시 결정하는 부분임
		this.end = end > pageTotal ? pageTotal : end;
		
		//이전버튼 활성화
		//start 값이 1보다 크면 된다. 왜냐면 start 값은 1, 11, 21, 31 형태로 값을 가지고 있을 것이기 때문이다.
		this.prev = this.start > 1;
		
		//next 버튼은 다음이 있을 때만 활성화 되어야 한다.
		//즉, pageTotal이 end보다 크면 아직 뒤 페이지가 더 남은 것이기 때문에 활성화되어야 한다.
		this.next = this.pageTotal > this.end;
		
		//start부터 end까지 그려지는 리스트 형태로 그려줘야 한다.
		//for문을 사용할 수도 있음.
		this.pageList = IntStream.rangeClosed(this.start, this.end).boxed().collect(Collectors.toList());
	}
	
	
	
	
	
}
