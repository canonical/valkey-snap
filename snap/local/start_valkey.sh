#!/usr/bin/env bash

# For security measures, daemons should not be run as sudo. Execute valkey as the non-sudo user: snap-daemon.
exec "${SNAP}"/usr/bin/setpriv --clear-groups --reuid snap_daemon --regid snap_daemon -- "${SNAP}"/usr/bin/valkey-server "${SNAP_DATA}"/etc/charmed-valkey/valkey.conf
