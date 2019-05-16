# The One True ~~Morty~~ Monorepo [![Build Status](https://badge.buildkite.com/aa36b75077a5c69156bc143b32c8c2db04c4b20b8706b8a99b.svg)](https://buildkite.com/thundergolfer-inc/the-one-true-bazel-monorepo)

Example Bazel-ified monorepo, supporting Java, Scala + Python. 

I use this project to explore how Bazel works with different languages and
developer tools, and keep a record of best-practices I've learnt.
Others can use it to check out the Bazel way of doing things and use parts
as a reference implementation.

The project's code uses the contrived scenario of a fruit shop rather than the typical To-Do list.

## Getting Started

**Prerequisites:**
 
- [Install Bazel](https://docs.bazel.build/versions/master/install.html)
- Python 3.7

Bazel aims to be 'build anything, anywhere' system, so building and testing should be as simple as `bazel test //...`.  

## Project Structure

### Java Support

There's Java code contained in [`/storage`](/storage).
 
##### Dependency Management 
 
Its third-party dependencies are managed by [`rules_jvm_external`](https://blog.bazel.build/2019/03/31/rules-jvm-external-maven.html) in the [`WORKSPACE`](/WORKSPACE) (See the `# JAVA SUPPORT` section).


### Scala Support

There's Scala code contained in [`scala-fruit-sorting`](/scala-fruit-sorting).
 
##### Dependency Management

Its third-party dependencies are managed
by [`johnynek/bazel-deps`](https://github.com/johnynek/bazel-deps). The usage of that tool is wrapped up in a script
as [`tools/update_jvm_dependencies.sh`](tools/update_jvm_dependencies.sh). 

To use it, you update [`tools/dependencies/jvm_dependencies.yaml`](tools/dependencies/jvm_dependencies.yaml) and then run the script.  


### Python Support

There's Python code in the [`/fruit_sorting`](/fruit_sorting) package.
 
Bazel has native support for Python, but [`bazelbuild/rules_python`](https://github.com/bazelbuild/rules_python)
is used to for third-party `pip` packaging.

##### Dependency Management

> ⚠️ **Note:** [`rules_python`](https://github.com/bazelbuild/rules_python) is currently designated as "ALPHA" software. The UX of managing third-party dependencies is pretty bad.  

In order to add new third-party packages for Python, add them to [`tools/dependencies/python_requirements.txt`](/tools/dependencies/python_requirements.txt).

## Development

### Continuous Integration (CI)

This repository's CI is managed by [Buildkite](https://buildkite.com), the CI platform used by Pinterest and Canva to build Bazel monorepos, 
as well as being used by the Bazel open-source project itself.  

