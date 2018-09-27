# App Center Build Scripts Examples

This repository contains a collection of build scripts examples for the [App Center](https://appcenter.ms) Build service. Build scripts are a powerful way to control the build process on App Center at three pre-defined stages. More details about the usage of build scripts on App Center can be found in the [documentation](https://docs.microsoft.com/en-us/appcenter/build/custom/scripts/). Feel free to use and modify the scripts as you need them.

# Table of Content

### General
- [Upload build output via SFTP](general/sftp-upload/)
- [Slack build status notification](general/slack/)
- [Notify build status via bash email](general/bash-email/)
- [Report build status next to github commit](general/github-commit-status/)
- [Change google-services.json](general/android/google-services)

### iOS
- [Use App Center pre-release SDK](ios/appcenter-beta-sdk/)

### React Native
- [Run Detox](react-native/detox/)

### Xamarin
- [Run NUnit based tests](xamarin/nunit-test/)
- [Change package name](xamarin/package-name)
- [Change version name](xamarin/version-name)
- [Change app constants](xamarin/app-constants)
- [Change resource dictionary](xamarin/resource-dictionary)

### Flutter
- [iOS Build](flutter/ios-build)
- [Android Build](flutter/android-build)

# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
