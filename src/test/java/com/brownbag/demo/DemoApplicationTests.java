package com.brownbag.demo;

import com.brownbag.demo.util.MathUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

@SpringBootTest
class DemoApplicationTests {

    @Test
    void shouldSumCorrectly() {
        assertEquals(5, MathUtil.sum(2, 3));
    }

    @Test
    void shouldSumIncorrectly() {
        assertNotEquals(6, MathUtil.sum(5, 4));
    }

}
