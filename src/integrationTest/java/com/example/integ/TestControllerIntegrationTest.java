package com.example.integ;

import io.restassured.RestAssured;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
public class TestControllerIntegrationTest {

  @Test
  public void integrationTest() {
    RestAssured.given().when().get("http://localhost:8091/hello")
        .then().statusCode(200);
  }
}
