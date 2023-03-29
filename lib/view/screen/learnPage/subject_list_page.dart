import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_app/controller/base_controller.dart';
import 'package:quiz_app/generated/assets.dart';
import 'package:quiz_app/view/components/global_appbar_widget.dart';
import 'package:quiz_app/view/components/subject_related_widget.dart';
import 'package:quiz_app/view/screen/learnPage/lesson_page.dart';

import '../../../controller/learn/subjcet_controller.dart';
import 'lesson_list_page.dart';

class SubjectListPage extends StatelessWidget {
  final _controller = Get.put(SubjcetController());

  SubjectListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: 'Select Your Subject'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: subectMenu(),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget subectMenu() {
    return ListView.builder(
      itemCount: _controller.subjectList.length,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              () => LessonsListPage(
                subject: _controller.subjectList[index],
              ),
            );
            /*if (index == 0) {
              Get.to(LessonListPage(subjectName: "Bangla"));
            } else if (index == 1) {
              Get.to(LessonListPage(subjectName: "English"));
            } else if (index == 2) {
              Get.to(LessonListPage(subjectName: "Math"));
            }*/
          },
          child: subjectListContainer(
            title: "${_controller.subjectList[index].name}",
          ),
        );
      },
    );
  }
}
