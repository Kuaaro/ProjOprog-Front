class SendDataRequest {
  final int sensorId;
  final String data;

  SendDataRequest({
    required this.sensorId,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'SensorId': sensorId,
      'Data': data,
    };
  }

  factory SendDataRequest.fromJson(Map<String, dynamic> json) {
    return SendDataRequest(
      sensorId: json['SensorId'] as int,
      data: json['Data'] as String,
    );
  }
}
