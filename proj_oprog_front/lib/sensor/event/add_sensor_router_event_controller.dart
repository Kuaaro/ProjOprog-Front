import 'package:proj_oprog_front/sensor/dto/create_sensor_router_request.dart';
import 'package:proj_oprog_front/sensor/event/iadd_sensor_router_event_controller.dart';
import 'package:proj_oprog_front/sensor/use_case/iadd_sensor_router.dart';
import 'package:proj_oprog_front/sensor/view_model/add_sensor_router_view_model.dart';

class AddSensorRouterEventController implements IAddSensorRouterEventController {
  final IAddSensorRouter addSensorRouterUseCase;
  final AddSensorRouterViewModel viewModel;

  AddSensorRouterEventController(this.addSensorRouterUseCase, this.viewModel);

  @override
  void onAddSensorRouterPressed() {
    addSensorRouterUseCase.showAddSensorRouterForm();
  }

  @override
  void onConfirmAddSensorRouter(CreateSensorRouterRequest request) {
    addSensorRouterUseCase.addSensorRouter(request);
  }

  @override
  void onCancelPressed() {
    addSensorRouterUseCase.cancelAddSensorRouter();
  }
}
