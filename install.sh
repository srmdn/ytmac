#!/usr/bin/env bash
set -euo pipefail

echo "dlmac installer"
echo "==============="
echo ""

if [[ "$(uname)" != "Darwin" ]]; then
  echo "Error: dlmac is macOS only."
  exit 1
fi

if ! command -v brew &>/dev/null; then
  echo "Error: Homebrew not found."
  echo "Install it from: https://brew.sh"
  echo ""
  echo "Then run: brew install yt-dlp ffmpeg"
  exit 1
fi

missing=()

if ! command -v yt-dlp &>/dev/null; then
  missing+=("yt-dlp")
fi

if ! command -v ffmpeg &>/dev/null; then
  missing+=("ffmpeg")
fi

if [[ ${#missing[@]} -gt 0 ]]; then
  echo "Missing dependencies: ${missing[*]}"
  echo ""
  echo "Install with:"
  echo "  brew install ${missing[*]}"
  echo ""
  read -rp "Install now? [y/N] " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    brew install "${missing[@]}"
  else
    echo "Install manually and re-run install.sh."
    exit 1
  fi
fi

chmod +x dlmac

echo ""
echo "Done. Run ./dlmac to see usage."
echo "Add to PATH for global access (optional):"
echo "  export PATH=\"\$PATH:$PWD\""
