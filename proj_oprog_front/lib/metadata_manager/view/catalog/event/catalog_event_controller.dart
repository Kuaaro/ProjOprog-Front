import 'package:proj_oprog_front/metadata_manager/uc/icatalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/event/icatalog_event_controller.dart';

class CatalogEventController implements ICatalogEventController {
  final ICatalogUseCase appLogic;
  CatalogEventController(this.appLogic);

  @override
  void onCatalogPressed(int catalogId) {
    appLogic.showCatalogUC(catalogId);
  }
}
