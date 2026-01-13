import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proj_oprog_front/sensor/business_logic/isensor.dart';
import 'package:proj_oprog_front/sensor/dto/create_sensor_router_request.dart';
import 'package:proj_oprog_front/sensor/dto/send_data_request.dart';
import 'package:proj_oprog_front/sensor/dto/sensor_response.dart';

class SensorService implements ISensor {
  final String baseUrl = '/api';
  final http.Client client;

  SensorService({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<SensorResponse> addSensorRouter(CreateSensorRouterRequest request) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/data/sensor/sensorrouter'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return SensorResponse(
          success: true,
          message: 'Sensor router added successfully',
        );
      } else {
        throw Exception('Failed to add sensor router: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error adding sensor router: $e');
    }
  }

  @override
  Future<SensorResponse> sendSensorData(SendDataRequest request) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/data/sensor/senddata'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return SensorResponse(
          success: true,
          message: 'Sensor data sent successfully',
        );
      } else {
        throw Exception('Failed to send sensor data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending sensor data: $e');
    }
  }
}
