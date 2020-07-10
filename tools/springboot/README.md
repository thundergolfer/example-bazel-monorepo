## SpringBoot Rule

This implements a Bazel rule for packaging a Spring Boot application as an executable jar file.
The output of this rule is a jar file that can be copied to production environments and run.

## How to Use:

### Create your BUILD file

This is a *BUILD* file code snippet of how to invoke the rule:

```
# load our Spring Boot rule
load("//tools/springboot:springboot.bzl", "springboot",)

# create our deps list for Spring Boot, we have some convenience targets for this
springboot_deps = [
  "//tools/springboot/import_bundles:springboot_required_deps",
  "//tools/springboot/import_bundles:springboot_jetty_starter_deps",
  "//tools/springboot/import_bundles:springboot_web_starter_deps",
]

# this Java library contains your service code
java_library(
    name = 'helloworld_lib',
    srcs = glob(["src/main/java/**/*.java"]),
    resources = glob(["src/main/resources/**"]),
    deps = springboot_deps,
)

# use the springboot rule to build the app as a Spring Boot executable jar
springboot(
    name = "helloworld",
    boot_app_class = "com.sample.SampleMain",
    java_library = ":helloworld_lib",
    deps = springboot_deps,
)
```

The *springboot* rule properties are as follows:

-  name:    name of your application; the convention is to use the same name as the enclosing folder (i.e. the Bazel package name)
-  boot_app_class:  the classname (java package+type) of the @SpringBootApplication class in your app
-  java_library: the library containing your service code
-  deps:  list of jar file dependencies to add (these get packages as *BOOT-INF/lib* inside the executable jar)

### Convenience Import Bundles

The [//tools/springboot/import_bundles](import_bundles) package contains some useful bundles of imports.
There are bundles for the Spring Boot framework, as well as bundles for the various starters.

Since Spring Boot apps all need similar groups of dependencies, prefer to create/curate those import bundles if a
  dependency is coming as a transitive for a Spring Boot class.

### Manage External Dependencies in your WORKSPACE

This repository has an example [WORKSPACE](../../external_deps.bzl) file that lists necessary and some optional Spring Boot dependencies.
These will come from a Nexus/Artifactory repository, or Maven Central.
Because the version of each dependency needs to be explicitly defined, it is left for you to review and add to your *WORKSPACE* file.

## Build and Run

After installing the rule into your workspace at *tools/springboot*, you are ready to build.
Add the rule invocation to your Spring Boot application *BUILD* file as shown above.
You will then need to follow an iterative process, adding external dependencies to your *BUILD* and *WORKSPACE* files until it builds and runs.

The build will run and create an executable jar file in the *bazel-bin* directory.
Find it in the output directories, and then run it:

```
bazel run //samples/helloworld
```

In production environments, you will likely not have Bazel installed nor the Bazel workspace files.
This is the primary use case for the executable jar file.
Run the jar file locally using *java* like so:

```
java -jar bazel-bin/samples/helloworld/helloworld.jar
```

The executable jar file is ready to be copied to your production environment.

## Debugging

If the environment variable `DEBUG_SPRINGBOOT_RULE` is set, the rule writes debug output to `$TMPDIR/bazel/debug/springboot`. If `$TMPDIR` is not defined, it defaults to `/tmp`.

In order to pass this environment variable to Bazel, use the `--action_env` argument:

```
bazel build //... --action_env=DEBUG_SPRINGBOOT_RULE=1
```

## In Depth

To understand how this rule works, start by reading the [springboot.bzl file](springboot.bzl).

### Build Stamping of the Spring Boot jar

Spring Boot has a nice feature that can display Git coordinates for your built service in the
  [/actuator/info](https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-features.html#production-ready-endpoints) webadmin endpoint.
If you are interested in this feature, it is supported by this *springboot* rule.
However, to avoid breaking Bazel remote caching, we generally have this feature disabled for most builds.
See the [//tools/buildstamp](../buildstamp) package for more details.

### Duplicate Classes Detection

We find that Spring Boot jars aggregate a great number of dependency jars, many from outside our Bazel
  build (external Maven-built jars).
We have had cases where multiple jars brought in the same class, but at different versions.
These are difficult to diagnose.

There is a feature on the *springboot* rule that will fail the build if duplicate classes are detected:

```
# use the springboot rule to build the app as a Spring Boot executable jar
springboot(
    name = "helloworld",
    boot_app_class = "com.sample.SampleMain",
    java_library = ":helloworld_lib",
    deps = springboot_deps,
    fail_on_duplicate_classes = True,
)
```

It will fail the build if:
- the same class (package + classname) is found in more than one jar
- the MD5 hash of the classfile bytes differ
