import 'package:proj_oprog_front/sensor/business_logic/isensor.dart';
import 'package:proj_oprog_front/sensor/dto/create_sensor_router_request.dart';
import 'package:proj_oprog_front/sensor/presenter/iadd_sensor_router_presenter.dart';
import 'package:proj_oprog_front/sensor/use_case/iadd_sensor_router.dart';

class AddSensorRouter implements IAddSensorRouter {
  final IAddSensorRouterPresenter presenter;
  final ISensor businessLogic;

  AddSensorRouter(this.presenter, this.businessLogic);

  @override
  void showAddSensorRouterForm() {
    presenter.showAddSensorRouterForm();
  }

  @override
  void addSensorRouter(CreateSensorRouterRequest request) async {
    try {
      await businessLogic.addSensorRouter(request);
      presenter.showSuccessMessage('Sensor router added successfully');
      presenter.closeAddSensorRouterForm();
    } catch (e) {
      presenter.showErrorMessage('Failed to add sensor router: $e');
    }
  }

  @override
  void cancelAddSensorRouter() {
    presenter.closeAddSensorRouterForm();
  }
}
