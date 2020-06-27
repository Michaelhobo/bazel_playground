load("@bazel_gazelle//:def.bzl", "gazelle")
load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("@bazel_skylib//rules:common_settings.bzl", "string_flag")
load("@io_bazel_rules_go//go:def.bzl", "go_path")

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
    includes = ["a"],  # Why does replacing "a" with ":sdk_config_dir not work?
    visibility = ["//visibility:public"],
    deps = [":sdk_config"],
)

gazelle(
    name = "gazelle",
    extra_args = [
        "--build_file_name=BUILD",
    ],
    prefix = "github.com/Michaelhobo/bazel_playground",
)

go_path(
    name = "gopath",
    mode = "link",
    deps = [
        "//tools:buildgen",
    ],
)
