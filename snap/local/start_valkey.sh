#!/usr/bin/env bash

# Raise resource limits before dropping privileges. We are still root here, so
# these limits are inherited by the snap_daemon process via setpriv.

# Max number of open file descriptors. Valkey needs maxclients (default 10000)
# plus ~32 reserved FDs, or it silently lowers maxclients at startup.
max_open_files="$(ulimit -n)"
if [ "${max_open_files}" != "unlimited" ] && [ "${max_open_files}" -lt 10032 ]; then
    ulimit -n 10032
fi

# Max number of processes/threads for the user. Valkey forks a child for every
# background save (RDB/AOF rewrite) and spawns background I/O threads.
max_procs="$(ulimit -u)"
if [ "${max_procs}" != "unlimited" ] && [ "${max_procs}" -lt 4096 ]; then
    ulimit -u 4096
fi

# For security measures, daemons should not be run as sudo. Execute valkey as the non-sudo user: snap-daemon.
exec "${SNAP}"/usr/bin/setpriv \
    --clear-groups \
    --reuid snap_daemon \
    --regid snap_daemon \
    -- \
    "${SNAP}"/usr/bin/valkey-server \
    "${SNAP_DATA}"/etc/valkey/valkey.conf \
    --daemonize no
