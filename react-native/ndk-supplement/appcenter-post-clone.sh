#!/usr/bin/env bash
# Download supplementary MIPS toolchains which have been removed from Android NDK r17 to fix Android RN builds
# Underlying issue is https://github.com/facebook/react-native/issues/19321

set -e

NDK_BUNDLE_TOOLCHAINS=$ANDROID_HOME/ndk-bundle/toolchains
MIPS64_TOOLCHAIN=$NDK_BUNDLE_TOOLCHAINS/mips64el-linux-android-4.9/prebuilt/darwin-x86_64/bin
MIPS_TOOLCHAIN=$NDK_BUNDLE_TOOLCHAINS/mipsel-linux-android-4.9/prebuilt/darwin-x86_64/bin

if [ -d $MIPS64_TOOLCHAIN ] && [ -d $MIPS_TOOLCHAIN ]; then
  echo "MIPS64 and MIPS toolchain already installed for NDK bundle - not reinstalling…"
  exit 0
fi

export SUPPLEMENT_URL='https://appcenterbuildassets.azureedge.net/buildscripts/ndk-toolchains-supplement-r16b-r17.zip'

pushd $ANDROID_HOME/ndk-bundle

echo "Downloading Android NDK toolchains supplement…"
wget -q -O ndk-supplement-temp.zip $SUPPLEMENT_URL

echo "Expanding Android NDK toolchains supplement…"
unzip -q -o ndk-supplement-temp.zip
rm ndk-supplement-temp.zip

popd