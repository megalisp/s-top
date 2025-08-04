#!/bin/bash

set -ouex pipefail

### Install packages

# Set up environment for non-interactive installs
ENV DNF5_ASSUME_ALWAYS_YES=true
ENV DNF5_DISABLE_REPO_EXCLUDES=all

# Install system and GUI packages
RUN set -ouex pipefail && \
  dnf5 install -y \
    openbox greetd tuigreet gtkgreet \
    xdg-utils xdg-user-dirs \
    xorg-x11-server-Xorg xorg-x11-xinit \
    xorg-x11-drv-evdev xorg-x11-drv-libinput xorg-x11-drv-vesa xorg-x11-drv-vmware \
    xsecurelock xdotool xload xclip xclock xterm xset xsetroot xmodmap xrandr \
    x11vnc dejavu-sans-fonts \
    pipewire pipewire-pulseaudio wireplumber pavucontrol \
    picom arandr thunar tumbler \
    mpv playerctl rofi feh \
    network-manager-applet \
    input-leap kde-connect \
    python3-streamlink yt-dlp \
    cef chromium \
    git dnf5-plugins \
    --skip-unavailable

# Add GitHub CLI repo
RUN dnf5 config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo && \
    dnf5 install -y gh --repo gh-cli

# Add Microsoft VS Code repo and install
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
    tee /etc/yum.repos.d/vscode.repo > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
autorefresh=1
type=rpm-md
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

RUN dnf5 install -y code --repo code

# Cleanup (optional)
RUN dnf5 clean all

## breaks I think, with white screen
# sudo systemctl enable greetd
