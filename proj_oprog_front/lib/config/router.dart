import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/view/create_catalog_view.dart';
import 'package:proj_oprog_front/catalog/view_model/create_catalog_view_model.dart';
import 'package:proj_oprog_front/config/locator.dart';
import 'package:proj_oprog_front/home_view.dart';
import 'package:proj_oprog_front/metadata/view/vmetadata.dart';
import 'package:proj_oprog_front/schema/view/add_schema_view.dart';
import 'package:proj_oprog_front/schema/view/edit_schema_view.dart';
import 'package:proj_oprog_front/schema/view/show_schema_list_view.dart';
import 'package:proj_oprog_front/shared/ui/top_navbar.dart';
import 'package:proj_oprog_front/catalog/view/show_catalog_view.dart';
import 'package:proj_oprog_front/dataset/view/vdataset_edit.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';
import 'package:proj_oprog_front/schema/use_case/ishow_schema_list_uc.dart';
import 'package:proj_oprog_front/catalog/view_model/show_catalog_view_model_adapter.dart';
import 'package:proj_oprog_front/catalog/use_case/ishow_catalog.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: locator<TopNavBar>(),
          ),
          body: child,
        );
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeView()),
        GoRoute(
          path: '/catalog',
          builder: (context, state) {
            final adapter = locator<ShowCatalogViewModelAdapter>();
            final currentStack = adapter.getPath();
            final currentCatalog = currentStack.isNotEmpty
                ? currentStack.last
                : null;

            locator<IShowCatalog>().showCatalog(currentCatalog);

            return locator<ShowCatalogView>();
          },
        ),
        GoRoute(
          path: '/catalog/create',
          builder: (context, state) {
            return CreateCatalogView(locator<CreateCatalogViewModel>());
          },
        ),
        GoRoute(
          path: '/metadata',
          builder: (context, state) {
            return locator<VMetadata>();
          },
        ),
        GoRoute(
          path: '/schema',
          builder: (context, state) {
            locator<IShowSchemaListUC>().showSchemaListUC();
            return locator<ShowSchemaListView>();
          },
        ),
        GoRoute(
          path: '/add-schema',
          builder: (context, state) {
            return locator<AddSchemaView>();
          },
        ),
        GoRoute(
          path: '/edit-schema',
          builder: (context, state) {
            return locator<EditSchemaView>();
          },
        ),
        GoRoute(
          path: '/datasets/create',
          builder: (context, state) {
            return VDatasetEdit(locator<DatasetEditViewModel>());
          },
        ),
        GoRoute(
          path: '/datasets/:id/edit',
          builder: (context, state) {
            final idStr = state.pathParameters['id'];
            final id = idStr != null ? int.tryParse(idStr) : null;
            return VDatasetEdit(locator<DatasetEditViewModel>(), datasetId: id);
          },
        ),
      ],
    ),
  ],
);
