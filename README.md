# Example Bazel Monorepo [![Build Status](https://badge.buildkite.com/aa36b75077a5c69156bc143b32c8c2db04c4b20b8706b8a99b.svg?branch=master)](https://buildkite.com/thundergolfer-inc/the-one-true-bazel-monorepo)

> *Note:* Currently supporting the latest Bazel version as at mid December 2019, [2.0.0](https://github.com/bazelbuild/bazel/releases/tag/2.0.0) 

Example Bazel-ified monorepo, supporting *Golang*, *Java*, *Python*, *Scala*, and *Typescript*

I use this project to explore how Bazel works with different languages and
developer tools, and keep a record of best-practices I've learnt. So it is a work in progress.
Others can use it to check out the Bazel way of doing things and use parts
as a reference implementation.

Rather than the typical To-Do list, this project's code uses the contrived scenario of a book shop. 📗📕📒📚

## Getting Started

**Prerequisites:**
 
- [Install Bazel](https://docs.bazel.build/versions/master/install.html) (Currently supporting ~= `2.0.0`)
- Python 3.6+

Bazel aims to be 'build anything, anywhere' system, so building and testing should be as simple as `bazel test //...`.  

## Why use a Monorepo?

The following few articles together provide a good overview of the
motivations behind maintaining a Monorepo. For heaps more information,
[korfuri/awesome-monorepo](https://github.com/korfuri/awesome-monorepo)
is a good place to go. 

* [*Why Google Stores Billions of Lines in a Single
  Repository*](http://delivery.acm.org/10.1145/2860000/2854146/p78-potvin.pdf?ip=60.240.50.147&id=2854146&acc=OA&key=4D4702B0C3E38B35%2E4D4702B0C3E38B35%2E4D4702B0C3E38B35%2E5945DC2EABF3343C&__acm__=1558760299_19ae56a814d1fe05de26b4844a658e52)
* [*Monorepos, please
  do!*](https://medium.com/@adamhjk/monorepo-please-do-3657e08a4b70), by
Adam Jacob, former CTO of [Chef](https://www.chef.io/)
* [*Advantages of Monorepos*](https://danluu.com/monorepo/), by Dan Luu

## Project Structure

### *Golang* Support

There's Golang code in [`/cli`](/cli). It implements a simple CLI for the common 'Blind Date With a 📖' product.

##### Dependency Management

Third-party dependencies are managed in [`3rdparty/go_workspace.bzl`](/3rdparty/go_workspace.bzl).  

### *Java* Support

There's a [Spring Boot](https://spring.io/projects/spring-boot) (with PostGres) application in [`/store-api`](/store-api) and some other Java code in [`/store/layoutsolver`](/store/layoutsolver).

##### Dependency Management

Its third-party dependencies are managed by [`rules_jvm_external`](https://blog.bazel.build/2019/03/31/rules-jvm-external-maven.html) in the [`WORKSPACE`](/WORKSPACE) (See the `# JAVA SUPPORT` section).

### *Ruby* Support

> ⚠️ **Note:** [`rules_ruby`](https://github.com/bazelruby/rules_ruby) is, as of January 2020, actively developed but not yet production ready.

There's Ruby code contained in [`ruby`](/ruby).

##### Dependency Management

Third-party Ruby dependencies are managed by `rules_ruby`, which accepts a `Gemfile`, located at [`tools/dependencies/Gemfile`](tools/dependencies/Gemfile).

A way to easily update (and re-lock) the `Gemfile` is *coming soon*.


### *Scala* Support

There's Scala code contained in [`scala-book-sorting`](/scala-book-sorting).

##### Dependency Management

Its third-party dependencies are managed
by [`johnynek/bazel-deps`](https://github.com/johnynek/bazel-deps). The usage of that tool is wrapped up in a script
as [`tools/update_jvm_dependencies.sh`](tools/update_jvm_dependencies.sh).

To use it, you update [`tools/dependencies/jvm_dependencies.yaml`](tools/dependencies/jvm_dependencies.yaml) and then run the script.


### *Python* Support

There's Python code in the [`/book_sorting`](/book_sorting] and [`/scraping`](/scraping).

[`bazelbuild/rules_python`](https://github.com/bazelbuild/rules_python) is used to for the core `py_*` rules.

##### Dependency Management

> ⚠️ **Note:** [`rules_python`](https://github.com/bazelbuild/rules_python) is currently designated as "ALPHA" software. The UX of managing third-party dependencies is pretty bad.
> For managing third-party dependencies this project uses https://github.com/dillon-giacoppo/rules_python_external, which I'd recommend you try.

In order to add new third-party packages for Python, add them to [`tools/dependencies/python_requirements.txt`](/tools/dependencies/python_requirements.txt).

##### Gradual Type-Checking (MyPy)

[thundergolfer/bazel-mypy-integration](https://github.com/thundergolfer/bazel-mypy-integration) is used to check any type annotations at `bazel build` time.

## Development

### Continuous Integration (CI)

This repository's CI is managed by [Buildkite](https://buildkite.com), the CI platform used by Pinterest and Canva to manage Bazel monorepos,
as well as being [used by the Bazel open-source project itself](https://buildkite.com/bazel).

### Linting

[`./tools/linting/lint.sh`](tools/linting/lint.sh) will lint all source-code in the repo _and_ all Bazel files.

