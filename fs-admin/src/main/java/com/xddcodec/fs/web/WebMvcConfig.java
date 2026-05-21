package com.xddcodec.fs.web;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.stp.StpUtil;
import com.xddcodec.fs.framework.security.properties.SecurityProperties;
import com.xddcodec.fs.interceptor.PreviewInterceptor;
import com.xddcodec.fs.interceptor.StoragePlatformInterceptor;
import com.xddcodec.fs.interceptor.WorkspaceInterceptor;
import com.xddcodec.fs.storage.plugin.local.config.LocalStorageProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Web 配置
 *
 * @Date: 2026/4/18 13:53
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private SecurityProperties securityProperties;

    @Autowired
    private StoragePlatformInterceptor storagePlatformInterceptor;

    @Autowired
    private PreviewInterceptor previewInterceptor;

    @Autowired
    private WorkspaceInterceptor workspaceInterceptor;

    @Autowired
    private LocalStorageProperties storageProperties;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String baseUrl = storageProperties.getBaseUrl();
        // 提取最后一个 / 之后的内容
        String prefix = baseUrl.substring(baseUrl.lastIndexOf("/") + 1);

        registry.addResourceHandler("/" + prefix + "/**")
                .addResourceLocations("file:" + storageProperties.getBasePath() + "/");
    }
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true)
                .maxAge(3600);
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 工作空间上下文拦截器（最先执行，设置WorkspaceContext供Sa-Token权限校验使用）
        registry.addInterceptor(workspaceInterceptor)
                .addPathPatterns("/apis/**")
                .order(1);

        // Sa-Token 登录校验 + @SaCheckPermission权限校验拦截器
        // 此时WorkspaceContext已设置，StpInterfaceImpl可正确获取权限
        registry.addInterceptor(new SaInterceptor(handle -> StpUtil.checkLogin()))
                .addPathPatterns(securityProperties.getPathPattern())
                .excludePathPatterns(securityProperties.getExcludes())
                .order(2);

        //注册存储平台切换拦截器
        registry.addInterceptor(storagePlatformInterceptor)
                .addPathPatterns(securityProperties.getPathPattern())
                .excludePathPatterns(securityProperties.getExcludes())
                .order(3);

        //注册文件预览防盗链拦截器
        registry.addInterceptor(previewInterceptor)
                .addPathPatterns("/preview/**", "/archive/preview/**", "/api/file/stream/preview/archive/inner/**")
                .excludePathPatterns("/preview/token/**", "/preview/error", "/archive/preview/token/**")
                .order(4);
    }
}
