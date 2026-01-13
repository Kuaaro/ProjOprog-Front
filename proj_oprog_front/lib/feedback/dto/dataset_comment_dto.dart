
class DatasetCommentDto {
  final String content;
  final int datasetId;

  DatasetCommentDto({
    required this.content,
    required this.datasetId,
  });

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'datasetId': datasetId,
    };
  }
}
