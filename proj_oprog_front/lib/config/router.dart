import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/config/locator.dart';
import 'package:proj_oprog_front/home_view.dart';
import 'package:proj_oprog_front/metadata/view/vmetadata.dart';
import 'package:proj_oprog_front/schema/view/vschema.dart';
import 'package:proj_oprog_front/shared/ui/top_navbar.dart';
import 'package:proj_oprog_front/catalog/view/vcatalog.dart';

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
            return locator<VSchema>();
          },
        ),
      ],
    ),
  ],
);
