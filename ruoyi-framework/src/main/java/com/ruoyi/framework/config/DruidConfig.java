package com.ruoyi.framework.config;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.sql.DataSource;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import com.alibaba.druid.spring.boot.autoconfigure.properties.DruidStatProperties;
import com.alibaba.druid.util.Utils;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.config.properties.DruidProperties;
import com.ruoyi.framework.datasource.DynamicDataSource;

/**
 * druid 配置多数据源
 * 
 * @author ruoyi
 */
@Configuration
public class DruidConfig
{

    /**
     * 主库
     * @param druidProperties
     * @return
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.master")
    public DataSource masterDataSource(DruidProperties druidProperties)
    {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    /**
     * ITManage rbac_db库
     * @param druidProperties
     * @return
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.slave1")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.slave1", name = "enabled", havingValue = "true")
    public DataSource manageDataSource(DruidProperties druidProperties)
    {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    /**
     * MGU查询库
     * @param druidProperties
     * @return
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.slave2")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.slave2", name = "enabled", havingValue = "true")
    public DataSource mguQueryDataSource(DruidProperties druidProperties)
    {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    /**
     * 预约库
     * @param druidProperties
     * @return
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.slave3")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.slave3", name = "enabled", havingValue = "true")
    public DataSource appointmentDataSource(DruidProperties druidProperties)
    {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    /**
     * APP/Wechat库
     * @param druidProperties
     * @return
     * ConditionalOnProperty注解 控制自动配置是否生效
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.slave4")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.slave4", name = "enabled", havingValue = "true")
    public DataSource wechatDataSource(DruidProperties druidProperties)
    {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    /**
     * IPMI库
     * @param druidProperties
     * @return
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.slave5")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.slave5", name = "enabled", havingValue = "true")
    public DataSource ipmiDataSource(DruidProperties druidProperties)
    {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    /**
     * MGU查询库--Web
     * @param druidProperties
     * @return
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.slave6")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.slave6", name = "enabled", havingValue = "true")
    public DataSource mymshDataSource(DruidProperties druidProperties)
    {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    /**
     * MyMshMGU
     * @param druidProperties
     * @return
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.slave7")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.slave7", name = "enabled", havingValue = "true")
    public DataSource mymshMguDataSource(DruidProperties druidProperties)
    {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }


    @Bean(name = "dynamicDataSource")
    @Primary
    public DynamicDataSource dataSource(DataSource masterDataSource)
    {
        Map<Object, Object> targetDataSources = new HashMap<>();
        //主数据库
        targetDataSources.put(DataSourceType.MASTER.name(), masterDataSource);
        //ITManage rbac_db库
        setDataSource(targetDataSources, DataSourceType.MANAGE.name(), "manageDataSource");
        //MGU查询库
        setDataSource(targetDataSources, DataSourceType.MGUQUERY.name(), "mguQueryDataSource");
        //预约库
        setDataSource(targetDataSources, DataSourceType.APPOINTMENT.name(), "appointmentDataSource");
        //APP/Wechat库
        setDataSource(targetDataSources, DataSourceType.WECHAT.name(), "wechatDataSource");
        //IPMI库
        setDataSource(targetDataSources, DataSourceType.IPMI.name(), "ipmiDataSource");
        //MGU查询库--Web
        setDataSource(targetDataSources, DataSourceType.MYMSH.name(), "mymshDataSource");
        //MyMshMGU
        setDataSource(targetDataSources, DataSourceType.MYMSHMGU.name(), "mymshMguDataSource");
        return new DynamicDataSource(masterDataSource, targetDataSources);
    }

    /**
     * 设置数据源
     * 
     * @param targetDataSources 备选数据源集合
     * @param sourceName 数据源名称
     * @param beanName bean名称
     */
    public void setDataSource(Map<Object, Object> targetDataSources, String sourceName, String beanName)
    {
        try
        {
            DataSource dataSource = SpringUtils.getBean(beanName);
            targetDataSources.put(sourceName, dataSource);
        }
        catch (Exception e)
        {
        }
    }

    /**
     * 去除监控页面底部的广告
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @Bean
    @ConditionalOnProperty(name = "spring.datasource.druid.statViewServlet.enabled", havingValue = "true")
    public FilterRegistrationBean removeDruidFilterRegistrationBean(DruidStatProperties properties)
    {
        // 获取web监控页面的参数
        DruidStatProperties.StatViewServlet config = properties.getStatViewServlet();
        // 提取common.js的配置路径
        String pattern = config.getUrlPattern() != null ? config.getUrlPattern() : "/druid/*";
        String commonJsPattern = pattern.replaceAll("\\*", "js/common.js");
        final String filePath = "support/http/resources/js/common.js";
        // 创建filter进行过滤
        Filter filter = new Filter()
        {
            @Override
            public void init(javax.servlet.FilterConfig filterConfig) throws ServletException
            {
            }

            @Override
            public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
                    throws IOException, ServletException
            {
                chain.doFilter(request, response);
                // 重置缓冲区，响应头不会被重置
                response.resetBuffer();
                // 获取common.js
                String text = Utils.readFromResource(filePath);
                // 正则替换banner, 除去底部的广告信息
                text = text.replaceAll("<a.*?banner\"></a><br/>", "");
                text = text.replaceAll("powered.*?shrek.wang</a>", "");
                response.getWriter().write(text);
            }

            @Override
            public void destroy()
            {
            }
        };
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(filter);
        registrationBean.addUrlPatterns(commonJsPattern);
        return registrationBean;
    }
}
