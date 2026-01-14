import 'package:proj_oprog_front/sensor/dto/create_sensor_router_request.dart';

abstract class IAddSensorRouterEventController {
  void onAddSensorRouterPressed();
  void onConfirmAddSensorRouter(CreateSensorRouterRequest request);
  void onCancelPressed();
}
