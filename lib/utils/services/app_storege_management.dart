part of '../import/app_import.dart';

class AppStorageManagement {
  static Future<String> makeDirectory({required String dirName}) async {
    final io.Directory? directory = await getExternalStorageDirectory();

    final _formattedDirName = '/$dirName/';

    final io.Directory _newDir =
        await io.Directory(directory!.path + _formattedDirName).create();

    return _newDir.path;
  }

  static get getAudioDir async => await makeDirectory(dirName: 'recordings');

  static String createRecordAudioPath(
          {required String dirPath, required String fileName}) =>
      """$dirPath${fileName.substring(0, min(fileName.length, 100))}_${DateTime.now()}.aac""";
}
