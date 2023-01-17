package com.brownbag.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
public class DemoController {

    @GetMapping("/demo")
    public String demo() {
        return "Demo String";
    }

    @GetMapping("/")
    public String hello() {
        return "Hello World 2";
    }

    @GetMapping("/test")
    public String test() {
        return "This is a test string";
    }

}
