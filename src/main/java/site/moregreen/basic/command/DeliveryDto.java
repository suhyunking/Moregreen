package site.moregreen.basic.command;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DeliveryDto {
	
	private Integer d_num;			//배송 번호
	private String d_name;			//이름
	private String d_phone;		//전화번호
	private Integer d_zipcode;		//우편번호
	private String d_addr;			//주소
	private String d_detailaddr;	//상세주소
	
}