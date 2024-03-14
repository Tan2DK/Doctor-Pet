class DoctorQuestion {
  final String reviewerName;
  final String reviewTime;
  final String reviewContent;
  final bool isRecommended;
  String doctorReply; // Thêm dòng này

  DoctorQuestion({
    required this.reviewerName,
    required this.reviewTime,
    required this.reviewContent,
    required this.isRecommended,
    this.doctorReply = '', // Khởi tạo giá trị mặc định là chuỗi trống
  });
}
