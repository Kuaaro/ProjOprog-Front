import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/sensor/presenter/iadd_sensor_router_presenter.dart';
import 'package:proj_oprog_front/sensor/view_model/add_sensor_router_view_model.dart';

class AddSensorRouterPresenter implements IAddSensorRouterPresenter {
  final GoRouter router;
  final AddSensorRouterViewModel viewModel;

  AddSensorRouterPresenter(this.router, this.viewModel);

  @override
  void showAddSensorRouterForm() {
    viewModel.reset();
    router.push('/sensor/add-router');
  }

  @override
  void closeAddSensorRouterForm() {
    router.pop();
  }

  @override
  void showSuccessMessage(String message) {
    viewModel.setMessage(message, isError: false);
  }

  @override
  void showErrorMessage(String message) {
    viewModel.setMessage(message, isError: true);
  }
}
