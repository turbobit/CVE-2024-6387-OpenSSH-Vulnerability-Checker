#!/bin/bash

# Set the output directory
OUTPUT_DIR="build"

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Function to build for a specific OS and architecture
build() {
  local GOOS=$1
  local GOARCH=$2
  local OUTPUT=$3

  echo "Building for $GOOS ($GOARCH)..."
  GOOS=$GOOS GOARCH=$GOARCH go build -o $OUTPUT_DIR/$OUTPUT CVE-2024-6387-OpenSSH-Vulnerability-Checker.go

  if [ $? -eq 0 ]; then
    echo "Build for $GOOS ($GOARCH) succeeded."
  else
    echo "Build for $GOOS ($GOARCH) failed."
  fi
}

# Build for Windows (amd64)
build windows amd64 CVE-2024-6387-OpenSSH-Vulnerability-Checker-windows-amd64.exe

# Build for Windows (ARM)
build windows arm64 CVE-2024-6387-OpenSSH-Vulnerability-Checker-windows-arm64.exe

# Build for Linux (amd64)
build linux amd64 CVE-2024-6387-OpenSSH-Vulnerability-Checker-linux-amd64

# Build for Linux (ARM)
build linux arm64 CVE-2024-6387-OpenSSH-Vulnerability-Checker-linux-arm64

# Build for MacOS (amd64)
build darwin amd64 CVE-2024-6387-OpenSSH-Vulnerability-Checker-darwin-amd64

# Build for MacOS (ARM)
build darwin arm64 CVE-2024-6387-OpenSSH-Vulnerability-Checker-darwin-arm64

echo "Build completed. Executables are in the $OUTPUT_DIR directory."
