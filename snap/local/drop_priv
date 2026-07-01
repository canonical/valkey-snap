#!/usr/bin/env bash
# Wrapper script for charmed valkey to be run with restricted privileges

pushd "${SNAP}" > /dev/null

if [[ $(id -u) == "0" ]]; then
    exec "${SNAP}"/usr/bin/setpriv \
        --clear-groups \
        --reuid snap_daemon \
        --regid snap_daemon \
        -- \
        "${SNAP}/bin/$@"
else
    exec "${SNAP}/bin/$@"
fi

popd > /dev/null