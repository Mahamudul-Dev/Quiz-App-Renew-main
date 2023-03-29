class ExamTopicModal {
  ExamTopicModal({
    required this.error,
    required this.data,
  });
  late final bool error;
  late final List<Data> data;

  ExamTopicModal.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.subjectId,
    required this.topicName,
    required this.createdAt,
    this.updatedAt,
    this.examSubject,
  });
  late final int id;
  late final String subjectId;
  late final String topicName;
  late final String createdAt;
  late final Null updatedAt;
  late final Null examSubject;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    topicName = json['topic_name'];
    createdAt = json['created_at'];
    updatedAt = null;
    examSubject = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subject_id'] = subjectId;
    _data['topic_name'] = topicName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['exam_subject'] = examSubject;
    return _data;
  }
}
