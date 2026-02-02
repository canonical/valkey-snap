#!/usr/bin/env bash

# For security measures, daemons should not be run as sudo. Execute etcd as the non-sudo user: snap-daemon.
exec "${SNAP}"/usr/bin/setpriv --clear-groups --reuid snap_daemon --regid snap_daemon -- "${SNAP}"/usr/bin/valkey-server --dir "${SNAP_COMMON}"/var/lib/valkey
