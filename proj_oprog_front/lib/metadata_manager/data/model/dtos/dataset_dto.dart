class DatasetDto {
  int id;
  String name;
  String description;
  String contactPoint;
  List<String> keywords;
  int distributionId;
  int schemaId;

  DatasetDto({
    required this.id,
    required this.name,
    required this.description,
    required this.contactPoint,
    required this.keywords,
    required this.distributionId,
    required this.schemaId,
  });
}
