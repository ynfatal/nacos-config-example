package com.example.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 参考官方 WIKI https://github.com/alibaba/spring-cloud-alibaba/wiki/Nacos-config
 * @author Fatal
 * @date 2020/6/18
 */
@RestController
@RefreshScope
// 默认查找配置文件的规则后面做笔记，根据官网和alibaba文档。有默认规则的，除了这个默认文件之外你还可以添加额外的配置文件
// 文件名结果可以参考控制台，搜：c.a.nacos.client.config.impl.CacheData
public class NacosConfigController {

    @Value("${user.id}")
    private Integer id;

    @Value("${user.name}")
    private String name;

    @Value("${user.age}")
    private Integer age;

    @Value("${user.birthday}")
    private String birthday;

    @Value("${user.weight}")
    private Integer weight;

    @Value("${user.hobby}")
    private String hobby;

    @GetMapping("/nacos/config")
    public String read() {
        return "id: " + id + ", name: " + name + ", age: " + age + ", birthday: " + birthday + ", weight: " + weight + ", hobby: " + hobby;
    }
}
