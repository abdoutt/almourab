import 'package:flutter_sound/flutter_sound.dart';

class MyRecorder {
  FlutterSoundRecorder? _audioRecorder;

  Future<void> init() async {
    _audioRecorder = FlutterSoundRecorder();

    // Check permissions before initializing
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw Exception("Microphone permission not granted");
    }

    await _audioRecorder!.openAudioSession();
    // Additional configuration for the recorder can go here
  }

  Future<void> startRecording() async {
    if (!_audioRecorder!.isRecording) {
      await _audioRecorder!.startRecorder(toFile: 'path/to/save/audio.mp4');
    }
  }

  Future<void> stopRecording() async {
    if (_audioRecorder!.isRecording) {
      await _audioRecorder!.stopRecorder();
    }
  }

  void dispose() {
    _audioRecorder!.closeAudioSession();
    _audioRecorder = null;
  }
}
