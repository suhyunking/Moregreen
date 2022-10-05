package site.moregreen.basic.count;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebListener
public class VisitCountListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
/*		VisitCountMapper visitCountMapper = new VisitCountMapper();
		
		int todayCount = 0;
		int yesterdayCount = 0;
		int totalCount = 0;
		
		try {
			visitCountMapper.setVisitTotalCount();
			todayCount = visitCountMapper.getVisitTodayCount();
			yesterdayCount = visitCountMapper.getVisitYesterdayCount();
			totalCount = visitCountMapper.getVisitTotalCount();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session = arg0.getSession();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		VisitCountService visitCountService = (VisitCountSerivce)wac.getBean("visitCountMapper");
		VisitCountDto dto = new VisitCountDto();
		dto.setVisit_ip(req.getRemoteAddr());
		visitCountDto.insertVisitor(dto);	*/	
	}
}
