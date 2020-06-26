load("@rules_cc//cc:defs.bzl", "cc_library")
load("//:sdk_config.bzl", "nrf52_cc_binary")

nrf52_cc_binary(
    name = "bin",
    srcs = ["bin.cc"],
    sdk_config = ":sdk_config",
    deps = ["//:lib"],
)

cc_library(
    name = "sdk_config",
    hdrs = ["sdk_config.h"],
)
