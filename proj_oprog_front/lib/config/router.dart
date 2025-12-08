import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/config/locator.dart';
import 'package:proj_oprog_front/home_view.dart';
import 'package:proj_oprog_front/metadata/view/vmetadata.dart';
import 'package:proj_oprog_front/schema/view/add_schema_view.dart';
import 'package:proj_oprog_front/schema/view/edit_schema_view.dart';
import 'package:proj_oprog_front/schema/view/show_schema_list_view.dart';
import 'package:proj_oprog_front/shared/ui/top_navbar.dart';
import 'package:proj_oprog_front/catalog/view/vcatalog.dart';
import 'package:proj_oprog_front/dataset/view/vdataset_edit.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';
import 'package:proj_oprog_front/schema/use_case/ishow_schema_list_uc.dart';
import 'package:proj_oprog_front/schema/view_model/show_schema_list_view_model.dart';


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
            return locator<VCatalog>();
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
            locator<ShowSchemaListViewModel>().clear();
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
<<<<<<< HEAD
        ),
        GoRoute(
          path: '/datasets/:id/edit',
          builder: (context, state) {
            return locator<VDatasetEdit>();  
          },
        ),
=======
        )
>>>>>>> UC-SM-002-004-schemas-add-edit
      ],
    ),
  ],
);
