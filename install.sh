#!/bin/bash
# Updated: 2026-02-06-2030 - Force Refresh

# Configuration
DEB_URL="https://github.com/josedavd-07/Star/releases/latest/download/star-language_1.0.0_amd64.deb"
TEMP_DEB="/tmp/star-language.deb"

echo "🌟 Installing Star Language..."

# Check for root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit 1
fi

# Download .deb package
echo "📥 Downloading Star Language package..."
wget -q --show-progress -O "$TEMP_DEB" "$DEB_URL"

if [ $? -ne 0 ]; then
    echo "❌ Failed to download package"
    exit 1
fi

# Install package
echo "🚀 Installing..."
apt install -y "$TEMP_DEB"

# Cleanup
rm -f "$TEMP_DEB"

echo "✅ Star Language installed successfully!"
echo "🌟 Run 'star --version' to verify installation."
