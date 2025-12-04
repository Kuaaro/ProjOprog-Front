import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/config/router.dart';
import 'package:proj_oprog_front/catalog/use_case/catalog_uc.dart';
import 'package:proj_oprog_front/catalog/use_case/icatalog_uc.dart';
import 'package:proj_oprog_front/catalog/business_logic/catalog_service.dart';
import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';
import 'package:proj_oprog_front/metadata/view/vmetadata.dart';
import 'package:proj_oprog_front/schema/presenter/iadd_schema_presenter.dart';
import 'package:proj_oprog_front/schema/presenter/iedit_schema_presenter.dart';
import 'package:proj_oprog_front/schema/use_case/add_schema_uc.dart';
import 'package:proj_oprog_front/schema/use_case/edit_schema_uc.dart';
import 'package:proj_oprog_front/schema/use_case/iadd_schema_uc.dart';
import 'package:proj_oprog_front/schema/use_case/iedit_schema_uc.dart';
import 'package:proj_oprog_front/schema/use_case/ishow_schema_list_uc.dart';
import 'package:proj_oprog_front/schema/view_model/add_schema_view_model.dart';
import 'package:proj_oprog_front/schema/view_model/edit_schema_view_model.dart';
import 'package:proj_oprog_front/shared/ui/top_navbar.dart';
import 'package:proj_oprog_front/catalog/presenter/pcatalog.dart';
import 'package:proj_oprog_front/catalog/event/catalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/event/icatalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/catalog/view/vcatalog.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_list_view_model.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_list_view_model_adapter.dart';
import 'package:proj_oprog_front/schema/business_logic/idata_schema.dart';
import 'package:proj_oprog_front/schema/business_logic/data_schema_service.dart';
import 'package:proj_oprog_front/schema/use_case/show_schema_list_uc.dart';

// AddSchema imports
import 'package:proj_oprog_front/schema/view/add_schema_view.dart';
import 'package:proj_oprog_front/schema/presenter/add_schema_presenter.dart';
import 'package:proj_oprog_front/schema/event/add_schema_controller.dart';

// EditSchema imports
import 'package:proj_oprog_front/schema/view/edit_schema_view.dart';
import 'package:proj_oprog_front/schema/presenter/edit_schema_presenter.dart';
import 'package:proj_oprog_front/schema/event/edit_schema_controller.dart';

// ShowSchema registrations
import 'package:proj_oprog_front/schema/view_model/show_schema_list_view_model.dart';
import 'package:proj_oprog_front/schema/presenter/show_schema_list_presenter.dart';
import 'package:proj_oprog_front/schema/presenter/i_show_schema_list_presenter.dart';
import 'package:proj_oprog_front/schema/view/show_schema_list_view.dart';

// Dataset registrations
import 'package:proj_oprog_front/dataset/business_logic/dataset_service.dart';
import 'package:proj_oprog_front/dataset/business_logic/idataset.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';
import 'package:proj_oprog_front/dataset/use_case/dataset_uc.dart';
import 'package:proj_oprog_front/dataset/use_case/idataset_uc.dart';
import 'package:proj_oprog_front/dataset/presenter/pdataset.dart';
import 'package:proj_oprog_front/dataset/idataset_view.dart';
import 'package:proj_oprog_front/dataset/event/dataset_event_controller.dart';
import 'package:proj_oprog_front/dataset/event/idataset_event_controller.dart';
import 'package:proj_oprog_front/dataset/view/vdataset_edit.dart';

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

  // ShowSchema registrations
  locator.registerSingleton<IDataSchema>(DataSchemaService());
  locator.registerLazySingleton<IShowSchemaListUC>(
    () => ShowSchemaListUC(locator<IDataSchema>(), locator<IShowSchemaListPresenter>()),
  );
  locator.registerSingleton<ShowSchemaListViewModel>(ShowSchemaListViewModel());
  locator.registerLazySingleton<IShowSchemaListPresenter>(
    () => ShowSchemaListPresenter(locator<ShowSchemaListViewModel>(), locator<GoRouter>()),
  );
  locator.registerLazySingleton<ShowSchemaListView>(
    () => ShowSchemaListView(viewModel: locator<ShowSchemaListViewModel>(), addController: locator<AddSchemaController>(), editController: locator<EditSchemaController>()),
  );

  // AddSchema registrations
  locator.registerLazySingleton<IAddSchemaUC>(
    () => AddSchemaUC(locator<IDataSchema>(), locator<IAddSchemaPresenter>()),
  );
  locator.registerSingleton<AddSchemaViewModel>(AddSchemaViewModel());
  locator.registerLazySingleton<IAddSchemaPresenter>(
    () => AddSchemaPresenter(locator<AddSchemaViewModel>()),
  );
  locator.registerLazySingleton<AddSchemaController>(
    () => AddSchemaController(locator<IAddSchemaUC>(), locator<AddSchemaViewModel>()),
  );
  locator.registerLazySingleton<AddSchemaView>(
    () => AddSchemaView(viewModel: locator<AddSchemaViewModel>(), controller: locator<AddSchemaController>()),
  );

  // EditSchema registrations
  locator.registerLazySingleton<IEditSchemaUC>(
    () => EditSchemaUC(locator<IDataSchema>(), locator<IEditSchemaPresenter>()),
  );
  locator.registerSingleton<EditSchemaViewModel>(EditSchemaViewModel());
  locator.registerLazySingleton<IEditSchemaPresenter>(
    () => EditSchemaPresenter(locator<EditSchemaViewModel>()),
  );
  locator.registerLazySingleton<EditSchemaController>(
    () => EditSchemaController(locator<IEditSchemaUC>(), locator<EditSchemaViewModel>()),
  );
  locator.registerLazySingleton<EditSchemaView>(
    () => EditSchemaView(viewModel: locator<EditSchemaViewModel>(), controller: locator<EditSchemaController>()),
  );


//Dataset registrations 
  locator.registerSingleton<IDataset>(DatasetService());
  locator.registerSingleton<DatasetEditViewModel>(DatasetEditViewModel());

   locator.registerLazySingleton<VDatasetEdit>(
    () => VDatasetEdit(locator<DatasetEditViewModel>()),
  );

  locator.registerLazySingleton<IDatasetView>(
    () => PDataset(locator<DatasetEditViewModel>(), locator<GoRouter>()),
  );

  locator.registerLazySingleton<IDatasetUseCase>(
    () => DatasetUseCase(
      locator<IDatasetView>(),
      locator<IDataset>(),
    ),
  );

  locator.registerLazySingleton<IDatasetEventController>(
    () => DatasetEventController(
      locator<IDatasetUseCase>(),
      locator<DatasetEditViewModel>(),
      ),
  );

   
}
