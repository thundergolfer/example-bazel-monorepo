## Import Bundles for Spring Boot Starters

This is a scheme for providing convenience bundles of dependencies for each
  open source Spring Boot starter.
The intent of this package is to provide rule users with a single dep target for each
  Spring Boot starter you include, and one dep target for the base Spring Boot framework.

In the following example, our dep list for the application includes the Spring Boot framework
  and two starters:

```
springboot_deps = [
  "//tools/springboot/import_bundles:springboot_required_deps",
  "//tools/springboot/import_bundles:springboot_jetty_starter_deps",
  "//tools/springboot/import_bundles:springboot_web_starter_deps",
]
```

### Open Source Starters

There are about 50 open source starters supported by the Spring Boot team, and others in the wild
  supported by other teams.

- [Official Starters](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-project/spring-boot-starters)

At this time, only a few starters are populated in the package.
It is an open work item to improve that situation.

### Improving this Feature

For reasons explained in the issue linked below, internally at Salesforce this is not a complex problem.
We have some constraints that eliminate much of the complexity.
Solving this correctly in the public open source repository will take some effort.

Review the details in this issue:

- [Implement a stronger dependency bundling system for Spring Boot starters](https://github.com/salesforce/bazel-springboot-rule/issues/4)
