package com.ruoyi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  木有枝·编程技术分享系统启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                " ____  _             \n" +
                "|  _ \\| |            \n" +
                "| |_) | | ___   __ _ \n" +
                "|  _ <| |/ _ \\ / _` |\n" +
                "| |_) | | (_) | (_| |\n" +
                "|____/|_|\\___/ \\__, |\n" +
                "                __/ |\n" +
                "               |___/ \n. ");
    }
}
