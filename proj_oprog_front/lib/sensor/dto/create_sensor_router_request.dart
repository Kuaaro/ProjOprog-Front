class CreateSensorRouterRequest {
  final int sensorId;
  final int datasetId;

  CreateSensorRouterRequest({
    required this.sensorId,
    required this.datasetId,
  });

  Map<String, dynamic> toJson() {
    return {
      'SensorId': sensorId,
      'DatasetId': datasetId,
    };
  }

  factory CreateSensorRouterRequest.fromJson(Map<String, dynamic> json) {
    return CreateSensorRouterRequest(
      sensorId: json['SensorId'] as int,
      datasetId: json['DatasetId'] as int,
    );
  }
}
