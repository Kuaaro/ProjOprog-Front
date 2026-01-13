import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/event/create_catalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/event/icreate_catalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/event/ishow_catalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/event/show_catalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/presenter/create_catalog_presenter.dart';
import 'package:proj_oprog_front/catalog/presenter/icreate_catalog_presenter.dart';
import 'package:proj_oprog_front/catalog/use_case/create_catalog.dart';
import 'package:proj_oprog_front/catalog/use_case/icreate_catalog.dart';
import 'package:proj_oprog_front/catalog/view/create_catalog_view.dart';
import 'package:proj_oprog_front/catalog/view_model/create_catalog_view_model.dart';
import 'package:proj_oprog_front/config/router.dart';
import 'package:proj_oprog_front/catalog/use_case/show_catalog.dart';
import 'package:proj_oprog_front/catalog/use_case/ishow_catalog.dart';
import 'package:proj_oprog_front/catalog/business_logic/catalog_service.dart';
import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';
import 'package:proj_oprog_front/metadata/view/vmetadata.dart';
import 'package:proj_oprog_front/schema/event/show_schema_list_controller.dart';
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
import 'package:proj_oprog_front/catalog/presenter/show_catalog_presenter.dart';
import 'package:proj_oprog_front/catalog/presenter/ishow_catalog_presenter.dart';
import 'package:proj_oprog_front/catalog/view/show_catalog_view.dart';
import 'package:proj_oprog_front/catalog/view_model/show_catalog_view_model.dart';
import 'package:proj_oprog_front/catalog/view_model/show_catalog_view_model_adapter.dart';
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
import 'package:proj_oprog_front/dataset/view/vdataset_edit.dart';
import 'package:proj_oprog_front/feedback/service/feedback_service.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<ICatalog>(CatalogService());
  locator.registerSingleton<ShowCatalogViewModel>(ShowCatalogViewModel());
  locator.registerSingleton<CreateCatalogViewModel>(
    CreateCatalogViewModel(parentId: 0),
  );
  locator.registerSingleton<VMetadata>(VMetadata());
  locator.registerSingleton<FeedbackService>(FeedbackService());
  locator.registerSingleton<GoRouter>(router);

  locator.registerLazySingleton<ShowCatalogViewModelAdapter>(
    () => ShowCatalogViewModelAdapter(locator<ShowCatalogViewModel>()),
  );

  locator.registerLazySingleton<ShowCatalogView>(
    () => ShowCatalogView(locator<ShowCatalogViewModel>()),
  );
  locator.registerLazySingleton<CreateCatalogView>(
    () => CreateCatalogView(locator<CreateCatalogViewModel>()),
  );

  locator.registerLazySingleton<IShowCatalogPresenter>(
    () => ShowCatalogPresenter(
      locator<ShowCatalogViewModelAdapter>(),
      locator<GoRouter>(),
    ),
  );
  locator.registerLazySingleton<ICreateCatalogPresenter>(
    () => CreateCatalogPresenter(
      locator<GoRouter>(),
      locator<CreateCatalogViewModel>(),
    ),
  );

  locator.registerLazySingleton<IShowCatalog>(
    () => ShowCatalog(locator<IShowCatalogPresenter>(), locator<ICatalog>()),
  );

  locator.registerLazySingleton<ICreateCatalog>(
    () => CreateCatalog(
      locator<ICreateCatalogPresenter>(),
      locator<ICatalog>(),
      locator<IShowCatalog>(),
    ),
  );

  locator.registerLazySingleton<IShowCatalogEventController>(
    () => ShowCatalogEventController(locator<IShowCatalog>()),
  );



  locator.registerLazySingleton<ICreateCatalogEventController>(
    () => CreateCatalogEventController(
      locator<ICreateCatalog>(),
      locator<IShowCatalog>(),
      locator<ShowCatalogViewModel>(),
      locator<CreateCatalogViewModel>(),
    ),
  );

  // ShowSchema registrations
  locator.registerSingleton<IDataSchema>(DataSchemaService());
  locator.registerLazySingleton<IShowSchemaListUC>(
    () => ShowSchemaListUC(
      locator<IDataSchema>(),
      locator<IShowSchemaListPresenter>(),
    ),
  );
  locator.registerSingleton<ShowSchemaListViewModel>(ShowSchemaListViewModel());
  locator.registerLazySingleton<IShowSchemaListPresenter>(
    () => ShowSchemaListPresenter(
      locator<ShowSchemaListViewModel>(),
      locator<GoRouter>(),
    ),
  );
  locator.registerLazySingleton<ShowSchemaListView>(
    () => ShowSchemaListView(
      viewModel: locator<ShowSchemaListViewModel>(),
      controller: locator<ShowSchemaListController>(),
    ),
  );
  locator.registerLazySingleton<ShowSchemaListController>(
    () => ShowSchemaListController(
      viewModel: locator<ShowSchemaListViewModel>(),
      addSchemaUC: locator<IAddSchemaUC>(),
      editSchemaUC: locator<IEditSchemaUC>(),
    ),
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
    () => AddSchemaController(
      addSchemaUC: locator<IAddSchemaUC>(),
      showSchemaListUC: locator<IShowSchemaListUC>(),
      viewModel: locator<AddSchemaViewModel>(),
    ),
  );
  locator.registerLazySingleton<AddSchemaView>(
    () => AddSchemaView(
      viewModel: locator<AddSchemaViewModel>(),
      controller: locator<AddSchemaController>(),
    ),
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
    () => EditSchemaController(
      editSchemaUC: locator<IEditSchemaUC>(),
      showSchemaListUC: locator<IShowSchemaListUC>(),
      viewModel: locator<EditSchemaViewModel>(),
    ),
  );
  locator.registerLazySingleton<EditSchemaView>(
    () => EditSchemaView(
      viewModel: locator<EditSchemaViewModel>(),
      controller: locator<EditSchemaController>(),
    ),
  );

  //Dataset registrations
  locator.registerSingleton<IDataset>(DatasetService());
  locator.registerSingleton<DatasetEditViewModel>(DatasetEditViewModel());

  locator.registerLazySingleton<IDatasetView>(
    () => PDataset(locator<DatasetEditViewModel>(), locator<GoRouter>()),
  );

  locator.registerLazySingleton<IDatasetUseCase>(
    () => DatasetUseCase(
      locator<IDatasetView>(),
      locator<IDataset>(),
      locator<IDataSchema>(),
    ),
  );

  locator.registerLazySingleton<DatasetEventController>(
    () => DatasetEventController(
      locator<IDatasetUseCase>(),
      locator<DatasetEditViewModel>(),
    ),
  );
}
