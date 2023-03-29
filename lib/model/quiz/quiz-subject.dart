// ignore: file_names
class QuizSubjectModal {
  String? title;
  List<dynamic>? subjects;

  QuizSubjectModal({
    this.title,
    this.subjects,
  });

  QuizSubjectModal.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    subjects = json['subjects'] as List?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['subjects'] = subjects;
    return json;
  }
}
