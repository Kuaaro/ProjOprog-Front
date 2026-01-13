import 'package:proj_oprog_front/sensor/dto/send_data_request.dart';

abstract class ISendSensorData {
  void sendSensorData(SendDataRequest request, int dataIndex);
}
