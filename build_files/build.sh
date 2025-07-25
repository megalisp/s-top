#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y openbox lxdm xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drv-evdev xorg-x11-drv-libinput xorg-x11-drv-vesa xorg-x11-drv-vmware xterm dejavu-sans-fonts pipewire pipewire-pulseaudio wireplumber pavucontrol --skip-unavailable
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

## breaks I think, with white screen
# sudo systemctl enable lxdm
