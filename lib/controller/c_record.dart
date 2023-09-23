part of '../utils/import/app_import.dart';

class ControolerRecorder extends ChangeNotifier {
  final Record _record = Record();

  // * File Path
  String _afterRecordFilePathe = "";
  bool _isRecording = false;

  // * cleare Path of Old File After Record
  clearOldData() {
    _afterRecordFilePathe = "";
    ChangeNotifier();
  }

  startRecord() async {
    final _isPermitted = (await AppPermissionManagement.recordingPermission() &&
        await AppPermissionManagement.storagePermission());
    if (!_isPermitted) return;
    if (!(await _record.hasPermission())) return;
    final _voiceDirPath = await AppStorageManagement.getAudioDir;
    final _voiceFilePath = AppStorageManagement.createRecordAudioPath(
        dirPath: _voiceDirPath, fileName: "audio_message");

    await _record.start(path: _voiceFilePath, encoder: AudioEncoder.wav);
    _isRecording = true;
    notifyListeners();

    AppToast.toast('Recording Started');
  }

  stopRecord() async {
    String? _audioFilePath;
    if (await _record.isRecording()) {
      _audioFilePath = await _record.stop();
      AppToast.toast('Recording Stopped');
    }
    dev.log("Audio file path: $_audioFilePath");
    _isRecording = false;
    _afterRecordFilePathe = _audioFilePath ?? "";
    dev.log("000000 $_afterRecordFilePathe");
    notifyListeners();
  }

  List<int> getAudioContent() {
    return io.File(_afterRecordFilePathe).readAsBytesSync().toList();
  }
}
