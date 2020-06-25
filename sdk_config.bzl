""" This configures the nrf52 sdk_config.h as a transition.
"""

def _impl(settings, attr):
    _ignore = settings
    print("_impl attr: {}".format(attr))
    return {"//:sdk_config": attr.sdk_config}

sdk_config_transition = transition(
    implementation = _impl,
    inputs = [],
    outputs = ["//:sdk_config"],
)

def _do_transition(ctx):
    print("_do_transition ctx.attr: {}".format(ctx.attr))
    return [ctx.attr.bin[0][CcInfo]]

do_transition = rule(
    implementation = _do_transition,
    attrs = {
        "bin": attr.label(
            cfg = sdk_config_transition,
            executable = True,
        ),
        "sdk_config": attr.label(),
        "_whitelist_function_transition": attr.label(
            default = "@bazel_tools//tools/whitelists/function_transition_whitelist",
        ),
    },
)
