<h1 align="center">Example Bazel Monorepo</h1>
<p align="center">
    <a href="https://buildkite.com/thundergolfer-inc/the-one-true-bazel-monorepo">
        <img src="https://badge.buildkite.com/aa36b75077a5c69156bc143b32c8c2db04c4b20b8706b8a99b.svg?branch=master">
    </a>
</p>

----

> *Note:* Currently supporting the latest Bazel version as at mid June 2021, [4.1.0](https://github.com/bazelbuild/bazel/releases/tag/4.1.0) 

Example Bazel-ified monorepo, supporting *Golang*, *Java*, *Python*, *Scala*, and *Typescript*. 

Cloud Infrastructure-as-Code is done using _Terraform_.

I use this project to explore how Bazel works with different languages and
developer tools, and keep a record of best-practices I've learnt. So it is a work in progress.
Others can use it to check out the Bazel way of doing things and use parts
as a reference implementation.

Rather than the typical To-Do list, this project's code uses the contrived scenario of a book shop and reading catalogue website called *Antilibrary*. 📗📕📒📚

## Getting Started

#### Prerequisites:
 
- [**Install Bazel**](https://docs.bazel.build/versions/master/install.html) (Currently supporting ~= `4.x.x`)
- **Python 2 or 3**. Should only be required to [do some bootstrapping under-the-hood](https://github.com/bazelbuild/bazel/issues/8446).
- [**`yarn`**](https://yarnpkg.com/) or [**`npm`**](https://www.npmjs.com/) for the NodeJS and Typescript code

Bazel aims to be 'build anything, anywhere' system, so building and testing should be as simple as `bazel test //...`. If it's not, please [create an issue](https://github.com/thundergolfer/example-bazel-monorepo/issues/new/choose). 

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
* [*Repo Style Wars: Mono vs. Multi*](https://gigamonkeys.com/mono-vs-multi/), by Peter Seibel
* [*Advantages of Monorepos*](https://danluu.com/monorepo/), by Dan Luu

### Related Projects

* [github.com/lucperkins/colossus](https://github.com/lucperkins/colossus) - A demo using Bazel in monorepo fashion. Compared with this project, it goes far deeper on microservice architecture components and Kubernetes, and is not focused on Bazel.
* [github.com/enginoid/monorepo-base](https://github.com/enginoid/monorepo-base) - Employs Bazel, gRPC, and Kubernetes like the above, and is similarly not as broad and deep on Bazel as this project.

## Project Structure

### *Golang* Support

There's Golang code in [`/cli`](/cli). It implements a simple CLI for the common 'Blind Date With a 📖' product.

##### Dependency Management

Third-party dependencies are managed in [`3rdparty/go_workspace.bzl`](/3rdparty/go_workspace.bzl).  

### *Java* Support

There's a [Spring Boot](https://spring.io/projects/spring-boot) (with PostGres) application in [`/store-api`](/store-api) and some other Java code in [`/store/layoutsolver`](/store/layoutsolver).

##### Dependency Management

Its third-party dependencies are managed by [`rules_jvm_external`](https://blog.bazel.build/2019/03/31/rules-jvm-external-maven.html) in the [`WORKSPACE`](/WORKSPACE) (See the `# JAVA SUPPORT` section).

### *Scala* Support

There's Scala code contained in [`scala-book-sorting`](/scala-book-sorting).

##### Dependency Management

Its third-party dependencies are managed
by [`johnynek/bazel-deps`](https://github.com/johnynek/bazel-deps). The usage of that tool is wrapped up in a script
as [`tools/update_jvm_dependencies.sh`](tools/update_jvm_dependencies.sh).

To use it, you update [`tools/dependencies/jvm_dependencies.yaml`](tools/dependencies/jvm_dependencies.yaml) and then run the script.


### *Python* Support

There's Python code in the [`/book_sorting`](/book_sorting) and [`/scraping`](/scraping).

[`bazelbuild/rules_python`](https://github.com/bazelbuild/rules_python) is used for the core `py_*` rules.

##### Dependency Management

In order to add new third-party packages for Python, add them to [`3rdparty/requirements.in`](/3rdparty/requirements.in) and run `bazel run //3rdparty:requirements.update`.

##### Gradual Type-Checking (MyPy)

[thundergolfer/bazel-mypy-integration](https://github.com/thundergolfer/bazel-mypy-integration) is used to check any type annotations at `bazel build` time.

### Infrastructure-as-Code (Hashicorp Terraform)

The [`infrastructure/`](/infrastructure) top-level folder contains Terraform defining various AWS resources and their configuration. 

----

## Development

### Build

`bazel build //...`

### Testing

`bazel test //...`

### Continuous Integration (CI)

This repository's CI is managed by [Buildkite](https://buildkite.com), the CI platform used by Pinterest and Canva to manage Bazel monorepos,
as well as being [used by the Bazel open-source project itself](https://buildkite.com/bazel).

### Deployment & Distribution

Deployable artifacts are pushed to S3 under commit-hash-versioned keys.
Currently only the `store-api` deploy/fat JAR is deployable.

[`graknlabs/bazel-distribution`](https://github.com/graknlabs/bazel-distribution) is used to publish Python packages to PyPi. 

### Build Observability + Analysis

This project is using [Buildbuddy.IO](https://buildbuddy.io/). Every build run locally or in CI get its own `https://app.buildbuddy.io/invocation/xyz123...` URL which analyses and records the build's information.

### Linting

[thundergolfer/bazel-linting-system](https://github.com/thundergolfer/bazel-linting-system) is used. [`./tools/linting/lint.sh`](tools/linting/lint.sh) will lint all source-code in the repo and [`./tools/linting/lint_bzl_files.sh`](tools/linting/lint_bzl_files.sh) will lint all Bazel files.

