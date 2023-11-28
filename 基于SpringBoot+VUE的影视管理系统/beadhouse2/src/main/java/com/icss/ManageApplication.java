package com.icss;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author system
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class ManageApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(ManageApplication.class, args);
        System.out.println("          启动成功          \n" +
                "   ( ' )             _.         \n" +
                "  (_ o _)          _( )_ .         \n" +
                "   (_,_).'        (_ o _)'          \n" +
                "                   (_,_)'         \n"
        );
    }
}
