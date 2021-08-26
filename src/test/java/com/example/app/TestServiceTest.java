package com.example.app;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class TestServiceTest {

  @Autowired
  TestService testService;

  @Test
  public void unitTest() {
    TestModel actual = testService.process();
    Assertions.assertThat(actual.getResp()).isEqualTo(new TestModel("world").getResp());
  }
}
