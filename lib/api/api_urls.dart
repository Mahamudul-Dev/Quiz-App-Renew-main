class ApiUrl {
  static const String baseUrl = "http://bcsebook.wcnltd.com/"; //url
  static const String api = "api/"; //api endpoint
  static const String apiUrl = baseUrl + api; //api url
  static const String imageUrl = baseUrl; //imageUrl url

  static const String login = "${apiUrl}login"; //login
  static const String register = "${apiUrl}register"; //register
  /*Token based*/
  static const String user = "${apiUrl}user"; //user

  //apis
  static const String quizSubjectsApi = '${apiUrl}quiz-subjects';
  static const String quiztByTopicApi = '${apiUrl}quiz-numbers/';
  static const String subjectiveExamSubject =
      '${apiUrl}subjective-exam-subjects/';
  static const String topicListBySubId =
      '${apiUrl}subjective-exam-subjects-by-topic/';
  static const String subExamQuestionApi =
      '${apiUrl}subjective-exam-questions/';
}
