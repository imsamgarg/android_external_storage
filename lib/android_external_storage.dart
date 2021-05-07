import 'dart:io';
import 'package:flutter/services.dart';

///class that will hold Directory type string
class _DirType {
  /// Directory Type
  final String type;

  const _DirType(this.type);
}

///class that will hold all possible Directory types
class DirType {
  ///Android Music directory
  static const _DirType musicDirectory = _DirType("Music");

  ///Android Podcasts directory
  static const _DirType podcastDirectory = _DirType("Podcasts");

  ///Android Ringtones directory
  static const _DirType ringtoneDirectory = _DirType("Ringtones");

  ///Android Alarms directory
  static const _DirType alarmDirectory = _DirType("Alarms");

  ///Android Notifications directory
  static const _DirType notificationsDirectory = _DirType("Notifications");

  ///Android Pictures directory
  static const _DirType picturesDirectory = _DirType("Pictures");

  ///Android Movies directory
  static const _DirType moviesDirectory = _DirType("Movies");

  ///Android Download directory
  static const _DirType downloadDirectory = _DirType("Download");

  ///Android Dcim directory
  static const _DirType DCIMDirectory = _DirType("DCIM");

  ///Android Documents directory
  static const _DirType documentsDirectory = _DirType("Documents");

  ///Android Screenshots directory
  static const _DirType screenshotsDirectory = _DirType("Screenshots");

  ///Android Audiobooks directory
  static const _DirType audioBooksDirectory = _DirType("Audiobooks");
}

///class that provides methods to get external storage path and external public storage path
///example:
///```
///final downloadPath = await AndroidExternalStorage.getExternalStoragePublicDirectory(
///             DirType.downloadDirectory,
///);
///```
/// Note:- some methods only work till android 10
class AndroidExternalStorage {
  ///getExDirectory method name
  static const _getExDirectory = "getExDirectory";

  ///getExPublicDirectory method name

  static const _getExPublicDirectory = "getExPublicDirectory";

  ///getRootDirectory method name
  static const _getRootDirectory = "getRootDirectory";

  ///Method Channel
  static const MethodChannel _channel =
      const MethodChannel('android_external_storage');

  ///Equivalent to android's Environment.getExternalStorageDirectory().getPath().
  ///Return system's external storage path
  ///
  ///Only Works till android 10.
  ///In android 10 you need to add " android:requestLegacyExternalStorage="true" " to the application tag in your app's manifest file
  static Future<String?> getExternalStorageDirectory() async {
    if (!Platform.isAndroid) throw UnsupportedError("Only Works in Android");
    return await _channel.invokeMethod(_getExDirectory);
  }

  ///Equivalent to android's Environment.getRootDirectory().getPath().
  ///Return root of the "system" partition holding the core Android OS
  static Future<String?> getRootDirectory() async {
    if (!Platform.isAndroid) throw UnsupportedError("Only Works in Android");
    return await _channel.invokeMethod(_getRootDirectory);
  }

  ///Equivalent to android's Environment.getExternalStoragePublicDirectory(type).getPath().
  ///Return top-level external storage directory for placing files of a particular type
  ///example:
  ///```
  ///final downloadPath = await AndroidExternalStorage.getExternalStoragePublicDirectory(
  ///             DirType.downloadDirectory,
  ///);
  ///```
  ///Only Works till android 10.
  ///In android 10 you need to add " android:requestLegacyExternalStorage="true" " to the application tag in your app's manifest file
  static Future<String?> getExternalStoragePublicDirectory(
      _DirType type) async {
    if (!Platform.isAndroid) throw UnsupportedError("Only Works in Android");
    return await _channel
        .invokeMethod(_getExPublicDirectory, {"type": type.type});
  }
}
