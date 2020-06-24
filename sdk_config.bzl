""" This configures the nrf52 sdk_config.h as a transition.
"""

def _impl(settings, attr):
    _ignore = settings
    return {"//:sdk_config": "//a:sdk_config"}  # some user-defined value...

sdk_config_transition = transition(
    implementation = _impl,
    inputs = [],
    outputs = ["//:sdk_config"],
)

def _do_transition(ctx):
    return [ctx.attr.dep[0][DefaultInfo]]

do_transition = rule(
    implementation = _do_transition,
    attrs = {
        "dep": attr.label(cfg = sdk_config_transition),
        # "sdk_config": attr.label(),
        "_whitelist_function_transition": attr.label(
            default = "@bazel_tools//tools/whitelists/function_transition_whitelist",
        ),
    },
)
