import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/config/locator.dart';
import 'package:proj_oprog_front/home_view.dart';
import 'package:proj_oprog_front/metadata_manager/uc/icatalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/ui/widgets/top_navbar.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view/vcatalog_list_view.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view/vcatalog_window.dart';
import 'package:proj_oprog_front/metadata_manager/view/dataset/vdataset_window.dart';

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
            return locator<VCatalogListView>();
          },
        ),
        GoRoute(
          path: '/metadata',
          builder: (context, state) {
            return locator<VMetadataWindow>();
          },
        ),
      ],
    ),
  ],
);
