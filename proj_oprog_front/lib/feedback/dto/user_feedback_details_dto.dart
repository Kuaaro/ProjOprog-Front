class UserFeedbackDetailsDto {
  final int userFeedbackId;
  final String contactPoint;
  final String message;
  final int datasetId;

  UserFeedbackDetailsDto({
    required this.userFeedbackId,
    required this.contactPoint,
    required this.message,
    required this.datasetId,
  });

  factory UserFeedbackDetailsDto.fromJson(Map<String, dynamic> json) {
    return UserFeedbackDetailsDto(
      userFeedbackId: json['UserFeedbackId'] as int,
      contactPoint: json['ContactPoint'] as String,
      message: json['Message'] as String,
      datasetId: json['DatasetId'] as int,
    );
  }
}
