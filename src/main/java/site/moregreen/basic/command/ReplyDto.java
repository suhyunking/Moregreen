package site.moregreen.basic.command;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReplyDto {

	private Integer r_num;			//댓글 번호 PK
	private String r_regdate;		//댓글 최초 등록일
	private String r_moddate;		//댓글 수정일
	private String r_writer;		//댓글 작성자
	private String r_content;		//댓글 내용
	private Integer funding_f_num;	//펀딩 번호 FK
	
}
