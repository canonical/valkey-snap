# Valkey Snap
[![Publish artifacts](https://github.com/canonical/valkey-artifacts/actions/workflows/publish.yaml/badge.svg)](https://github.com/canonical/valkey-artifacts/actions/workflows/publish.yaml)

This directory contains the packaging metadata for creating a snap of Valkey. The standard variant includes the full suite of Valkey tools: server, CLI, benchmark, sentinel, and file-check utilities.
For more information on snaps, visit [snapcraft.io](https://snapcraft.io/).

## Installing the Snap
The snap can be installed directly from the Snap Store. Follow the link below for more information.
<br>

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/valkey)

```bash
sudo snap install valkey --edge
```

## Interaction with the snap
By default, the snap installs with all services disabled. Start the
valkey-server explicitly, then connect to it via cli:

```bash
sudo snap start valkey.server
valkey.cli
127.0.0.1:6379> ping
PONG
```

In addition to `server` and `cli`, this variant also provides `benchmark`,
`check-aof`, `check-rdb` and `sentinel` apps. `sentinel` runs as a daemon
and likewise needs to be started explicitly:

```bash
sudo snap start valkey.sentinel
```

Other available commands can be found here: `snap info valkey`

## Building the Snap
### Clone Repository
```bash
git clone git@github.com:canonical/valkey-artifacts.git
cd valkey-artifacts/valkey/snaps/standard
```
### Installing and Configuring Prerequisites
```bash
sudo snap install snapcraft --classic
sudo snap install lxd
sudo lxd init --auto
```
### Packing and Installing the Snap
```bash
snapcraft pack
sudo snap install ./valkey*.snap --dangerous
```

Use `--dangerous` to skip signature verification for a locally built snap.
`--devmode` is also acceptable while iterating, and additionally relaxes
confinement so you don't need to connect interfaces manually — but it
disables confinement checks entirely, so don't use it to validate the final
`strict` confinement behaviour.

## Testing the Snap
This variant ships a [spread](https://github.com/canonical/spread) suite
covering the `smoke` and `sentinel` apps, run against a real `craft` (LXD)
backend on `ubuntu-26.04`:

```bash
snapcraft test
```

## License
The Valkey Snap is free software, distributed under the Apache
Software License, version 2.0. See
[LICENSE](https://github.com/canonical/valkey-artifacts/blob/main/LICENSE)
for more information.
