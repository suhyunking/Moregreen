package site.moregreen.basic.alarm;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import site.moregreen.basic.command.AlarmDto;

@Mapper
public interface AlarmMapper {

	public void saveAlarm(AlarmDto dto); 			//알람 저장
	
	public List<AlarmDto> selectAlarmList();		//알람 목록 조회
	public void deleteAlarm(AlarmDto dto); 			//선택한 알림 삭제
	public void deleteAlarmByFNum(AlarmDto dto); 	//선택한 알림을 펀딩 번호를 전달받아 삭제
	
}
