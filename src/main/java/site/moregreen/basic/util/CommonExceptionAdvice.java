//package site.moregreen.basic.util;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.ResponseStatus;
//import org.springframework.web.servlet.NoHandlerFoundException;
//
//import lombok.extern.slf4j.Slf4j;
//
//@ControllerAdvice
//@Slf4j
//public class CommonExceptionAdvice {
//
//	@ExceptionHandler(Exception.class)
//	public String except(Exception e, Model model) {
//		log.error("Except");
//		model.addAttribute("exception", e);
//		return "funding/errorPage";
//	}
//	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	@ResponseStatus(HttpStatus.NOT_FOUND)
//	public String handle404(NoHandlerFoundException e){
//	return "funding/404";
//	}
//	
//}
