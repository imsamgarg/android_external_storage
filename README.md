# android_external_storage

android_external_storage is minimal flutter plugin for accessing android's external/shared storage path.
This plugin is based on https://pub.dev/packages/ext_storage plugin. 


## Features

> **NOTE** This plugin is only supported Android.

  AndroidExternalStorage package calls Android native code.

|     AndroidExternalStorage                                     | Android Native                                  |
|------------------------------------------------|-------------------------------------------------|
|     AndroidExternalStorage.getExternalStorageDirectory()       | Environment.getExternalStorageDirectory()       |
|     AndroidExternalStorage.getExternalStoragePublicDirectory() | Environment.getExternalStoragePublicDirectory() |
|     AndroidExternalStorage.getRootDirectory()                  | Environment.getRootDirectory()  

`    AndroidExternalStorage.getExternalStoragePublicDirectory()` needs Public Directory Type argument same as native `getExternalStoragePublicDirectory()`.

|     DirType                         | Android Native                      |
|-------------------------------------|-------------------------------------|
|     DirType.musicDirectory          | Environment.DIRECTORY_MUSIC         |
|     DirType.podcastDirectory        | Environment.DIRECTORY_PODCASTS      |
|     DirType.ringtoneDirectory       | Environment.DIRECTORY_RINGTONES     |
|     DirType.alarmDirectory          | Environment.DIRECTORY_ALARMS        |
|     DirType.notificationsDirectory  | Environment.DIRECTORY_NOTIFICATIONS |
|     DirType.picturesDirectory       | Environment.DIRECTORY_PICTURES      |
|     DirType.moviesDirectory         | Environment.DIRECTORY_MOVIES        |
|     DirType.downloadDirectory       | Environment.DIRECTORY_DOWNLOADS     |
|     DirType.DCIMDirectory           | Environment.DIRECTORY_DCIM          |
|     DirType.documentsDirectory      | Environment.DIRECTORY_DOCUMENTS     |
|     DirType.screenshotsDirectory    | Environment.DIRECTORY_SCREENSHOTS   |
|     DirType.audioBooksDirectory     | Environment.DIRECTORY_AUDIOBOOKS    |

## Example

```dart
void _example1() async {
  var path = await AndroidExternalStorage.getExternalStorageDirectory();
  print(path);  // /storage/emulated/0
}

void _example2() async {
  var path = await AndroidExternalStorage.getExternalStoragePublicDirectory(DirType.picturesDirectory);
  print(path);  // /storage/emulated/0/Pictures
}

void _example3()async{
  var path = await AndroidExternalStorage.getRootDirectory();;
  print(path);  // /system
}
```

## Author

sam garg

## LICENCE

MIT LICENCE


Based on https://pub.dev/packages/ext_storage.
