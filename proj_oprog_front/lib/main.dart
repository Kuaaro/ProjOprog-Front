import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/global_dispatcher.dart';
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

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<ICatalog>(CatalogService());
  locator.registerSingleton<CatalogListViewModel>(CatalogListViewModel());
  locator.registerSingleton<VCatalogWindow>(VCatalogWindow());
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
    () => CatalogUseCase(locator<ICatalogView>(), locator<ICatalog>()),
  );
  locator.registerLazySingleton<ICatalogEventController>(
    () => CatalogEventController(locator<ICatalogUseCase>()),
  );
  locator.registerLazySingleton<GlobalDispatcher>(
    () => GlobalDispatcher(locator<VCatalogWindow>()),
  );
}

class MyApp extends StatelessWidget {
  GlobalDispatcher dispatcher = locator<GlobalDispatcher>();
  ICatalogView catalogView = locator<ICatalogView>();
  ICatalogUseCase catalogUseCase = locator<ICatalogUseCase>();

  @override
  Widget build(BuildContext context) {
    catalogUseCase.showCatalogUC(0);
    return MaterialApp(
      title: 'DoorCE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: Scaffold(appBar: AppBar(), body: dispatcher.getCurrentView()),
    );
  }
}
