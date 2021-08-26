package com.example.app;

import org.springframework.stereotype.Service;

@Service
public class TestService {

  public TestModel process() {
    return new TestModel("world");
  }
}
