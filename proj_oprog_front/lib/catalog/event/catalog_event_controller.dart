import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';
import 'package:proj_oprog_front/catalog/use_case/icatalog_uc.dart';
import 'package:proj_oprog_front/catalog/event/icatalog_event_controller.dart';

class CatalogEventController implements ICatalogEventController {
  final ICatalogUseCase appLogic;
  CatalogEventController(this.appLogic);

  @override
  void onCatalogPressed(NamedIdPair pressedCatalog) {
    appLogic.showCatalogUC(pressedCatalog);
  }

  @override
  void onPreviousCatalogPressed(NamedIdPair? previous) {
    appLogic.showPreviousCatalogUC(previous);
  }
}
