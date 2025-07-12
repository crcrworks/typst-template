#!/bin/bash

set -e

# Detect operating system and set Typst packages directory
case "$(uname -s)" in
    Linux*)
        TYPST_PACKAGES_DIR="$HOME/.local/share/typst/packages/local"
        ;;
    Darwin*)
        TYPST_PACKAGES_DIR="$HOME/Library/Application Support/typst/packages/local"
        ;;
    CYGWIN*|MINGW32*|MINGW64*|MSYS*)
        TYPST_PACKAGES_DIR="$APPDATA/typst/packages/local"
        ;;
    *)
        echo "Unsupported operating system: $(uname -s)"
        exit 1
        ;;
esac

# Find typst.toml file (could be in current directory or subdirectory)
TYPST_TOML=$(find . -name "typst.toml" -type f | head -1)

if [ -z "$TYPST_TOML" ]; then
    echo "Error: Could not find typst.toml file"
    exit 1
fi

# Get package name and version from typst.toml
PACKAGE_NAME=$(grep '^name =' "$TYPST_TOML" | sed 's/name = "\(.*\)"/\1/')
PACKAGE_VERSION=$(grep '^version =' "$TYPST_TOML" | sed 's/version = "\(.*\)"/\1/')

if [ -z "$PACKAGE_NAME" ] || [ -z "$PACKAGE_VERSION" ]; then
    echo "Error: Could not find package name or version in typst.toml"
    exit 1
fi

# Create target directory
TARGET_DIR="$TYPST_PACKAGES_DIR/$PACKAGE_NAME/$PACKAGE_VERSION"
echo "Installing template to: $TARGET_DIR"

# Create directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Copy template files to target directory
if [ -d "$(dirname "$TYPST_TOML")" ] && [ "$(dirname "$TYPST_TOML")" != "." ]; then
    # If typst.toml is in a subdirectory, copy that subdirectory's contents
    SOURCE_DIR="$(dirname "$TYPST_TOML")"
    cp -r "$SOURCE_DIR"/* "$TARGET_DIR/"
else
    # If typst.toml is in current directory, copy all files except install.sh and .git
    rsync -av --exclude='install.sh' --exclude='.git' --exclude='.gitignore' . "$TARGET_DIR/"
fi

echo "Template installed successfully!"
echo "You can now use it in your Typst documents with: #import \"@$PACKAGE_NAME:$PACKAGE_VERSION\""
