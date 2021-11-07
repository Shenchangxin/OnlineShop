package com.shenchangxin.store;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.mybatis.spring.annotation.MapperScan;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2
@MapperScan("com.shenchangxin.store.dao")
public class StoreApplication {




    public static void main(String[] args) {
        SpringApplication.run(StoreApplication.class, args);
    }

}
