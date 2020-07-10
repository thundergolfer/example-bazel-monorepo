# Do not edit. bazel-deps autogenerates this file from ./tools/dependencies/jvm_dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "com.google.code.findbugs:jsr305:1.3.9", "lang": "java", "sha1": "40719ea6961c0cb6afaeb6a921eaa1f6afd4cfdf", "sha256": "905721a0eea90a81534abb7ee6ef4ea2e5e645fa1def0a5cd88402df1b46c9ed", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/1.3.9/jsr305-1.3.9.jar", "name": "com_google_code_findbugs_jsr305", "actual": "@com_google_code_findbugs_jsr305//jar", "bind": "jar/com/google/code/findbugs/jsr305"},
    {"artifact": "com.google.errorprone:error_prone_annotations:2.0.18", "lang": "java", "sha1": "5f65affce1684999e2f4024983835efc3504012e", "sha256": "cb4cfad870bf563a07199f3ebea5763f0dec440fcda0b318640b1feaa788656b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.0.18/error_prone_annotations-2.0.18.jar", "source": {"sha1": "220c1232fa6d13b427c10ccc1243a87f5f501d31", "sha256": "dbe7b49dd0584704d5c306b4ac7273556353ea3c0c6c3e50adeeca8df47047be", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.0.18/error_prone_annotations-2.0.18-sources.jar"} , "name": "com_google_errorprone_error_prone_annotations", "actual": "@com_google_errorprone_error_prone_annotations//jar", "bind": "jar/com/google/errorprone/error_prone_annotations"},
    {"artifact": "com.google.guava:guava:23.0", "lang": "java", "sha1": "c947004bb13d18182be60077ade044099e4f26f1", "sha256": "7baa80df284117e5b945b19b98d367a85ea7b7801bd358ff657946c3bd1b6596", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava/23.0/guava-23.0.jar", "source": {"sha1": "ed233607c5c11e1a13a3fd760033ed5d9fe525c2", "sha256": "37fe8ba804fb3898c3c8f0cbac319cc9daa58400e5f0226a380ac94fb2c3ca14", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava/23.0/guava-23.0-sources.jar"} , "name": "com_google_guava_guava", "actual": "@com_google_guava_guava//jar", "bind": "jar/com/google/guava/guava"},
    {"artifact": "com.google.j2objc:j2objc-annotations:1.1", "lang": "java", "sha1": "ed28ded51a8b1c6b112568def5f4b455e6809019", "sha256": "2994a7eb78f2710bd3d3bfb639b2c94e219cedac0d4d084d516e78c16dddecf6", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar", "source": {"sha1": "1efdf5b737b02f9b72ebdec4f72c37ec411302ff", "sha256": "2cd9022a77151d0b574887635cdfcdf3b78155b602abc89d7f8e62aba55cfb4f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1-sources.jar"} , "name": "com_google_j2objc_j2objc_annotations", "actual": "@com_google_j2objc_j2objc_annotations//jar", "bind": "jar/com/google/j2objc/j2objc_annotations"},
    {"artifact": "org.codehaus.mojo:animal-sniffer-annotations:1.14", "lang": "java", "sha1": "775b7e22fb10026eed3f86e8dc556dfafe35f2d5", "sha256": "2068320bd6bad744c3673ab048f67e30bef8f518996fa380033556600669905d", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14.jar", "source": {"sha1": "886474da3f761d39fcbb723d97ecc5089e731f42", "sha256": "d821ae1f706db2c1b9c88d4b7b0746b01039dac63762745ef3fe5579967dd16b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14-sources.jar"} , "name": "org_codehaus_mojo_animal_sniffer_annotations", "actual": "@org_codehaus_mojo_animal_sniffer_annotations//jar", "bind": "jar/org/codehaus/mojo/animal_sniffer_annotations"},
    {"artifact": "org.scala-lang.modules:scala-xml_2.12:1.0.6", "lang": "java", "sha1": "e22de3366a698a9f744106fb6dda4335838cf6a7", "sha256": "7cc3b6ceb56e879cb977e8e043f4bfe2e062f78795efd7efa09f85003cb3230a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.0.6/scala-xml_2.12-1.0.6.jar", "source": {"sha1": "429925530fb0f9a6fb26e5160532b7b3426557c0", "sha256": "a7e8aac79394df396afda98b35537791809d815ce15ab2224f7d31e50c753922", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.0.6/scala-xml_2.12-1.0.6-sources.jar"} , "name": "org_scala_lang_modules_scala_xml_2_12", "actual": "@org_scala_lang_modules_scala_xml_2_12//jar", "bind": "jar/org/scala_lang/modules/scala_xml_2_12"},
    {"artifact": "org.scalactic:scalactic_2.12:3.0.5", "lang": "scala", "sha1": "edec43902cdc7c753001501e0d8c2de78394fb03", "sha256": "57e25b4fd969b1758fe042595112c874dfea99dca5cc48eebe07ac38772a0c41", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalactic/scalactic_2.12/3.0.5/scalactic_2.12-3.0.5.jar", "source": {"sha1": "e02d37e95ba74c95aa9063b9114db51f2810b212", "sha256": "0455eaecaa2b8ce0be537120c2ccd407c4606cbe53e63cb6a7fc8b31b5b65461", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalactic/scalactic_2.12/3.0.5/scalactic_2.12-3.0.5-sources.jar"} , "name": "org_scalactic_scalactic_2_12", "actual": "@org_scalactic_scalactic_2_12//jar:file", "bind": "jar/org/scalactic/scalactic_2_12"},
    {"artifact": "org.scalatest:scalatest_2.12:3.0.5", "lang": "scala", "sha1": "7bb56c0f7a3c60c465e36c6b8022a95b883d7434", "sha256": "b416b5bcef6720da469a8d8a5726e457fc2d1cd5d316e1bc283aa75a2ae005e5", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest_2.12/3.0.5/scalatest_2.12-3.0.5.jar", "source": {"sha1": "ec414035204524d3d4205ef572075e34a2078c78", "sha256": "22081ee83810098adc9af4d84d05dd5891d7c0e15f9095bcdaf4ac7a228b92df", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest_2.12/3.0.5/scalatest_2.12-3.0.5-sources.jar"} , "name": "org_scalatest_scalatest_2_12", "actual": "@org_scalatest_scalatest_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_2_12"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
