package site.moregreen.basic.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import site.moregreen.basic.util.interceptor.MenuHandler;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Bean
	public MenuHandler menuHandler() {
		return new MenuHandler();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		//메뉴 고정하는 부분
		registry.addInterceptor( menuHandler() )
				.addPathPatterns("/**");
		
	}
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
        		.addResourceHandler("/upload/**")
        		.addResourceLocations("file:/upload/");
        
        //404 에러
        registry
                .addResourceHandler( "/img/**")
                .addResourceLocations("classpath:/static/img/");

        registry
		        .addResourceHandler( "/fonts/**")
		        .addResourceLocations("classpath:/static/fonts/");

        registry
        		.addResourceHandler( "/scss/**")
        		.addResourceLocations("classpath:/static/scss/");

        registry
                .addResourceHandler("/css/**")
                .addResourceLocations("classpath:/static/css/");
        
        registry
        		.addResourceHandler("/js/**")
        		.addResourceLocations("classpath:/static/js/");
    }
	
}
