#!/bin/bash

set -ouex pipefail


set -ouex pipefail && \
  dnf5 install -y \
    openbox greetd tuigreet gtkgreet arandr picom rofi \
    xdg-utils xdg-user-dirs \
    xorg-x11-server-Xorg xorg-x11-xinit \
    xorg-x11-drv-evdev xorg-x11-drv-libinput xorg-x11-drv-vesa xorg-x11-drv-vmware \
    xsecurelock xdotool xload xclip xclock xkill xterm xset xsetroot xmodmap xrandr \
    pipewire pipewire-pulseaudio wireplumber \
    network-manager-applet \
    --skip-unavailable

dnf5 clean all

## Doesn't actually start
## Think it's a conf or perm issue.
# sudo systemctl enable greetd
