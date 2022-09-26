package site.moregreen.basic.command;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LikeDto {

	private Integer l_num;		//찜번호
	private Integer m_num;		//멤버 번호
	private Integer f_num;		//펀딩 번호
	private Integer heart;		//좋아요 개수
	private Integer l_check;	//좋아요 중복검사
}
