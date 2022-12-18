package site.moregreen.basic.util.interceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
	
	@Autowired
	LoggerInterceptor loggerInterceptor;
	
	@Override
	public void addInterceptors (InterceptorRegistry registry) {
		registry.addInterceptor(loggerInterceptor)
				.addPathPatterns("/mypage/**")
				.addPathPatterns("/admin/**")
				.addPathPatterns("/funding/**")
				.excludePathPatterns("/assets/**")
				.excludePathPatterns("/funding/fundingDetail")
				.excludePathPatterns("/admin/adminSignin")
				.excludePathPatterns("/admin/adminForm")
				.excludePathPatterns("/funding/fundingList");
	}
}