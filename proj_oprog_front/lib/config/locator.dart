import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/config/router.dart';
import 'package:proj_oprog_front/metadata_manager/uc/catalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/uc/icatalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/data/services/catalog_service.dart';
import 'package:proj_oprog_front/metadata_manager/data/services/interface/icatalog.dart';
import 'package:proj_oprog_front/metadata_manager/ui/widgets/top_navbar.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/dispatcher/catalog_presenter.dart';
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
  locator.registerSingleton<GoRouter>(router);

  locator.registerLazySingleton<CatalogListViewModelAdapter>(
    () => CatalogListViewModelAdapter(locator<CatalogListViewModel>()),
  );

  locator.registerLazySingleton<VCatalogListView>(
    () => VCatalogListView(locator<CatalogListViewModel>()),
  );

  locator.registerLazySingleton<ICatalogView>(
    () => CatalogPresenter(
      locator<CatalogListViewModelAdapter>(),
      locator<GoRouter>(),
    ),
  );

  locator.registerLazySingleton<ICatalogUseCase>(
    () => CatalogUseCase(
      locator<ICatalogView>(),
      locator<ICatalog>(),
      locator<CatalogListViewModelAdapter>(),
    ),
  );

  locator.registerSingleton<TopNavBar>(TopNavBar(locator<ICatalogUseCase>()));

  locator.registerLazySingleton<ICatalogEventController>(
    () => CatalogEventController(locator<ICatalogUseCase>()),
  );
}
