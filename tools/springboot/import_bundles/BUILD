#
# Copyright (c) 2017-9, salesforce.com, inc.
# All rights reserved.
# Licensed under the BSD 3-Clause license.
# For full license text, see LICENSE.txt file in the repo root  or https://opensource.org/licenses/BSD-3-Clause
#

# List of standard imports bundles that tend to be used together in Spring Boot.
# Please create/curate new bundles and contribute back to the community. Thanks!


java_import(
    name = 'springboot_required_deps',
    jars = [],
    exports = [
            "@javax_servlet_javax_servlet_api//jar",
            "@org_springframework_spring_aop//jar",
            "@org_springframework_spring_beans//jar",
            "@org_springframework_spring_context//jar",
            "@org_springframework_spring_core//jar",
            "@org_springframework_spring_expression//jar",
            "@org_springframework_spring_web//jar",
            "@org_springframework_boot_spring_boot_actuator//jar",
            "@org_springframework_boot_spring_boot_actuator_autoconfigure//jar",
            "@org_springframework_boot_spring_boot//jar",
            "@org_springframework_boot_spring_boot_autoconfigure//jar",
            "@org_springframework_boot_spring_boot_loader//jar",
            "@org_springframework_boot_spring_boot_starter//jar",
            "@org_springframework_boot_spring_boot_starter_logging//jar",
            "@javax_annotation_javax_annotation_api//jar",
    ],
    visibility = ["//visibility:public"],
)

java_import(
    name = 'springboot_jetty_starter_deps',
    jars = [],
    exports = [
            "@org_springframework_boot_spring_boot_starter_jetty//jar",
            "@org_eclipse_jetty_jetty_http//jar",
            "@org_eclipse_jetty_jetty_io//jar",
            "@org_eclipse_jetty_jetty_security//jar",
            "@org_eclipse_jetty_jetty_server//jar",
            "@org_eclipse_jetty_jetty_servlet//jar",
            "@org_eclipse_jetty_jetty_util//jar",
            "@org_eclipse_jetty_jetty_webapp//jar",
    ],
    visibility = ["//visibility:public"],
)

java_import(
    name = 'springboot_web_starter_deps',
    jars = [],
    exports = [
            ":springboot_logging_deps",
            ":springboot_jackson_deps",
            "@org_springframework_boot_spring_boot_starter_web//jar",
            "@org_springframework_spring_web//jar",
            "@org_springframework_spring_webmvc//jar",
            "@org_eclipse_jetty_jetty_server//jar",
            "@org_eclipse_jetty_jetty_servlet//jar",
            "@org_eclipse_jetty_jetty_util//jar",
            "@org_eclipse_jetty_jetty_webapp//jar",
    ],
    visibility = ["//visibility:public"],
)

java_import(
    name = 'springboot_logging_deps',
    jars = [],
    exports = [
            "@ch_qos_logback_logback_classic//jar",
            "@ch_qos_logback_logback_core//jar",
            "@commons_logging_commons_logging//jar",
            "@org_slf4j_slf4j_api//jar",
            "@org_apache_logging_log4j_log4j_to_slf4j//jar",
            "@org_apache_logging_log4j_log4j_api//jar",
            "@org_slf4j_jul_to_slf4j//jar",
            "@org_jboss_logging_jboss_logging//jar",
            "@com_fasterxml_classmate//jar",
    ],
    visibility = ["//visibility:public"],
)

java_import(
    name = 'springboot_jackson_deps',
    jars = [],
    exports = [
            "@com_fasterxml_jackson_core_jackson_databind//jar",
            "@com_fasterxml_jackson_core_jackson_annotations//jar",
            "@com_fasterxml_jackson_core_jackson_core//jar",
            "@com_fasterxml_jackson_datatype_jackson_datatype_jdk8//jar",
            "@com_fasterxml_jackson_datatype_jackson_datatype_jsr310//jar",
            "@com_fasterxml_jackson_module_jackson_module_parameter_names//jar",
    ],
    visibility = ["//visibility:public"],
)
