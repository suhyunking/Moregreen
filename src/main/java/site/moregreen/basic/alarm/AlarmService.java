package site.moregreen.basic.alarm;

import java.util.List;

import site.moregreen.basic.command.AlarmDto;

public interface AlarmService {

	public int saveAlarm(AlarmDto dto);				//알람 저장
		
	public List<AlarmDto> retrieveAlarmList(); 		//알람 목록 가져오기
	public void removeAlarm(AlarmDto dto); 			//선택한 알림 삭제
	public void removeAlarmByFNum(AlarmDto dto); 	//선택한 알림을 펀딩 번호를 전달받아 삭제
}
