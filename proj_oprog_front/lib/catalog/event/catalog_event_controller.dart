import 'package:proj_oprog_front/catalog/use_case/icatalog_uc.dart';
import 'package:proj_oprog_front/catalog/event/icatalog_event_controller.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

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

  @override
  void onNewCatalogPressed(int? parentId) {
    appLogic.showCatalogCreateUC(parentId);
  }

  @override
  void onCreateCatalogPressed(int? parentId){
    appLogic.createCatalogUC(parentId);
  }

  @override
  void onCancelPressed() {
    appLogic.cancelCatalogCreationUC();
  }
}
