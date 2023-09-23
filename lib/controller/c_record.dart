part of '../utils/import/app_import.dart';

class ControolerRecorder extends ChangeNotifier {
  final Record _record = Record();

  // * File Path
  String _afterRecordFilePathe = "";
  bool _isRecording = false;
  bool isTranscribingForBtn = true;

  // * cleare Path of Old File After Record
  clearOldData() {
    _afterRecordFilePathe = "";
    ChangeNotifier();
  }

  void changeisTranscribingForBtn(bool value) {
    isTranscribingForBtn = value;
    notifyListeners();
  }

  startRecord() async {
    final isPermitted = (await AppPermissionManagement.recordingPermission() &&
        await AppPermissionManagement.storagePermission());
    if (!isPermitted) return;
    if (!(await _record.hasPermission())) return;
    final voiceDirPath = await AppStorageManagement.getAudioDir;
    final voiceFilePath = AppStorageManagement.createRecordAudioPath(
        dirPath: voiceDirPath, fileName: "audio_message");

    await _record.start(path: voiceFilePath, encoder: AudioEncoder.wav);
    dev.log("Record start");

    _isRecording = true;
    changeisTranscribingForBtn(false);
    notifyListeners();

    //AppToast.toast('Recording Started');
  }

  stopRecord() async {
    String? audioFilePath;
    if (await _record.isRecording()) {
      audioFilePath = await _record.stop();
      //  AppToast.toast('Recording Stopped');
    }
    dev.log("Audio file path: $audioFilePath");
    _isRecording = false;
    changeisTranscribingForBtn(true);
    _afterRecordFilePathe = audioFilePath ?? "";
    dev.log("000000 $_afterRecordFilePathe");
    notifyListeners();
  }

  List<int> getAudioContent() {
    return io.File(_afterRecordFilePathe).readAsBytesSync().toList();
  }
}
