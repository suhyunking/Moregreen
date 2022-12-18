package site.moregreen.basic.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.moregreen.basic.command.AlarmDto;


@Service("alarmService")
@Transactional(readOnly = true)
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	AlarmMapper alarmMapper;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int saveAlarm(AlarmDto dto) {
		alarmMapper.saveAlarm(dto);
		
		return 1;
	}

	@Override
	public List<AlarmDto> retrieveAlarmList() {
		return alarmMapper.selectAlarmList();
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void removeAlarm(AlarmDto dto) {
		alarmMapper.deleteAlarm(dto);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void removeAlarmByFNum(AlarmDto dto) {
		alarmMapper.deleteAlarmByFNum(dto);
	}



}
