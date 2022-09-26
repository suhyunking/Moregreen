package site.moregreen.basic.command;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MailDto {
	private String toAddress;
	private String title;
	private String message;
	private String fromAddress;
}
