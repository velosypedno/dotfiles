#!/usr/bin/env bash

set -euo pipefail

CHEZMOI_PATH="${HOME}/.local/share/chezmoi"

PACMAN_PACKAGES_FILENAME="pacman_pkgs.txt"
YAY_PACKAGES_FILENAME="yay_pkgs.txt"
FLATPACK_PACKAGES_FILENAME="flatpack_pkgs.txt"

dump_pacman_pkgs() {
    echo "==> Dumping explicitly installed pacman packages..."
    pacman -Qqent > "${CHEZMOI_PATH}/${PACMAN_PACKAGES_FILENAME}"
    # Ensure yay is present in the main package list if installed via official repos
    echo "yay" >> "${CHEZMOI_PATH}/${PACMAN_PACKAGES_FILENAME}"
}

dump_yay_pkgs() {
    echo "==> Dumping AUR packages..."
    # Filter out yay from the AUR list to avoid duplicates
    pacman -Qqmt | grep -v '^yay$' > "${CHEZMOI_PATH}/${YAY_PACKAGES_FILENAME}" || true
}

dump_flatpack_pkgs() {
    echo "==> Dumping Flatpak applications..."
    # Skip the "Application ID" header using tail -n +1
    flatpak list --app --columns=application | tail -n +1 > "${CHEZMOI_PATH}/${FLATPACK_PACKAGES_FILENAME}"
}

main() {
    mkdir -p "${CHEZMOI_PATH}"
    dump_pacman_pkgs
    dump_yay_pkgs
    dump_flatpack_pkgs
    echo "==> Package dumping completed successfully!"
}

main "$@"
