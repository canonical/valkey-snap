# Charmed Valkey Snap
[![Release to Snap Store](https://github.com/canonical/charmed-valkey-snap/actions/workflows/release.yaml/badge.svg)](https://github.com/canonical/charmed-valkey-snap/actions/workflows/release.yaml)

This repository contains the packaging metadata for creating a snap of Valkey. 
For more information on snaps, visit [snapcraft.io](https://snapcraft.io/). 

## Installing the Snap
The snap can be installed directly from the Snap Store.  Follow the link below for more information.
<br>

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/charmed-valkey)

```bash
sudo snap install charmed-valkey --edge
```

## Interaction with the snap
By default, the snap will install and run the valkey-server. You can connect to the server via cli:

```bash
charmed-valkey.cli
127.0.0.1:6379> ping
PONG
```

Other available commands can be found here: `snap info charmed-valkey`

## Building the Snap
### Clone Repository
```bash
git clone git@github.com:canonical/charmed-valkey-snap.git
cd charmed-valkey-snap
```
### Installing and Configuring Prerequisites
```bash
sudo snap install snapcraft
sudo snap install lxd
sudo lxd init --auto
```
### Packing and Installing the Snap
```bash
snapcraft pack
sudo snap install ./charmed-valkey*.snap --devmode
```

## License
The Charmed Valkey Snap is free software, distributed under the Apache
Software License, version 2.0. See
[LICENSE](https://github.com/canonical/charmed-valkey-snap/blob/main/LICENSE)
for more information.