#!/bin/bash

# 手动安装
#
#   有道云笔记
#   Clion
#   VSCode
#
#   adobe reader
#     sudo apt install flatpak
#     flatpak remote-delete --force flathub
#     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#     flatpak install flathub com.adobe.Reade
#   or  
#     sudo snap install acrordrdc #有问题，安装以后打开方式里找不到该应用，需要手动建立*.desktop
#
#   LunarG Vulkan SDK
#     https://vulkan.lunarg.com/sdk/home

packages="\
  synaptic \
  git gitk
  vim vim-scripts exuberant-ctags
  tree
  calc
  meld
  gparted
  nautilus-dropbox
  unrar
  gnome-shell-extensions gnome-shell-extension-manager
  virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso virtualbox-guest-x11
  manpages manpages-dev manpages-posix manpages-posix-dev
  make cmake cmake-qt-gui meson ninja-build autoconf automake
  gcc g++ gdb gcc-i686-linux-gnu
  linux-tools-common linux-tools-generic linux-tools-`uname -r`
  openssh-client openssh-server
  locales symlinks cgpt linux-firmware ubuntu-minimal net-tools rsync
  python3 python3-pip python-is-python3 python3-libxml2
  libtool flex bison gawk binfmt-support texinfo autopoint gperf intltool xfonts-utils xsltproc x11-xkb-utils
  libdrm-dev libunwind-dev zlib1g-dev libelf-dev libncurses-dev libssl-dev xutils-dev libglib2.0-dev libltdl-dev
  mesa-utils mesa-common-dev libopengl-dev libgl1-mesa-dev libgles-dev libgles1 libgles2-mesa-dev libegl-dev libegl1-mesa-dev libglu1-mesa libgdm-dev libglvnd-core-dev libvulkan-dev opencl-headers libglfw3 libglfw3-dev libsdl2-dev freeglut3-dev xorg-dev
  libassimp-dev libfreetype-dev libxmu-dev libsimdjson-dev libgltf-dev
  glmark2-x11 glmark2-es2-x11
  libjack-dev libpipewire-0.3-dev
  "
sudo apt install $packages
