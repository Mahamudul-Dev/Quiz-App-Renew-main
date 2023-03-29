import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_app/controller/quiz/demo_quiz_controller.dart';
import 'package:quiz_app/model/quiz/quiz_modal.dart';
import 'package:quiz_app/view/components/subject_related_widget.dart';
import 'package:quiz_app/view/screen/quiz/scorePage.dart';

import '../../components/global_appbar_widget.dart';

// ignore: must_be_immutable
class DemoQuizScreen extends StatefulWidget {
  List<Data> quizes;
  final topicId;
  DemoQuizScreen({
    Key? key,
    required this.quizes,
    this.topicId,
  }) : super(key: key);

  @override
  State<DemoQuizScreen> createState() => _DemoQuizScreenState();
}

class _DemoQuizScreenState extends State<DemoQuizScreen> {
  final _controller = Get.put(DemoQuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(
        title: "Quiz Start",
        time: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text(
                _controller.countdown.value != 0
                    ? _controller.countdown.value < 10
                        ? '00:0${_controller.countdown.value}'
                        : '00:${_controller.countdown.value}'
                    : 'Times Up',
                style: TextStyle(
                  color: _controller.countdown.value <= 3
                      ? Colors.red
                      : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 50,
                    width: 200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                      "QUESTION ${_controller.currentQuizIndex.value + 1}/${widget.quizes[0].quizes.length}",
                      style: const TextStyle(fontSize: 20),
                    ))),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            HexColor("#323361"),
                            HexColor("#2E2E54"),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                          child: Text(
                        widget
                            .quizes[0]
                            .quizes[_controller.currentQuizIndex.value]
                            .question,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            HexColor("#323361"),
                            HexColor("#2E2E54"),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => QuizListContainer(
                                title: widget
                                    .quizes[0]
                                    .quizes[_controller.currentQuizIndex.value]
                                    .option1,
                                isSelected: false),
                          ),
                          Obx(
                            () => QuizListContainer(
                                title: widget
                                    .quizes[0]
                                    .quizes[_controller.currentQuizIndex.value]
                                    .option2,
                                isSelected: false),
                          ),
                          Obx(
                            () => QuizListContainer(
                                title: widget
                                    .quizes[0]
                                    .quizes[_controller.currentQuizIndex.value]
                                    .option3,
                                isSelected: false),
                          ),
                          Obx(
                            () => QuizListContainer(
                                title: widget
                                    .quizes[0]
                                    .quizes[_controller.currentQuizIndex.value]
                                    .option4,
                                isSelected: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          HexColor("#323361"),
                          HexColor("#2E2E54"),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          _controller.nextQuiz();
                        },
                        child: const Text(
                          "NEXT",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
