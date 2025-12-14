import 'package:proj_oprog_front/catalog/use_case/ishow_catalog.dart';
import 'package:proj_oprog_front/catalog/event/ishow_catalog_event_controller.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class ShowCatalogEventController implements IShowCatalogEventController {
  final IShowCatalog appLogic;
  ShowCatalogEventController(this.appLogic);

  @override
  void onCatalogPressed(NamedIdPair pressedCatalog) {
    appLogic.showCatalog(pressedCatalog);
  }

  @override
  void onPreviousCatalogPressed(NamedIdPair? previous) {
    appLogic.showPreviousCatalog(previous);
  }
}
