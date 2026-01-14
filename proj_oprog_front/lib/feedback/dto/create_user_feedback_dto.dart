class CreateUserFeedbackDto {
  final String contactPoint;
  final String message;
  final int datasetId;

  CreateUserFeedbackDto({
    required this.contactPoint,
    required this.message,
    required this.datasetId,
  });

  Map<String, dynamic> toJson() {
    return {
      'ContactPoint': contactPoint,
      'Message': message,
      'DatasetId': datasetId,
    };
  }
}
