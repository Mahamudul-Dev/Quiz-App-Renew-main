import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/api/api_urls.dart';
import 'package:quiz_app/model/quiz/quiz_modal.dart';

class DemoQuizController extends GetxController {
  static DemoQuizController get to => Get.find();

  var countdown = 10.obs;
  var isRunning = false.obs;

  final player = AudioPlayer();
  // ignore: prefer_typing_uninitialized_variables

  var currentQuizIndex = 0.obs;

  // Future<void> getQuiz(String subjectId, String topicId) async {
  //   final response = await http
  //       .get(Uri.parse(ApiUrl.quizByTopicApi + subjectId), headers: {
  //     'Authorization': 'Bearer 16|pVqbengoqh1WaLSVNXxTfLoWc77Qq006BAjsfLe6'
  //   });
  //   final data = jsonDecode(response.body.toString());

  //   if (response.statusCode == 200) {
  //     allQuize = QuizModal.fromJson(data)
  //         .data
  //         .where((element) => element.quizTopicsId == topicId)
  //         .toList();
  //     // ignore: invalid_use_of_protected_member
  //     currentQuiz.value.clear();
  //     // ignore: invalid_use_of_protected_member
  //     currentQuiz.value.add(allQuize[currentQuizIndex.value]);
  //   } else {
  //     allQuize = QuizModal.fromJson(data)
  //         .data
  //         .where((element) => element.quizTopicsId == topicId)
  //         .toList();
  //     // ignore: invalid_use_of_protected_member
  //     currentQuiz.value.clear();
  //     // ignore: invalid_use_of_protected_member
  //     currentQuiz.value.add(allQuize[currentQuizIndex.value]);
  //   }
  // }

  nextQuiz() {
    currentQuizIndex.value = currentQuizIndex.value + 1;
    reset();
  }

  void start() async {
    isRunning.value = true;
    player.play(AssetSource('sounds/tiktik.mp3'));
    while (countdown.value > 0) {
      await Future.delayed(const Duration(seconds: 1));
      countdown.value--;
      if (countdown.value == 0) {
        player.stop();
        player.play(AssetSource('Wrong.wav'));
      }
    }
    isRunning.value = false;
  }

  void reset() {
    countdown.value = 10;
    player.stop();
    isRunning.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    start();
  }
}
