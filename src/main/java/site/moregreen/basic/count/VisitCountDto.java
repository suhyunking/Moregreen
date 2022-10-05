package site.moregreen.basic.count;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class VisitCountDto {

	private int visit_id;
	private int visit_cnt;
	private int visit_date;
}
