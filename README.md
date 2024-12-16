# ePhyLi app

The ePhyLi project app aims to support the promotion of physical literacy in education using digital tools.

## Current version

The current version of the app is: 0.1.3+3 Beta. This version is meant for public testing purposes.

## Download the Android Alpha

[ePhyLi Version 0.1.1 Beta](https://github.com/nkasenides/ephyli/raw/refs/heads/main/release/ephyli-0.1.1.apk) [~28MB]

*Important note* You must allow app sideloading on your device to install. Follow [this guide](https://www.howtogeek.com/313433/how-to-sideload-apps-on-android/) to enable app sideloading on your device.

## Build for Android (Play store)

1. Update version in `pubspec.yaml` and in `README.md` (Current version section)
2. Run `flutter clean`
3. Ensure you have defined file `android\key.properties` containing the appropriate key values for: 
   * `storePassword=...`
   * `keyPassword=...`
   * `keyAlias=...`
   * `storeFile=...`
4. Run `flutter build appbundle`
   * The release bundle for your app is created at ``[project]/build/app/outputs/bundle/release/app-release.aab``.
   * Optionally, create the _native debug symbols for app bundle_ (see [how](https://stackoverflow.com/a/68778908))
      * Goto ``[YOUR_PROJECT]\build\app\intermediates\merged_native_libs\release\out\lib``
      * Create a ``.zip`` file containing the 3 folders: ``arm64-v8a``, ``armeabi-v7a``, ``x86_64``.
   * Follow the [official instructions](https://docs.flutter.dev/deployment/android) to upload the bundle on Google Developer Console


