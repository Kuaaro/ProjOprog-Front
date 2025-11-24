import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/config/router.dart';
import 'package:proj_oprog_front/catalog/use_case/catalog_uc.dart';
import 'package:proj_oprog_front/catalog/use_case/icatalog_uc.dart';
import 'package:proj_oprog_front/catalog/business_logic/catalog_service.dart';
import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';
import 'package:proj_oprog_front/metadata/view/vmetadata.dart';
import 'package:proj_oprog_front/shared/ui/top_navbar.dart';
import 'package:proj_oprog_front/catalog/presenter/pcatalog.dart';
import 'package:proj_oprog_front/catalog/event/catalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/event/icatalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/catalog/view/vcatalog.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_list_view_model.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_list_view_model_adapter.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<ICatalog>(CatalogService());
  locator.registerSingleton<CatalogListViewModel>(CatalogListViewModel());
  locator.registerSingleton<VMetadata>(VMetadata());
  locator.registerSingleton<GoRouter>(router);

  locator.registerLazySingleton<CatalogListViewModelAdapter>(
    () => CatalogListViewModelAdapter(locator<CatalogListViewModel>()),
  );

  locator.registerLazySingleton<VCatalog>(
    () => VCatalog(locator<CatalogListViewModel>()),
  );

  locator.registerLazySingleton<ICatalogView>(
    () => PCatalog(locator<CatalogListViewModelAdapter>(), locator<GoRouter>()),
  );

  locator.registerLazySingleton<ICatalogUseCase>(
    () => CatalogUseCase(locator<ICatalogView>(), locator<ICatalog>()),
  );

  locator.registerSingleton<TopNavBar>(TopNavBar(locator<ICatalogUseCase>()));

  locator.registerLazySingleton<ICatalogEventController>(
    () => CatalogEventController(locator<ICatalogUseCase>()),
  );
}
