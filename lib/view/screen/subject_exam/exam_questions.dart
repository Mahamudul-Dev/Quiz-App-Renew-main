import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_app/controller/sbject_exam_controller/sub_exam_question_controller.dart';
import 'package:quiz_app/model/subject_exam/sub_exam_question_modal.dart';
import 'package:quiz_app/view/components/global_appbar_widget.dart';
import 'package:quiz_app/view/components/subject_related_widget.dart';

class SubExamQuestionScreen extends StatelessWidget {
  SubExamQuestionScreen({super.key, required this.topicId});
  final SubExamQuestionController controller =
      Get.put(SubExamQuestionController());
  final String topicId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarWidget(title: 'Take Exam'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
              height: 700,
              width: MediaQuery.of(context).size.width,
              child: buildQuestion(controller, topicId)),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.send)));
  }

  Widget buildQuestion(SubExamQuestionController controller, String topicId) {
    return FutureBuilder<SubExamQuestionModal>(
      future: controller.getQuestions(topicId),
      builder: (context, AsyncSnapshot<SubExamQuestionModal> snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  return asmbleQuestionAns(snapshot.data!.data[index].question,
                      snapshot.data!.data, index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 1.0,
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget buildQuestionBox(String question) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
            question,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }

  Widget buildAnsware(Data answere) {
    return Card(
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
            child: ListView(
              children: [
                QuizListContainer(title: answere.option1, isSelected: false),
                QuizListContainer(title: answere.option2, isSelected: true),
                QuizListContainer(title: answere.option3, isSelected: false),
                QuizListContainer(title: answere.option4, isSelected: false),
              ],
            )),
      ),
    );
  }

  Widget asmbleQuestionAns(String question, List<Data> answere, int index) {
    return SizedBox(
      height: 680,
      child: ListView(
        children: [buildQuestionBox(question), buildAnsware(answere[index])],
      ),
    );
  }
}
