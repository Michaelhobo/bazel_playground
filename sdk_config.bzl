def _impl(settings, attr):
    _ignore = (settings, attr)
    return {"//:sdk_config": ""} # some user-defined value...

sdk_config_transition = transition(
    implementation = _impl,
    inputs = [],
    outputs = ["//:sdk_config"],
)
