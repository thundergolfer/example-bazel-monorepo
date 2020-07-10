"""
Invoke with bazel build //... --aspects //tools/build/monorepo_size:stats.bzl%file_count_aspect
"""

FileCountInfo = provider(
    fields = {
        "count": "number of files",
    },
)

def _file_count_aspect_impl(target, ctx):
    count = 0

    # Make sure the rule has a srcs attribute.
    if hasattr(ctx.rule.attr, "srcs"):
        # Iterate through the sources counting files
        for src in ctx.rule.attr.srcs:
            for f in src.files.to_list():
                if ctx.attr.extension == "*" or ctx.attr.extension == f.extension:
                    count = count + 1

    # Get the counts from our dependencies.
    if not hasattr(ctx.rule.attr, "deps"):
        print("{} count: {}".format(ctx.rule, count))
        return []
    for dep in ctx.rule.attr.deps:
        count = count + dep[FileCountInfo].count
    print("{} count: {}".format(ctx.rule, count))
    return [FileCountInfo(count = count)]

file_count_aspect = aspect(
    implementation = _file_count_aspect_impl,
    attr_aspects = ["deps"],
    attrs = {
        "extension": attr.string(default = "*", values = ["*"]),
    },
)
