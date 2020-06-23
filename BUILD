load("//:sdk_config.bzl", "sdk_config_transition")
load("@bazel_skylib//rules:common_settings.bzl", "string_flag")

cc_library(
    name = "default_config",
    hdrs = ["sdk_config.h"],
    visibility = ["//visibility:public"],
)

label_flag(
    name = "sdk_config",
    build_setting_default = ":default_config",
    visibility = ["//visibility:public"],
)

string_flag(
    name = "sdk_config_dir",
    build_setting_default = "",
)

cc_binary(
    name = "bin",
    srcs = ["bin.cc"],
    deps = [":lib"],
)

cc_library(
    name = "lib",
    hdrs = ["lib.h"],
    includes = ["a"], # Why does replacing "a" with ":sdk_config_dir not work?
    deps = [":sdk_config"],
    visibility = ["//visibility:public"],
)
