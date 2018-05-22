#!/usr/bin/env bash
# Download supplementary MIPS toolchains which have been removed from Android NDK r17 to fix Android RN builds
# Underlying issue is https://github.com/facebook/react-native/issues/19321

set -e

export SUPPLEMENT_URL='https://appcenterbuildassets.azureedge.net/buildscripts/ndk-toolchains-supplement-r16b-r17.zip'

pushd $ANDROID_HOME/ndk-bundle

echo "Downloading Android NDK toolchains supplement…"
wget -q -O ndk-supplement-temp.zip $SUPPLEMENT_URL

echo "Expanding Android NDK toolchains supplement…"
unzip -q -o ndk-supplement-temp.zip
rm ndk-supplement-temp.zip

popd