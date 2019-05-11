# The One True ~~Morty~~ Monorepo

Example Bazel-ified monorepo, supporting Java, Scala + Python. 

I use this project to explore how Bazel works with different languages and
developer tools, and keep a record of best-practices I've learnt.
Others can use it to check out the Bazel way of doing things and use parts
as a reference implementation.

The project's code uses the contrived scenario of a fruit shop rather than the typical To-Do list.

## Project Structure

### Java Support

There's Java code contained in [`/storage`](/storage). Its third-party dependencies are managed
by [`rules_jvm_external`](https://blog.bazel.build/2019/03/31/rules-jvm-external-maven.html) in the [`WORKSPACE`](/WORKSPACE) (See the `# JAVA SUPPORT` section).


### Scala Support

There's Scala code contained in [`scala-fruit-sorting`](/scala-fruit-sorting). Its third-party dependencies are managed
by [`johnynek/bazel-deps`](https://github.com/johnynek/bazel-deps).



### Python Support

There's Python code in the [`/fruit_sorting`](/fruit_sorting) package. 
Bazel has native support for Python, but [`bazelbuild/rules_python`](https://github.com/bazelbuild/rules_python)
is used to for third-party `pip` packaging.
