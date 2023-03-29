import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/quiz/quize_number_controller.dart';
import 'package:quiz_app/model/quiz/quiz_modal.dart';
import 'package:quiz_app/view/components/global_appbar_widget.dart';
import 'package:quiz_app/view/components/subject_related_widget.dart';
import 'package:quiz_app/view/screen/quiz/start_quiz_screen.dart';

class QuizNumberPage extends StatelessWidget {
  final String topicId;
  QuizNumberPage({Key? key, required this.topicId}) : super(key: key);
  QuizNumberController controller = Get.put(QuizNumberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: "Quiz"),
      body: FutureBuilder<QuizNumberModal>(
        future: controller.getQuiz(topicId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data[0].quizes.length,
              itemBuilder: (context, index) {
                int s = index + 1;
                return InkWell(
                    onTap: () => Get.to(DemoQuizScreen(
                          quizes: snapshot.data!.data,
                          topicId: snapshot.data!.data[index].id,
                        )),
                    child:
                        QuizListContainer(title: 'Quiz:$s', isSelected: false));
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
