# ePhyLi app

The ePhyLi project app aims to support the promotion of physical literacy in education using digital tools.

## Current version

The current version of the app is: 0.1.7+7 Beta. This version is meant for public testing purposes.

[Download the Android Beta](https://play.google.com/store/apps/details?id=uk.ac.uclan.nkasenides.ephyli)

[Download the iOS Beta](https://apps.apple.com/us/app/ephyli/id6742847948)

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


