package site.moregreen.basic.command;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AlarmDto {

	private Integer a_num;				//알람 번호
	private String a_message;			//멤버 번호
	private String funding_f_num;		//펀딩 번호
}
