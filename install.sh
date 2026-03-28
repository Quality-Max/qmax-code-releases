#!/bin/sh
# qmax-code installer
# Usage: curl -fsSL https://get.qualitymax.io/code | sh

set -e

REPO="Quality-Max/qmax-code-releases"
INSTALL_DIR="/usr/local/bin"
BINARY="qmax-code"

# Detect OS and architecture
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

case "$OS" in
    linux)  OS="linux" ;;
    darwin) OS="darwin" ;;
    *)      echo "Error: Unsupported OS: $OS"; exit 1 ;;
esac

case "$ARCH" in
    x86_64|amd64)   ARCH="amd64" ;;
    aarch64|arm64)  ARCH="arm64" ;;
    *)              echo "Error: Unsupported architecture: $ARCH"; exit 1 ;;
esac

ASSET="${BINARY}-${OS}-${ARCH}.tar.gz"
URL="https://github.com/${REPO}/releases/latest/download/${ASSET}"

echo ""
echo "  /\\_/\\"
echo " ( ^.^ )  Installing qmax-code..."
echo "  > ~ <"
echo ""
echo "  OS:   $OS"
echo "  Arch: $ARCH"
echo ""

# Download
TMPDIR="$(mktemp -d)"
trap "rm -rf $TMPDIR" EXIT

echo "  Downloading ${ASSET}..."
if command -v curl > /dev/null 2>&1; then
    curl -fsSL "$URL" -o "$TMPDIR/$ASSET"
elif command -v wget > /dev/null 2>&1; then
    wget -q "$URL" -O "$TMPDIR/$ASSET"
else
    echo "Error: curl or wget required"
    exit 1
fi

# Extract
echo "  Extracting..."
tar -xzf "$TMPDIR/$ASSET" -C "$TMPDIR"

# Install
echo "  Installing to ${INSTALL_DIR}/${BINARY}..."
if [ -w "$INSTALL_DIR" ]; then
    mv "$TMPDIR/$BINARY-$OS-$ARCH" "$INSTALL_DIR/$BINARY"
else
    sudo mv "$TMPDIR/$BINARY-$OS-$ARCH" "$INSTALL_DIR/$BINARY"
fi
chmod +x "$INSTALL_DIR/$BINARY"

# Verify
VERSION="$($INSTALL_DIR/$BINARY --version 2>/dev/null || echo 'installed')"
echo ""
echo "  ✓ $VERSION"
echo ""
echo "  Run 'qmax-code' to get started!"
echo ""
