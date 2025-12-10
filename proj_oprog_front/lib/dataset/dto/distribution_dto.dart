class DistributionDto {
  int distributionId;
  String accessURL;
  String description;
  String format;
  bool availability;

  DistributionDto({
    required this.distributionId,
    required this.accessURL,
    required this.description,
    required this.format,
    required this.availability,
  });

  factory DistributionDto.fromJson(Map<String, dynamic> json) {
    return DistributionDto(
      distributionId: json['distributionId'] as int,
      accessURL: json['accessUrl'] as String,
      description: json['description'] as String,
      format: json['format'] as String,
      availability: json['availability'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'distributionId': distributionId,
      'accessUrl': accessURL,
      'description': description,
      'format': format,
      'availability': availability,
    };
  }
}

