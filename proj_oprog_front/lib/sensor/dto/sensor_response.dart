class SensorResponse {
  final bool success;
  final String message;

  SensorResponse({
    required this.success,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }

  factory SensorResponse.fromJson(Map<String, dynamic> json) {
    return SensorResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
    );
  }
}
