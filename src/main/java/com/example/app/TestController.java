package com.example.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

  private final TestService testService;
  private final PrintService printService;

  @Autowired
  public TestController(TestService testService, PrintService printService) {
    this.testService = testService;
    this.printService = printService;
  }

  @GetMapping(value = "/hello", produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<TestModel> hello() {
    printService.print();
    return ResponseEntity.ok(testService.process());
  }
}
