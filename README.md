# Starter application

Application with base architecture to start developing new flutter projects.

## Application support

- Multi languages.
- Internet connection.
- Many widgets that are ready to use (Like dialogs ..).

### Some packages should know

#### To be familiar with this code you should check these packages

- [Injectable] (Dependency injection).
- [Super enum] (Used at most with the bloc for events and states).
- [Bloc] and [provider] (State management).
- Other important packages you can see in pubspec.yaml.

We use some packages dependent on code generating so before you start (for check), run:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

Note: Localization and firebase messaging needs to check the initialization:

- For fcm you need to create new Application and use it from manifest.
- For localization do not forget to define languages in ios info.plist

## Package Name

use the [change_app_package_name] package to change package name.

## Launcher Icon

- see the steps in the file [flutter_launcher_icons].

## Native Splash

- see the steps in the file [flutter_native_splash].

## Notifications

#### Firebase

- You need to create new application on firebase and get google-services file and replace the old one with the new one.
- Firebase options file generated automaticaly because we use FlutterFire CLI, if you use the cli you don't have to do anything, otherwise you need to modify firebase init in the [main] file.
- for IOS you need to do the same steps above.

#### Notification Icon

you need to mofify [app_icon] file.

### Launcher Label

#### Android

- Go to file [strings].
- Modify the string resource with name=appName like this:

  ```xml
   <string name="appName">your_app_name_here</string>
  ```

#### IOS

- Go to [info.plist] file
- Fine the dictionary with key : CFBundleName
- Edit dict value to your wanted app label like this :

  ```xml
  <key>CFBundleName</key>
  <string>your_app_name_here</string>
  ```

  [Injectable]: https://pub.dev/packages/injectable
  [Super enum]: https://pub.dev/packages/super_enum
  [Bloc]: https://pub.dev/packages/flutter_bloc
  [provider]: https://pub.dev/packages/provider
  [flutter_native_splash]: ./flutter_native_splash.yaml
  [flutter_launcher_icons]: ./flutter_launcher_icons.yaml
  [main]: ./lib/main.dart
  [colors]: ./android/app/src/main/res/values/colors.xml
  [app_icon]: ./android/app/src/main/res/drawable/app_icon.xml
  [settings]: ./lib/core/common/app_settings.dart
  [strings]: ./android/app/src/main/res/values/strings.xml
  [info.plist]: ios/Runner/Info.plist
  [app_logo.png]: ./assets/images/png/app_logo.png
  [app_logo.svg]: ./assets/images/svg/app_logo.svg
  [logo_text.svg]: ./assets/images/svg/logo_text.svg
  [change_app_package_name]: https://pub.dev/packages/change_app_package_name
