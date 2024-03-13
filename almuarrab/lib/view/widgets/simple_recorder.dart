import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../constants/constants.dart';

typedef _Fn = void Function();

const theSource = AudioSource.microphone;

class SimpleRecorder extends StatefulWidget {
  const SimpleRecorder({super.key});

  @override
  State<SimpleRecorder> createState() => _SimpleRecorderState();
}

class _SimpleRecorderState extends State<SimpleRecorder> {
  List<Map<String, dynamic>> source = [];
  List<RouteArguments> foundInColumns = [];
  TextEditingController filter = TextEditingController();
  Codec _codec = Codec.aacMP4;
  String _mPath = 'tau_file.mp4';
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;

  @override
  void dispose() {
    _mPlayer!.closePlayer();
    _mPlayer = null;

    _mRecorder!.closeRecorder();
    _mRecorder = null;
    super.dispose();
  }

  Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder!.openRecorder();
    if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _mPath = 'tau_file.webm';
      if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited = true;
        return;
      }
    }
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    _mRecorderIsInited = true;
  }

  Future<void> record() async {
    _mRecorder!
        .startRecorder(
      toFile: _mPath,
      codec: _codec,
      audioSource: theSource,
    )
        .then((value) {
      setState(() {});
    });
    await Future.delayed(const Duration(seconds: 10), () async {
      await stopRecorder();
      await translateVoiceToText(_mPath);
    });
  }

  Future<void> stopRecorder() async {
    await _mRecorder!.stopRecorder().then((value) {
      setState(() {
        //var url = value;
        _mplaybackReady = true;
      });
    });
  }

  void play() {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder!.isStopped &&
        _mPlayer!.isStopped);
    _mPlayer!
        .startPlayer(
            fromURI: _mPath,
            //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
            whenFinished: () {
              setState(() {});
            })
        .then((value) {
      setState(() {});
    });
  }

  void stopPlayer() {
    _mPlayer!.stopPlayer().then((value) {
      setState(() {});
    });
  }

// ----------------------------- UI --------------------------------------------

  _Fn? getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
      return null;
    }
    return _mRecorder!.isStopped ? record : stopRecorder;
  }

  _Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
      return null;
    }
    return _mPlayer!.isStopped ? play : stopPlayer;
  }

  search(MenuController controller) async {
    if (filter.text.isNotEmpty) {
      source = [];
      source = await DBHelper().searchDatabase(filter.text);
      setState(() {
        foundInColumns = [];
      });
      List<RouteArguments> foundInColumnstemp = [];
      for (var match in source) {
        for (var column in match.keys) {
          bool exist = true;
          var existitem = foundInColumnstemp.where((element) =>
              element.title == column && element.body == match[column]);
          if (existitem.isNotEmpty) {
            exist = false;
          }
          if (match[column].toString().contains(filter.text) && exist) {
            foundInColumnstemp.add(RouteArguments(column, match[column]));
          }
        }
      }
      setState(() {
        foundInColumns = foundInColumnstemp;
      });
      if (controller.isOpen) {
        controller.close();
      } else {
        controller.open();
      }
    }
  }

  registeraudi() async {
    filter.text = "";
    foundInColumns = [];
    source = [];
    await _mPlayer!.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    await openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });

    record();

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black87,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: null,
          content: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              height: 300,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: Text("Loading")
              //),
              //],
              ),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 10), () async {
      Get.back();
    });
  }

  Future<void> translateVoiceToText(String filePath) async {
    String googleAPIKey = "AIzaSyCm51y3NEgqZQKdfcUmyy0Cgq8gQvv6mI0";
    String url =
        "https://speech.googleapis.com/v1/speech:recognize?key=$googleAPIKey";
    String audioContent = base64Encode(File(filePath).readAsBytesSync());

    Map<String, dynamic> requestBody = {
      "config": {
        "encoding": "LINEAR16", // For example, "LINEAR16"
        "sampleRateHertz": 16000, // Adjust according to your recording settings
        "languageCode": "ar" // Set to the language you're transcribing
      },
      "audio": {"content": audioContent}
    };

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        // Process the response - for simplicity, we'll just print it here
        print(jsonResponse);
      } else {
        print("Failed to transcribe audio: ${response.body}");
      }
    } catch (e) {
      print("An error occurred while transcribing the audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget makeBody() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(children: [
              ElevatedButton(
                onPressed: getRecorderFn(),
                //color: Colors.white,
                //disabledColor: Colors.grey,
                child: Text(_mRecorder!.isRecording ? 'Stop' : 'Record'),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(_mRecorder!.isRecording
                  ? 'Recording in progress'
                  : 'Recorder is stopped'),
            ]),
          ),
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(children: [
              ElevatedButton(
                onPressed: getPlaybackFn(),
                //color: Colors.white,
                //disabledColor: Colors.grey,
                child: Text(_mPlayer!.isPlaying ? 'Stop' : 'Play'),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(_mPlayer!.isPlaying
                  ? 'Playback in progress'
                  : 'Player is stopped'),
            ]),
          ),
        ],
      );
    }

    return Column(
      children: [
        MenuAnchor(
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return TextField(
              controller: filter,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hoverColor: Colors.transparent,
                prefixStyle: const TextStyle(color: Colors.black38),
                filled: true,
                contentPadding: const EdgeInsets.all(10.0),
                hintStyle: const TextStyle(color: Colors.black87, fontSize: 15),
                prefixIcon: InkWell(
                    onTap: () {
                      search(controller);
                    },
                    child: Image.asset("assets/icons/search_icon.png")),
                suffixIcon: InkWell(
                    onTap: () {
                      registeraudi();
                    },
                    child: Image.asset("assets/icons/search_with_voice.png")),
                hintText: 'ابحث عن الكلمات, الأبواب',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: secondColor.withOpacity(0.30),
                    width: 0.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: secondColor70,
                    width: 0.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    borderSide: BorderSide(
                      color: secondColor.withOpacity(0.30),
                      width: 0.0,
                    )),
              ),
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 18),
              autocorrect: false,
            );
          },
          menuChildren: [
            SizedBox(
                height: 250,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < foundInColumns.length; i++)
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(7.0),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Text(
                                    foundInColumns[i].body,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                ),
                                Text(
                                  getStatusString(foundInColumns[i].title),
                                  style: TextStyle(
                                      fontSize: 15, color: secondColor),
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ))
          ],
        ),
        makeBody()
      ],
    );
  }
}
