package site.moregreen.demo;

import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.funding.FundingMapper;

@SpringBootTest(classes = FundingMapper.class)
class MoregreenApplicationTests {
	
	@Autowired
	FundingMapper fundingMapper;
	
	@Test
	@Disabled
	void test01() {
		
		/*
		 * // f_status가 3 인 펀딩 목록 조회 List<FundingDto> list =
		 * fundingMapper.selectFundingListStatus3();
		 * 
		 * for(FundingDto dto : list) { System.out.println(dto.getF_enddate()); }
		 */
	}

}
