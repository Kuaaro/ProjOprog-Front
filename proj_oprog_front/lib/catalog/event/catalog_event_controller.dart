import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';
import 'package:proj_oprog_front/catalog/use_case/icatalog_uc.dart';
import 'package:proj_oprog_front/catalog/event/icatalog_event_controller.dart';

class CatalogEventController implements ICatalogEventController {
  final ICatalogUseCase appLogic;
  CatalogEventController(this.appLogic);

  @override
  void onCatalogPressed(NamedIdPair catalogPair) {
    appLogic.showCatalogUC(catalogPair);
  }

  @override
  void onPreviousCatalogPressed() {
    appLogic.showPreviousCatalogUC();
  }
}
