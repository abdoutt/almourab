import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchItemView extends StatefulWidget {
  const SearchItemView({super.key});

  @override
  State<SearchItemView> createState() => _SearchItemViewState();
}

class _SearchItemViewState extends State<SearchItemView> {
  List<Map<String, dynamic>> source = [];
  List<RouteArguments> foundInColumns = [];
  TextEditingController filter = TextEditingController();
  String transcribedText = "";
  final FlutterSoundRecorder recorder = FlutterSoundRecorder();

  Future<void> requestPermissions() async {
    await Permission.microphone.request();
    await Permission.speech.request();
  }

  Future<void> initRecorder() async {
   // Check permissions before initializing
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw Exception("Microphone permission not granted");
    }

    await recorder.openAudioSession();
  }

  Future<void> startRecording() async {
    if (!recorder.isRecording) {
      await recorder.startRecorder(toFile: "audio");
    }
  }

  Future<void> stopRecording() async {
    if (!recorder.isRecording) {
      await recorder.stopRecorder();
    }
  }

  stt.SpeechToText speech = stt.SpeechToText();
  String lastWords = '';

  Future<void> transcribeAudio() async {
    bool available = await speech.initialize(
        onError: (val) => print('onError: $val'),
        onStatus: (val) => print('onStatus: $val'));
    if (available) {
      speech.listen(onResult: (val) {
        lastWords = val.recognizedWords;
        // Use setState() to update the UI if you're using a StatefulWidget
      });
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermissions().then((_) {
      initRecorder();
    });
  }

  registeraudi() {
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
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (transcribedText.isNotEmpty) Text(transcribedText),
              ElevatedButton(
                onPressed: () => startRecording(),
                child: Text("Start Recording"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await stopRecording();
                  await transcribeAudio();
                },
                child: Text("Stop and Transcribe"),
              ),
            ],
          ),
        );
      },
    );
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

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
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
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                foundInColumns[i].body,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                            ),
                            Text(
                              getStatusString(foundInColumns[i].title),
                              style:
                                  TextStyle(fontSize: 15, color: secondColor),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ))
      ],
    );
  }
}
