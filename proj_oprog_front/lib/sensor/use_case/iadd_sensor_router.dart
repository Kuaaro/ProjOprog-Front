import 'package:proj_oprog_front/sensor/dto/create_sensor_router_request.dart';

abstract class IAddSensorRouter {
  void showAddSensorRouterForm();
  void addSensorRouter(CreateSensorRouterRequest request);
  void cancelAddSensorRouter();
}
