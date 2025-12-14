import 'package:proj_oprog_front/catalog/dto/create_catalog_request.dart';
import 'package:proj_oprog_front/catalog/event/icreate_catalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/use_case/icreate_catalog.dart';
import 'package:proj_oprog_front/catalog/use_case/ishow_catalog.dart';
import 'package:proj_oprog_front/catalog/view_model/create_catalog_view_model.dart';
import 'package:proj_oprog_front/catalog/view_model/show_catalog_view_model.dart';

class CreateCatalogEventController implements ICreateCatalogEventController {
  final ICreateCatalog createAppLogic;
  final IShowCatalog showAppLogic;
  final ShowCatalogViewModel showCatalogViewModel;
  final CreateCatalogViewModel createCatalogViewModel;
  CreateCatalogEventController(
    this.createAppLogic,
    this.showAppLogic,
    this.showCatalogViewModel,
    this.createCatalogViewModel,
  );

  @override
  void onNewCatalogPressed() {
    var parentId = showCatalogViewModel.pathStack.isNotEmpty
        ? showCatalogViewModel.pathStack.last.id
        : 0;
    createAppLogic.showNewCatalogForm(parentId);
  }

  @override
  void onCancelPressed() {
    showAppLogic.showCatalog(null);
  }

  @override
  void onNewCatalogSavePressed() {
    var dto = CreateCatalogRequest(
      name: createCatalogViewModel.name,
      description: createCatalogViewModel.description,
      parentCatalog: createCatalogViewModel.parentId,
    );
    createAppLogic.createCatalog(dto);
  }
}
