
class DataRelatedRequestDto {
  final String title;
  final String description;
  final int? datasetId;

  DataRelatedRequestDto({
    required this.title,
    required this.description,
    this.datasetId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'datasetId': datasetId,
    };
  }
}
