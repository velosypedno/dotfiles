#!/usr/bin/env bash

set -euo pipefail

CHEZMOI_PATH="${HOME}/.local/share/chezmoi"

PACMAN_PACKAGES_FILE="${CHEZMOI_PATH}/pacman_pkgs.txt"
YAY_PACKAGES_FILE="${CHEZMOI_PATH}/yay_pkgs.txt"
FLATPACK_PACKAGES_FILE="${CHEZMOI_PATH}/flatpack_pkgs.txt"

install_pacman_pkgs() {
    if [[ -f "${PACMAN_PACKAGES_FILE}" ]]; then
        echo "==> Installing official pacman packages..."
        sudo pacman -Sy --needed --noconfirm - < "${PACMAN_PACKAGES_FILE}"
    else
        echo "==> File ${PACMAN_PACKAGES_FILE} not found. Skipping pacman installation."
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
    fi
}

install_yay_pkgs() {
    if [[ -f "${YAY_PACKAGES_FILE}" ]]; then
        echo "==> Installing AUR packages..."
        ensure_yay
        yay -S --needed --noconfirm - < "${YAY_PACKAGES_FILE}"
    else
        echo "==> File ${YAY_PACKAGES_FILE} not found. Skipping AUR installation."
    fi
}

install_flatpack_pkgs() {
    if [[ -f "${FLATPACK_PACKAGES_FILE}" ]]; then
        echo "==> Installing Flatpak packages..."
        if ! command -v flatpak &> /dev/null; then
            echo "==> Flatpak is not installed. Installing flatpak package..."
            sudo pacman -S --needed --noconfirm flatpak
        fi

        if [[ -s "${FLATPACK_PACKAGES_FILE}" ]]; then
            xargs -a "${FLATPACK_PACKAGES_FILE}" flatpak install -y --noninteractive
        fi
    else
        echo "==> File ${FLATPACK_PACKAGES_FILE} not found. Skipping Flatpak installation."
    fi
}

main() {
    install_pacman_pkgs
    install_yay_pkgs
    install_flatpack_pkgs
    echo "==> All package installations completed successfully!"
}

main "$@"
