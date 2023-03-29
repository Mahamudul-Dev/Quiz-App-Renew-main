import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/base_controller.dart';
import 'package:quiz_app/model/quiz/quiz-subject.dart';
import 'package:quiz_app/view/components/global_appbar_widget.dart';
import 'package:quiz_app/view/components/subject_related_widget.dart';
import 'package:quiz_app/view/screen/quiz/lesson_page.dart';

class QuizSubjectPage extends StatelessWidget with BaseController {
  QuizSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: 'QUIZ'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 800, child: subectMenu()
                            //ElevatedButton(
                            //   child: Text('check'),
                            //   onPressed: () {
                            //     selectQuizSubjectC.getQuizeSubjectList();
                            //   },
                            // ),
                            )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget subectMenu() {
    return FutureBuilder<List<QuizSubjectModal>>(
        future: selectQuizSubjectC.getQuizeSubjectList(),
        builder: (context, AsyncSnapshot<List<QuizSubjectModal>> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: selectQuizSubjectC.quizeSubjectList.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.to(QuizLession(
                        subjectName: snapshot.data![index].title.toString(),
                        topicList: snapshot.data![index].subjects,
                      )),
                      child: subjectListContainer(
                          title: snapshot.data![index].title.toString()),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
