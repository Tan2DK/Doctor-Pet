import 'package:doctor_pet/core/data/doctor_question.dart';


final List<DoctorQuestion> doctorQuestionsMock = [
  DoctorQuestion(
    reviewerName: "Emily Johnson",
    reviewTime: "Reviewed 3 Days ago",
    reviewContent:
        "Had a wonderful experience, the diagnosis was quick and precise, really appreciate the help.",
    isRecommended: true,
  ),
  DoctorQuestion(
    reviewerName: "Michael Brown",
    reviewTime: "Reviewed 1 Week ago",
    reviewContent:
        "The consultation felt rushed and I left with more questions than answers.",
    isRecommended: false,
  ),
  DoctorQuestion(
    reviewerName: "Sophia Martin",
    reviewTime: "Reviewed 2 Days ago",
    reviewContent:
        "Very patient and understanding, provided clear explanations about my condition.",
    isRecommended: true,
  ),
  DoctorQuestion(
    reviewerName: "Daniel Garcia",
    reviewTime: "Reviewed 5 Days ago",
    reviewContent:
        "I had to wait a long time to be seen, but the service was good once it started.",
    isRecommended: true,
  )
];
