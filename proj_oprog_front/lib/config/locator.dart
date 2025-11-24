import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/metadata_manager/global/global_dispatcher.dart';
import 'package:proj_oprog_front/metadata_manager/global/iglobal_dispather.dart';
import 'package:proj_oprog_front/metadata_manager/uc/catalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/uc/icatalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/data/services/catalog_service.dart';
import 'package:proj_oprog_front/metadata_manager/data/services/interface/icatalog.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/dispatcher/catalog_presentation_dispatcher.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/event/catalog_event_controller.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/event/icatalog_event_controller.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view/vcatalog_list_view.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view/vcatalog_window.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view_model/catalog_list_view_model.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view_model/catalog_list_view_model_adapter.dart';
import 'package:proj_oprog_front/metadata_manager/view/dataset/vdataset_window.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<ICatalog>(CatalogService());
  locator.registerSingleton<CatalogListViewModel>(CatalogListViewModel());
  locator.registerSingleton<VCatalogWindow>(VCatalogWindow());
  locator.registerSingleton<VMetadataWindow>(VMetadataWindow());

  locator.registerLazySingleton<CatalogListViewModelAdapter>(
    () => CatalogListViewModelAdapter(locator<CatalogListViewModel>()),
  );

  locator.registerLazySingleton<VCatalogListView>(
    () => VCatalogListView(locator<CatalogListViewModel>()),
  );

  locator.registerLazySingleton<ICatalogView>(
    () => CatalogPresentationDispatcher(
      locator<VCatalogListView>(),
      locator<CatalogListViewModelAdapter>(),
    ),
  );

  locator.registerLazySingleton<ICatalogUseCase>(
    () => CatalogUseCase(
      locator<ICatalogView>(),
      locator<ICatalog>(),
      locator<CatalogListViewModelAdapter>(),
    ),
  );

  locator.registerLazySingleton<ICatalogEventController>(
    () => CatalogEventController(locator<ICatalogUseCase>()),
  );

  locator.registerLazySingleton<IGlobalDispather>(
    () =>
        GlobalDispatcher(locator<VCatalogWindow>(), locator<VMetadataWindow>()),
  );
}
