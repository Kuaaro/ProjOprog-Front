class DistributionDto {
  int id;
	String accessUrl;
	String description;
	String format;
	bool availability;

  DistributionDto({
    required this.id,
    required this.accessUrl,
    required this.description,
    required this.format,
    required this.availability
  });
}