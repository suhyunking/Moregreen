package site.moregreen.basic.util.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;
import site.moregreen.basic.command.MemberDto;

@Slf4j
@Component
public class LoggerInterceptor extends HandlerInterceptorAdapter {

	//controller로 보내기 전 이벤트 작동(false - controller로 요청을 안함)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		MemberDto dto = (MemberDto) request.getSession().getAttribute("member");
		String s = request.getServletPath();
		log.info("============1==============" + dto);
		
		if(dto == null && !(s.contains("admin"))){
			log.info("===========2===============" + dto);
			response.sendRedirect(request.getServletContext().getContextPath() + "/member/memberLogin");
		}
		
		if(dto != null) {
			if(!(dto.getM_id().equals("admin")) && s.contains("admin")) {
				//response.sendRedirect(request.getServletContext().getContextPath() + "/admin/adminSignin");
				log.info("===========3===============" + dto);
				RequestDispatcher dispatcher= request.getRequestDispatcher("/admin/adminSignin");
				dispatcher.forward(request, response);
			}
		}else if(dto == null){
			log.info("===========4===============" + dto);
			response.sendRedirect(request.getServletContext().getContextPath() + "/admin/adminSignin");

		}
		
		return true;
	}
	
//	//controller 처리 이후 이벤트 작동
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//		log.info("================================ postHandler END ================================");
//	}
//	
//	//view 처리 이후 이벤트 작동
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//		log.info("================================ END ================================");
//	}
}