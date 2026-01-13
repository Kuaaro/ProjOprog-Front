import 'package:proj_oprog_front/sensor/business_logic/isensor.dart';
import 'package:proj_oprog_front/sensor/dto/send_data_request.dart';
import 'package:proj_oprog_front/sensor/presenter/isend_sensor_data_presenter.dart';
import 'package:proj_oprog_front/sensor/use_case/isend_sensor_data.dart';

class SendSensorDataUseCase implements ISendSensorData {
  final ISendSensorDataPresenter presenter;
  final ISensor businessLogic;

  SendSensorDataUseCase(this.presenter, this.businessLogic);

  @override
  void sendSensorData(SendDataRequest request, int dataIndex) async {
    try {
      await businessLogic.sendSensorData(request);
      presenter.showSuccessMessage('Data sent successfully (Dataset $dataIndex)');
    } catch (e) {
      presenter.showErrorMessage('Failed to send data: $e');
    }
  }
}
