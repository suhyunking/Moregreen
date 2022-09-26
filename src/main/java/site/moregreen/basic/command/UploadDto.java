package site.moregreen.basic.command;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UploadDto {

	private Integer i_num; //pk
	private String filename;
	private String filepath;
	private String uuid;
	private Integer filetype;
	private Integer f_num; //fk
	private Integer i_type; 
}
