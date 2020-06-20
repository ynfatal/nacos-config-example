package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 分布式配置中心
 */
@SpringBootApplication
@RestController
public class NacosConfigExampleApplication {

    public static void main(String[] args) {
        SpringApplication.run(NacosConfigExampleApplication.class, args);
    }

    /**
     * 测试 pom.xml 不选择继承，而是选择 import pom 类型的依赖
     * @return
     */
    @GetMapping("/")
    public String hello() {
        return "hello, Fatal;";
    }

}
