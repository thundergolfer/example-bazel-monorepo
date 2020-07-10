## `store-api`

A Java Spring Boot backend. 

### Setup

1. [Postgres](https://www.postgresql.org/download/) must be installed.
2. THe `bootstore_api` DB must be created.

### Usage

```
bazel run //store-api/src/main/java/com/book/store/api:deployable
```

Then try: http://localhost:8080/v1/

You should see: 

```
👋 Greetings from AntiLibrary! An online world of reading built with Bazel.
```
