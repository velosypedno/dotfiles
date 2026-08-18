#!/usr/bin/env bash

set -euo pipefail

CHEZMOI_PATH="${HOME}/.local/share/chezmoi"

PACMAN_PACKAGES_FILE="${CHEZMOI_PATH}/pacman_pkgs.txt"
YAY_PACKAGES_FILE="${CHEZMOI_PATH}/yay_pkgs.txt"
FLATPACK_PACKAGES_FILE="${CHEZMOI_PATH}/flatpack_pkgs.txt"

install_pacman_pkgs() {
    if [[ -f "${PACMAN_PACKAGES_FILE}" && -s "${PACMAN_PACKAGES_FILE}" ]]; then
        echo "==> Installing official pacman packages..."
        grep -v '^\s*#' "${PACMAN_PACKAGES_FILE}" | grep -v '^\s*$' | \
            sudo pacman -Syu --needed --noconfirm -
    else
        echo "==> File ${PACMAN_PACKAGES_FILE} is missing or empty. Skipping pacman installation."
    fi
}

ensure_yay() {
    if ! command -v yay &> /dev/null; then
        echo "==> yay binary not found. Bootstrapping yay from AUR..."
        sudo pacman -S --needed --noconfirm base-devel git

        BUILD_DIR=$(mktemp -d)

        git clone https://aur.archlinux.org/yay.git "${BUILD_DIR}/yay"
        (cd "${BUILD_DIR}/yay" && makepkg -si --noconfirm)

        rm -rf "${BUILD_DIR}"
        echo "==> yay successfully bootstrapped!"
    fi
}

install_yay_pkgs() {
    if [[ -f "${YAY_PACKAGES_FILE}" && -s "${YAY_PACKAGES_FILE}" ]]; then
        echo "==> Installing AUR packages..."
        ensure_yay
        grep -v '^\s*#' "${YAY_PACKAGES_FILE}" | grep -v '^\s*$' | \
            yay -S --needed --noconfirm -
    else
        echo "==> File ${YAY_PACKAGES_FILE} is missing or empty. Skipping AUR installation."
    fi
}

install_flatpack_pkgs() {
    if [[ -f "${FLATPACK_PACKAGES_FILE}" && -s "${FLATPACK_PACKAGES_FILE}" ]]; then
        echo "==> Installing Flatpak packages..."
        if ! command -v flatpak &> /dev/null; then
            echo "==> Flatpak is not installed. Installing flatpak package..."
            sudo pacman -S --needed --noconfirm flatpak
        fi

        grep -v '^\s*#' "${FLATPACK_PACKAGES_FILE}" | grep -v '^\s*$' | \
            xargs -r flatpak install -y --noninteractive
    else
        echo "==> File ${FLATPACK_PACKAGES_FILE} is missing or empty. Skipping Flatpak installation."
    fi
}

main() {
    echo "==> Starting unattended system restoration via chezmoi..."
    install_pacman_pkgs
    install_yay_pkgs
    install_flatpack_pkgs
    echo "==> All package installations completed successfully!"
}

main "$@"
