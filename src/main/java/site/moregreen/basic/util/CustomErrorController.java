package site.moregreen.basic.util;


import org.apache.tomcat.util.http.fileupload.impl.SizeLimitExceededException;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class CustomErrorController implements ErrorController {
    private String VIEW_PATH = "/errors/";

    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handle404(NoHandlerFoundException e){
    return VIEW_PATH + "404";
    }
    
    // 데이터베이스오류
 	@ExceptionHandler(DataAccessException.class)
 	public String handleDataAccessException(DataAccessException e) {
 		e.printStackTrace();
 		return VIEW_PATH + "dbError";
 	}
 	
 	// 500에러처리
 	@ExceptionHandler(Exception.class)
 	public String handleException(Exception e) {
 		e.printStackTrace();
 		return VIEW_PATH + "500";
 	}
 	
 	// 파일 사이즈 초과 에러 처리
 	@ExceptionHandler(MaxUploadSizeExceededException.class)
 	public String handleUploadSizeException(MaxUploadSizeExceededException e) {
 		e.printStackTrace();
 		return VIEW_PATH + "fileSizeError";
 	}	
    
 	// 파일 사이즈 초과 에러 처리
 	@ExceptionHandler(SizeLimitExceededException.class)
 	public String fileSizeException(SizeLimitExceededException e) {
 		e.printStackTrace();
 		return VIEW_PATH + "fileSizeError";
 	}	
 	
 	

//    @Override
//    public String getErrorPath() {
//        return null;
//    }
}
