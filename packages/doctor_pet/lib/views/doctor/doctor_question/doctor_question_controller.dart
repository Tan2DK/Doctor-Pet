import 'package:get/get.dart';
import 'package:doctor_pet/data/data_mock/doctor_question_mock.dart';
import 'package:doctor_pet/core/data/doctor_question.dart';


class DoctorQuestionController extends GetxController {
  final RxList<DoctorQuestion> doctorQuestions = RxList<DoctorQuestion>();
  final RxList<bool> isReply = RxList<bool>();

  @override
  void onInit() {
    super.onInit();
    doctorQuestions
        .addAll(doctorQuestionsMock); 
    isReply.addAll(List.generate(doctorQuestions.length, (_) => false));
  }

  void toggleReply(int index) {
    isReply[index] = !isReply[index];
    isReply.refresh();
  }

  void updateReplyText(int index, String reply) {
    print("Updating reply for question $index: $reply");
    doctorQuestions[index].doctorReply = reply;
  }

  void submitDoctorReply(int index) {
    print(
        "Submitting reply for question $index: ${doctorQuestions[index].doctorReply}");
    doctorQuestions.refresh();
  }
}
