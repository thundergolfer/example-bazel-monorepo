# The One True ~~Morty~~ Monorepo [![Build Status](https://badge.buildkite.com/aa36b75077a5c69156bc143b32c8c2db04c4b20b8706b8a99b.svg)](https://buildkite.com/thundergolfer-inc/the-one-true-bazel-monorepo)

> *Note:* Currently supporting the latest Bazel version as at late September 2019, [0.29.1](https://github.com/bazelbuild/bazel/releases/tag/0.29.1) 

Example Bazel-ified monorepo, supporting *Golang*, *Java*, *Scala* + *Python*. 

I use this project to explore how Bazel works with different languages and
developer tools, and keep a record of best-practices I've learnt. So it is a work in progress.
Others can use it to check out the Bazel way of doing things and use parts
as a reference implementation.

Rather than the typical To-Do list, this project's code uses the contrived scenario of a fruit shop. 🍌🍎 🍍 🍑 🍓

## Getting Started

**Prerequisites:**
 
- [Install Bazel](https://docs.bazel.build/versions/master/install.html) (Should be >= `0.29.1`)
- Python 3.7

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

There's Golang code in [`/cli`](/cli). It implements a simple CLI for building Smoothies. 🍹

##### Dependency Management

Third-party dependencies are managed in [`3rdparty/go_workspace.bzl`](/3rdparty/go_workspace.bzl).  

### *Java* Support

There's Java code contained in [`/store/layoutsolver`](/store/layoutsolver) and [`/storage`](/storage).

##### Dependency Management

Its third-party dependencies are managed by [`rules_jvm_external`](https://blog.bazel.build/2019/03/31/rules-jvm-external-maven.html) in the [`WORKSPACE`](/WORKSPACE) (See the `# JAVA SUPPORT` section).


### *Scala* Support

There's Scala code contained in [`scala-fruit-sorting`](/scala-fruit-sorting).

##### Dependency Management

Its third-party dependencies are managed
by [`johnynek/bazel-deps`](https://github.com/johnynek/bazel-deps). The usage of that tool is wrapped up in a script
as [`tools/update_jvm_dependencies.sh`](tools/update_jvm_dependencies.sh).

To use it, you update [`tools/dependencies/jvm_dependencies.yaml`](tools/dependencies/jvm_dependencies.yaml) and then run the script.


### *Python* Support

There's Python code in the [`/fruit_sorting`](/fruit_sorting) package.

Bazel has native support for Python, but [`bazelbuild/rules_python`](https://github.com/bazelbuild/rules_python)
is used to for third-party `pip` packaging.

##### Dependency Management

> ⚠️ **Note:** [`rules_python`](https://github.com/bazelbuild/rules_python) is currently designated as "ALPHA" software. The UX of managing third-party dependencies is pretty bad. This project currently uses the non-official `rules_pygen` for third-party stuff. Here be 🐉s.

In order to add new third-party packages for Python, add them to [`tools/dependencies/python_requirements.txt`](/tools/dependencies/python_requirements.txt)
and run [`./tools/build/regenerate_python_deps.sh`](./tools/build/regenerate_python_deps.sh).

## Development

### Continuous Integration (CI)

This repository's CI is managed by [Buildkite](https://buildkite.com), the CI platform used by Pinterest and Canva to manage Bazel monorepos,
as well as being [used by the Bazel open-source project itself](https://buildkite.com/bazel).

