import 'package:proj_oprog_front/sensor/dto/create_sensor_router_request.dart';
import 'package:proj_oprog_front/sensor/dto/send_data_request.dart';
import 'package:proj_oprog_front/sensor/dto/sensor_response.dart';

abstract class ISensor {
  Future<SensorResponse> addSensorRouter(CreateSensorRouterRequest request);
  Future<SensorResponse> sendSensorData(SendDataRequest request);
}
