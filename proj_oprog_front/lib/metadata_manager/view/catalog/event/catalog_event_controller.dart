import 'dart:developer';

import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';
import 'package:proj_oprog_front/metadata_manager/uc/icatalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/event/icatalog_event_controller.dart';

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
