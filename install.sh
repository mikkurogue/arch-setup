#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo pacman -Syu --noconfirm

# Install required packages from the official repositories
echo "Installing packages from the official repositories..."
sudo pacman -S --needed wine mesa lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader \
  xf86-video-amdgpu wine-staging giflib lib32-giflib gnutls lib32-gnutls \
  v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins \
  alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite lib32-libxcomposite \
  ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs \
  lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2 \
  libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau libva-vdpau-driver \
  lib32-libva-vdpau-driver vulkan-radeon lib32-vulkan-radeon fuse2 

echo "Installing user apps"
sudo pacman -S --no-confirm discord lutris neovim spectacle sqlitebrowser nodejs npm github-cli zsh lazygit tmux fastfetch xclip

echo "Installing steam (requires user input)"
sudo pacman -S --no-confirm steam

# Install Git and base-devel packages for AUR installation
echo "Installing Git and base-devel for AUR helpers..."
sudo pacman -S --needed git base-devel

# Clone and build the yay AUR helper
echo "Cloning and building yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Cleanup
echo "Cleaning up..."
cd ..
rm -rf yay

# install yay packages
yay -S --no-confirm ghostty-git radeon-profile-git zsh-autosuggestions zsh-syntax-highlighting zig

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install cargo and rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installation complete!"

