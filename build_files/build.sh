#!/bin/bash

set -ouex pipefail

### Install packages
set -ouex pipefail && \
  dnf5 install -y \
    openbox greetd tuigreet gtkgreet \
    xdg-utils xdg-user-dirs \
    xorg-x11-server-Xorg xorg-x11-xinit \
    xorg-x11-drv-evdev xorg-x11-drv-libinput xorg-x11-drv-vesa xorg-x11-drv-vmware \
    xsecurelock xdotool xload xclip xclock xkill xterm xset xsetroot xmodmap xrandr \
    papirus-icon-theme google-noto-emoji-fonts google-nono-fonts-all dejavu-sans-fonts \
    google-roboto-fonts google-roboto-mono-fonts google-roboto-slab-fonts \
    gnome-keyring pipewire pipewire-pulseaudio wireplumber pavucontrol \
    qemu-kvm x11vnc obs-studio vlc ffmpeg sox \
    chatterino2 v4l-utils v4l2loopback \
    picom arandr thunar tumbler \
    mpv mpd playerctl rofi feh \
    network-manager-applet \
    input-leap kde-connect \
    python3-streamlink yt-dlp \
    cef chromium \
    chez-scheme \
    chibi-scheme \
    --skip-unavailable


dnf5 install -y git dnf5-plugins

export DNF5_ASSUME_ALWAYS_YES=true
export DNF5_DISABLE_REPO_EXCLUDES=all

dnf5 config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
dnf5 install -y gh --repo gh-cli

rpm --import https://packages.microsoft.com/keys/microsoft.asc
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
dnf5 install -y code --repo code

dnf5 clean all

## breaks I think, with white screen
# sudo systemctl enable greetd
