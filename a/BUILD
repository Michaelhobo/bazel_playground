load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("//:sdk_config.bzl", "do_transition")

cc_binary(
    name = "bin",
    srcs = ["bin.cc"],
    deps = ["//:lib"],
)

do_transition(
    name = "configured_bin",
    dep = ":bin",
    # sdk_config = ":sdk_config",
)

cc_library(
    name = "sdk_config",
    hdrs = ["sdk_config.h"],
)
