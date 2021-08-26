# Chargebee Checkout V4

A micro-service to provide middle-ware and server support for Hosted Pages entity, minimizing the dependencies on
Chargebee monolith app.

![version-badge](https://img.shields.io/badge/version-0.0.7&#8208;DEV-yellowgreen.svg?style=flat-square)
[![Build with Gradle](https://github.com/chargebee/cb-hp-service/actions/workflows/gradle-build.yml/badge.svg)](https://github.com/chargebee/cb-hp-service/actions/workflows/gradle-build.yml)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=chargebee_cb-hp-service&metric=coverage&token=bf1a5121eaf926d89f2d42f438bba93c8b9dfd21)](https://sonarcloud.io/dashboard?id=chargebee_cb-hp-service)


API Specs are available [here](specs/api). Postman collection available [here](assets/postman).

## Requirements for local setup

* An IAM at Chargebee AWS (```cb-auth```), with membership to ```cb-artifactory-read-access``` group.
  > Access provided by ```devops@chargebee.com```.
* Set up the [cb-platform-artifactory-cli](https://github.com/chargebee/cb-platform-artifactory-cli) and run the CLI to
  generate tokens for pulling cb-platform-artifactory dependencies.

## Stack

- Spring Boot
- OpenAPI v3
- openapi-generator
- JaCoco
- CheckStyle
- StopBugs

## Setup

### Repositories

Repository | Branch
--- | --- 
chargebee-app | [feature/hp_v4](https://github.com/chargebee/chargebee-app/tree/feature/hp_v4)
cb-hp-service | [dev](https://github.com/chargebee/cb-hp-service/tree/dev)
cb-hp-ui | [checkout_app](https://github.com/chargebee/cb-hp-ui/tree/checkout_app)

### Build

- Verify requirements for local setup are completed.
- Run ```./gradlew build``` to build.
- Run ```./gradlew bootRun``` to run the service in local.

## Interesting Reads

- [Problem Statement & Vision](https://mychargebee.atlassian.net/wiki/spaces/CHECKOUT/pages/1759707828/Next+Gen+Checkout)
- [Initial iterations and analysis](https://www.notion.so/chargebeedesign/Next-Generation-Checkout-51fe5ff63cab4f43b4ab6609340f8314)
