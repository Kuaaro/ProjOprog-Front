import 'package:proj_oprog_front/sensor/presenter/isend_sensor_data_presenter.dart';
import 'package:proj_oprog_front/sensor/view_model/send_sensor_data_view_model.dart';

class SendSensorDataPresenter implements ISendSensorDataPresenter {
  final SendSensorDataViewModel viewModel;

  SendSensorDataPresenter(this.viewModel);

  @override
  void showSuccessMessage(String message) {
    viewModel.setMessage(message, isError: false);
  }

  @override
  void showErrorMessage(String message) {
    viewModel.setMessage(message, isError: true);
  }
}
