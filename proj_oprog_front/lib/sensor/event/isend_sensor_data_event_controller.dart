import 'package:proj_oprog_front/sensor/dto/send_data_request.dart';

abstract class ISendSensorDataEventController {
  void onSendDataPressed(SendDataRequest request, int dataIndex);
}
