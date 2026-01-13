import 'package:proj_oprog_front/sensor/dto/send_data_request.dart';
import 'package:proj_oprog_front/sensor/event/isend_sensor_data_event_controller.dart';
import 'package:proj_oprog_front/sensor/use_case/isend_sensor_data.dart';

class SendSensorDataEventController implements ISendSensorDataEventController {
  final ISendSensorData sendSensorDataUseCase;

  SendSensorDataEventController(this.sendSensorDataUseCase);

  @override
  void onSendDataPressed(SendDataRequest request, int dataIndex) {
    sendSensorDataUseCase.sendSensorData(request, dataIndex);
  }
}
